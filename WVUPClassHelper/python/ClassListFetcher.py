#!/usr/bin/env python

import sys
import argparse
from urllib import urlopen
import urllib, urllib2
import os.path, time

DEBUG=True


def enum(*sequential, **named):
    enums = dict(zip(sequential, range(len(sequential))), **named)
    reverse = dict((value, key) for key, value in enums.iteritems())
    enums['reverse_mapping'] = reverse
    return type('Enum', (), enums)
    
def debugp(string):
    if DEBUG:
        print string


def readLocal(filename):
    if not os.path.exists(filename):
        return None
    
    tooOld = time.time()-(60*60*24)#older than a day, let's get rid of it.

    try:
        creationTime = os.path.getctime(filename)
        if creationTime < tooOld:
            os.remove(filename)
            return None
    
        f = open(filename, "r")
        toReturn = f.read()
        f.close()
        return toReturn
    except IOError as e:
        return None
    
def writeLocal(filename, data):
    try:
        f = open(filename, "w")
        f.write(data)
        f.flush()
        f.close()
    except IOError as e:
        return None
    
    
fallUrl="http://www.wvup.edu/schedules/fall.htm"
springUrl="http://www.wvup.edu/schedules/spring.htm"
summerUrl="http://www.wvup.edu/schedules/summer.htm"
def getWebPage(semester):
    userAgent ="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/536.26.17 (KHTML, like Gecko) Version/6.0.2 Safari/536.26.17"
    pageText = ""
    req=urllib2.Request(springUrl)
    req.add_header("User-Agent", userAgent)
    
    if "summer" == semester:
        pageText=readLocal("summer")
        if pageText== None:
            pageText= urlopen(summerUrl).read()
            writeLocal("summer", pageText)
    elif "spring" == semester:
        pageText=readLocal("spring")
        if pageText== None:
            pageText=urllib2.urlopen(springUrl).read()
            #pageText=urlopen(springUrl).read()
            writeLocal("spring", pageText)
    elif "fall" == semester:
        pageText=readLocal("fall")
        if pageText== None:
            pageText = urlopen(fallUrl).read()
            writeLocal("fall", pageText)
    else:
        pageText = None
     
    return pageText
    
SubjectConstants=enum(
    ACCOUNTING="ACCT",
    ART="ART",
    BIOLOGY="BIOL",
    BUSINESS_TECHNOLOGY="BTEC",
    CHEMISTRY="CHEM",
    CHILD_DEVELOPMENT="CDEV",
    COMMUNICATION_STUDIES="COMM",
    COMPUTER_INFO_TECHNOLOGY="CIT",
    COMPUTER_SCIENCE="CS",
    CRIMINAL_JUSTICE="CJ",
    DRAFTING="DRAF",
    ECONOMICS="ECON",
    EDUCATION="EDUC",
    ELECTRONICS="ELEC",
    EMERGENCY_RESPONSE="ERES",
    ENERGY_ASSESSMENT_AND_MANAGEMENT_TECHNOLOGY="EAMT",
    ENGINEERING="ENGR",
    ENGLISH="ENGL",
    ENTREPENEURSHIP="ENT",
    ENVIRONMENTAL_TECHNOLOGY="ENVR",
    FINANCE="FIN",
    FRENCH="FREN",
    GERMAN="GERM",
    JAPANESE="JAPN",
    SPANISH="SPAN",
    GENERAL_BUSINESS="GBUS",
    GEOGRAPHY="GEOG",
    GEOLOGY="GEOL",
    HEALTH="HPER",
    HISTORY="HIST",
    HVAC="HVAR",
    INDUSTRIAL_MAINTENANCE="IM",
    INDUSTRIAL_TECHNOLOGY="INDT",
    JOURNALISM="JOUR",
    LANGUAGE_ARTS="LA",
    LEGAL_STUDIES="LS",
    MACHINING_TECHNOLOGY="MACH"  
    
)


class wvupClass:
    #Class Divison, like ENV
    def __init__(self, subject, classnumber, credithours, crn):
        self.subject = subject
        self.classnumber = classnumber
        self.credithours = credithours
        self.crn = crn
        self.grade = grade
        self.requirementsbitset = requirementsbitset
        

classTypes = ["E-C", "Lec", "Alt", "Lab", "Stu", "Ble", "&nbsp;"]

def pullApart(classText, outputfile):
    #print(classText)
    #start after <tr>
    startNdx = classText.find("<tr>")+4
    startNdx = classText.find("<td>", startNdx)+4
    while startNdx > -1:
        endNdx = classText.find("</td>")
        tmp = classText[startNdx:endNdx]
        #first is <td> <a onmouseover="Tip(' Lecture \
        #', WIDTH, 0, SHADOW, true, BORDERCOLOR, '#00386B')"
        #onmouseout="UnTip()"> <p align="center"> Lec </a> </td>
        #so find "center">, then </a>
        tmpSI = classText.find("center\">", startNdx)+8
        tmpEI = classText.find("</a>", tmpSI)
        if tmpEI == -1:
            print "Ugh."
            return
        classType = classText[tmpSI:tmpEI].strip()
        #print classType #
        if classType not in classTypes:
            print("Bad Classtype found: %s\n" % classType)
        if classType == "&nbsp;":
            classType = ""

        #Crosslisted
        tmpSI = classText.find("<td>", tmpEI)+4
        tmpSI = classText.find("center\">", tmpSI)+8

        
        tmpEI = classText.find("</td>", tmpSI)
        tmp = classText[tmpSI:tmpEI].strip()
        # looks like either X or &nbsp;
        crosslisted = False
        if tmp == "X":
            crosslisted = True
        
        #next up, CRN
        tmpSI = classText.find("<td>", tmpEI)+4
        
        #normally the end for this would be </td> but the html is malformed, and there's just another <td> next.
        #but sometimes, there's a <span id> next.
        tmpA = classText.find("<span", tmpSI)
        tmptd = classText.find("<td>", tmpSI)
        if tmpA > -1 and tmpA < tmptd:
            tmpEI = tmpA
        else:
            tmpEI = tmptd
            
        tmp = classText[tmpSI:tmpEI].strip()
        
        crn = tmp
        
        #temp catch block
        if crn == "5797":
            print("ugh")
        
        #Subject
        tmpSI = tmptd+4
        tmpEI = classText.find("</td>", tmpSI)
        tmp = classText[tmpSI:tmpEI].strip()
        subject = tmp
        
        #course
        tmpSI = classText.find("<td>", tmpEI)+4
        tmpEI = classText.find("</td>", tmpSI)
        tmp = classText[tmpSI:tmpEI].strip()
        course = tmp
        
        #Title. Going to be a bit more interesting here.
        #<td> <a onmouseover="TagToTip('ACCT201', TITLE, 'ACCT 201', WIDTH, 240, TITLEBGCOLOR, '#00386B', SHADOW, true, BORDERCOLOR, '#00386B')"
        #onmouseout="UnTip()"> PRIN OF ACCOUNTING 1 </a>
        tmpSI = classText.find("<td>", tmpEI)+4
        #now need to find the end of the <a
        tmpSI = classText.find(">", tmpSI)+1
        tmpEI = classText.find("<", tmpSI)
        tmp = classText[tmpSI:tmpEI].strip()
        title = tmp
        
        #credit hours
        #<td> <p align="center"> 3 </td>
        tmpSI = classText.find("<td>", tmpEI)+4
        tmpSI = classText.find("center\">", tmpSI)+8
        tmpEI = classText.find("</td>", tmpSI)
        tmp = classText[tmpSI:tmpEI].strip()
        credithours = tmp
        
        #Days
        #<td> T R </td>
        tmpSI = classText.find("<td>", tmpEI)+4
        tmpEI = classText.find("</td>", tmpSI)
        tmp = classText[tmpSI:tmpEI].strip()
        coursedays = tmp
        if coursedays == "&nbsp;":
            coursedays = ""
        
        #Times
        #<td> 1100 - 1215 pm </td>
        tmpSI = classText.find("<td>", tmpEI)+4
        tmpEI = classText.find("</td>", tmpSI)
        times = classText[tmpSI:tmpEI].strip()
        if times == "&nbsp;" :
            times = ""
            
        #instructor
        #<td> Morgan S </td>
        tmpSI = classText.find("<td>", tmpEI)+4
        # there may be a <a href= "mailto:first.last@wvup.edu" >
        tmpA = classText.find("<a ", tmpSI)
        tmptd = classText.find("</td>", tmpSI)
        if tmpA > -1 and tmpA < tmptd:
            tmpEI = tmpA
        else:
            tmpEI = tmptd
        
        tmp = classText[tmpSI:tmpEI].strip()
        instructor = tmp
        
        #classroom
        #<td> <a onmouseover="Tip(' Classroom (MAIN CAMPUS) ', WIDTH, 0, SHADOW, true, BORDERCOLOR, '#00386B')"
        #onmouseout="UnTip()"> 1330 (MAIN) </a></td>
        tmpSI = classText.find("<td>", tmpEI)+4
        #now need to find the end of the <a
        tmpSI = classText.find(">", tmpSI)+1
        tmpEI = classText.find("<", tmpSI)
        tmp = classText[tmpSI:tmpEI].strip()
        classroom = tmp
        if classroom == "&nbsp;" :
            classroom =""
        
        #startdate
        #<td> <p align="center"> 14-JAN-13 </td>
        tmpSI = classText.find("<td>", tmpEI)+4
        tmpSI = classText.find("center\">", tmpSI)+8
        tmpEI = classText.find("</td>", tmpSI)
        tmp = classText[tmpSI:tmpEI].strip()
        startdate = tmp
        
        #Seats available
        #<td> <a onmouseover="Tip(' Seats Available: 3 <br/>\
        #Waitlist: 0 ', WIDTH, 0, SHADOW, true, BORDERCOLOR, '#00386B')"
        #onmouseout="UnTip()"> <p align="center"> <p align="center">3 </a> </td>
        tmpSI = classText.find("<td>", tmpEI)+4
        tmpSI = classText.find("center\">", tmpSI)+8
        tmpSI = classText.find("center\">", tmpSI)+8 #it's malformed.
        tmpEI = classText.find("<", tmpSI)
        tmp = classText[tmpSI:tmpEI].strip()
        seatsavailable = tmp
        

        #<td> <p align="center">FULL TERM<br />(14-JAN-13 - 10-MAY-13) </td>
        tmpSI = classText.find("<td>", tmpEI)+4
        tmpSI = classText.find("center\">", tmpSI)+8
        tmpEI = classText.find("</td>", tmpSI)
        tmp = classText[tmpSI:tmpEI].strip()
        #need to remove embedded html linebreaks too
        tmp = tmp.replace("<br />", " ")
        tmp = tmp.replace("<br>", " ")
        termlength = tmp
       
        #campus 
        #<td> Main </td>
        tmpSI = classText.find("<td>", tmpEI)+4
        tmpEI = classText.find("</td>", tmpSI)
        tmp = classText[tmpSI:tmpEI].strip()
        campus = tmp
        
        strToWrite = "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n" % (classType, crosslisted, crn, subject, course, title, credithours, coursedays, times, instructor, classroom, startdate, seatsavailable, termlength, campus)
        
        print strToWrite
        
        outputfile.write(strToWrite)
        
        startNdx = classText.find("<tr>", endNdx)

def parseClassList(pageText):
    outputFile = open("output.csv", "w")
    listOfClasses=[]
    startIndex = 0
    startIndex = pageText.find("<a name=\"TOP\">Main Campus", startIndex)
    startIndex = pageText.find("<span id=\"", startIndex)
    startIndex = pageText.find("<tr>", startIndex)
    while startIndex > -1:
        
        #from start index, we need the first <A HREF.
        endNdx = pageText.find("</tr>", startIndex)
        pullApart(pageText[startIndex:endNdx], outputFile)
        tableEnd = pageText.find("/table>", endNdx)
        startIndex = pageText.find("<tr>", endNdx)
        # check for end of table, if it's less than..
        if(tableEnd < startIndex):
            startIndex = pageText.find("<span id=\"", endNdx)
            startIndex = pageText.find("<tr>", startIndex)        
    outputFile.flush()
    outputFile.close()
    
  


def main():
    # parse command line options
    parser = argparse.ArgumentParser(description='Class Fetcher')
    parser.add_argument("-s", help="Semester to fetch. (fall|spring|summer) default=spring", default="spring", dest="semester")
    parser.add_argument("-v", help="Print Version Information.")
    args=parser.parse_args()
    debugp("Args are:")
    debugp(args)
    #executor.executeCommand(args.daterange, args.application, args.dsid, args.partition)
    pageText = getWebPage(args.semester)
    #print(pageText)
    classList = parseClassList(pageText)
    
if __name__ == "__main__":
    sys.exit(main())


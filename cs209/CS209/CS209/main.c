//
//  main.c
//  CS209
//
//  Created by Thomas Byrne on 11/15/12.
//  Copyright (c) 2012 Thomas Byrne. All rights reserved.
//

//This turns on(1) or off(0) debug printing.

#define DEBUGON 0

#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>


#include "projectconstants.h"
#include "myfunctions.h"
#include "linkedlist.h"
#include "linkedset.h"
#include "programmers.h"
#include "projects.h"
#include "tests.h"

/*
//Run test code.
int main(int argc, const char * argv[]){
    runAllTests();
}
*/

void writeSuccessfulProjects(struct LinkedList* projectList);
void writeUnsuccessfulProjects(struct LinkedList* projectAndSkillsList);

int main(int argc, const char * argv[])
{
    if(DEBUGON){printf("Start program.\n");}//debug print
    
    struct LinkedList programmerList = LoadProgrammers();//load our programmers from the file. [programmers.h]
    struct LinkedList projectList = LoadProjects();// Load our projects from the file.         [project.h]
    
    
    //Some programmers are assigned to multiple projects already.
    //They're hard workers and dedicated, and I have no use for them in this assignment.
    
    RemoveUnusableProgrammers(&programmerList);//remove all unusable programmers and free their memory. [programmers.h]
    

    
    // I'm going to create a secondary list of the undoable projects. we'll need this list later.
    struct LinkedList undoableProjectList = createEmptyLinkedList();// [linkedList.h]
    
    //This function will find any projects that are impossible currently - that require skills
    //that NO eligible programmer has. It removes them from projectList and adds them to undoableProjectList
    FindUndoableProjects(&undoableProjectList, &projectList, &programmerList); // [project.h]
    
    
    //OK, once we've gotten here, our programmer list contains only 'good' programmers - ones that are capable of being in at least one project.
    //we've also sorted out any projects that are completely 'undoable' - ones that we lack the skills to do, and put them in a different list,
    
    
    struct LinkNode* projectNode = projectList.Head;
    
    while(projectNode != NULL){
        
        struct Project* currentProject = projectNode->Data;//one project at a time!
        
        //now here comes our more complex bit. For each project, we need a list of programmers that can work on this project.
        
        //we'll need to have a list of programmers 
        struct LinkNode* nextProgrammer = programmerList.Head;
        
        
        // Create a list of eligible programmers that I will use for later determining whether a project is doable.
        // A programmer is eligible if he has at least one free project slot, and at least 2 matching skills for the project.
        
        // I'm basically keeping a seperate pointer list
        // that peeks into the nodes of the ProgrammerList.
        // this way I don't have to keep the same information in multiple places.
        // this is fine, as long as I don't manipulate the original list
        // or free the memory, etc.
        
        int eligibleProgrammerCount = 0;
        PROGRAMMERPTR eligibleProgrammers[programmerList.Count];
        
        
        //loop through the programmers and see which ones are eligible for this project.
        while(nextProgrammer != NULL){
            
            PROGRAMMERPTR currentProgrammer = nextProgrammer->Data;
            
            //If we matched 2 or more skills and one free project slot, the programmer is 'eligible' for this project.
            
            if(ProgrammerHasMatchingSkills(currentProject, currentProgrammer) &&    //[project.h]
               ProgrammerHasAvailableSlots(currentProgrammer)){                     //[project.h]
                
                eligibleProgrammers[eligibleProgrammerCount++] = currentProgrammer; //add to our temporary list.
                
            }//end if.
            
            nextProgrammer = nextProgrammer->Next;
            
        }//end programmer while
        
        //OK, so now we have a list of programmers that are eligible for this project.
        if(eligibleProgrammerCount < 3){
            //mark this project as undoable and put it into the undoable list.
            
            struct LinkNode* tmpNode = projectNode->Next; //keep this around, we'll need it for the outer while loop.
            
            RemoveNode(&projectList, projectNode);      //remove from project list  [linkedlist.h]
            AddNode(&undoableProjectList, projectNode); //add to project list       [linkedlist.h]
                
            projectNode = tmpNode; //update loop variable
            continue; //jump to next iteration.
            
        }else if(eligibleProgrammerCount == 3){ //special case. In this case, there's only one tuple, so we're going to jump 
            int tmpMask[3];
            InitializeMaskArray(tmpMask, 3, 3);
            struct ProgrammerTuple tuple = ProgrammerTupleFromMask(eligibleProgrammers, eligibleProgrammerCount, tmpMask, 3);
            if(CanSelectedProgrammersCompleteProject(&tuple, currentProject, &programmerList)){
                
                AssignProgrammersToProject(&tuple, currentProject, &programmerList);
            
            }else{
                //mark this project as undoable, but we'll need to find which skills we can't do.
                struct LinkNode* tmpNode = projectNode->Next;
                
                RemoveNode(&projectList, projectNode); //remove it from the project list
                AddNode(&undoableProjectList, projectNode); //add it to the undoable project list
                
                projectNode = tmpNode;
                continue;
   
            }
            
        }
        //109, 1074 1067  1031  (1057)?

        
        //And
        //Let's find which tuples
        //can actually complete it when working together.
        int tupleMask[eligibleProgrammerCount];
        
        //there may be 3 or 4 programmers for each project. No more, no less.
        for(int programmerTupleSize = 3; programmerTupleSize <= 4; programmerTupleSize++){
            //wipe our mask array
            InitializeMaskArray(tupleMask, eligibleProgrammerCount, programmerTupleSize);//initialize our tupleMask.
            
            struct ProgrammerTuple tuple = ProgrammerTupleFromMask(eligibleProgrammers, eligibleProgrammerCount, tupleMask, programmerTupleSize);
            
            //Now, let's see if this tuple can actually do this project.
            
            //because the call is iterative, we need to check the first mask first, then loop
            //through the rest.
            
            if(CanSelectedProgrammersCompleteProject(&tuple, currentProject, &programmerList)){
                if(DEBUGON){
                    printf("ProjectID: %d can be completed by programmers:", currentProject->Id);
                    for(int j = 0; j < tuple.Count; j++){
                        printf("%d ", tuple.IDs[j]);
                        
                    }
                    printf("\n");
                }//end DEBUG print
                
                AssignProgrammersToProject(&tuple, currentProject, &programmerList);
                programmerTupleSize = 5;//so we drop out of the loop.
                break;//out of the for loop.
                
                
                
            }//end if CanSelectedProgrammersCompleteProject
            
            //now we'll loop through the rest of the iterations of tuples, until we find one, or until the mask is full.
            do{
                GetNextMaskIteration(tupleMask, eligibleProgrammerCount, 0); //[myfunctions.h]
                tuple = ProgrammerTupleFromMask(eligibleProgrammers, eligibleProgrammerCount, tupleMask, programmerTupleSize); //[programmers.h]
                
                //Now, let's see if this tuple can actually do this project.
                
                if(CanSelectedProgrammersCompleteProject(&tuple, currentProject, &programmerList)){ //[project.h]
                    
                    if(DEBUGON){
                        printf("ProjectID: %d can be completed by programmers:", currentProject->Id);
                        for(int j = 0; j < tuple.Count; j++){
                            printf("%d ", tuple.IDs[j]);
                            
                        }
                        printf("\n");
                    }
                    
                    AssignProgrammersToProject(&tuple, currentProject, &programmerList); //[project.h]
                    programmerTupleSize = 5;//so we drop out of the loop.
                    break;//out of the while loop.
                    
                    
                    
                }//end if CanSelectedProgrammersCompleteProject
                
            }while (!IsMaskFull(tupleMask, eligibleProgrammerCount, programmerTupleSize)); //end do-while loop. [myfunctions.h]
            
        }//end for
        
        //OK, although this doesn't currently happen with the input files, it's possible we go through every
        //available programmer tuple, and none can complete it. When this happens, we mark the project as undoable.
        
        if(!IsProjectAssigned(currentProject)){ // [project.h]
            
            //mark this project as undoable,
            struct LinkNode* tmpNode = projectNode->Next;
            
            RemoveNode(&projectList, projectNode); //remove it from the project list            [linkedlist.h]
            AddNode(&undoableProjectList, projectNode); //add it to the undoable project list   [linkedlist.h]
            
            projectNode = tmpNode;//reassign for loop.
            continue;

        }
        projectNode = projectNode->Next;
    }
    
    
    //write lists
    writeSuccessfulProjects(&projectList);
    writeUnsuccessfulProjects(&undoableProjectList);
    
    FreeLinkedList(&undoableProjectList);//Need to free &undoableProjects.      [linkedlist.h]
    FreeLinkedList(&projectList); //free our project list.                      [linkedlist.h]
    FreeLinkedList(&programmerList);//free our programmer list before we exit.  [linkedlist.h]
    
    printf("Program Complete.\n");
    return 0;
}


//write the successful projects to the appropriate file. 
void writeSuccessfulProjects(struct LinkedList* projects){
    FILE *doableProjectsFile;
    
    doableProjectsFile = OpenAsOutput("doable-projects.txt");
    
    //fprintf(doableProjectsFile, "%d\r\n", projects->Count);//write Count at beginning of file.

    /*
     The first of the reports should save the projects that are doable.
     The first of these reports should save the project id, project title, and the programmers id that will be working on the project.     
     */
    struct LinkNode* nextProject = projects->Head;
    
    while(nextProject != NULL){
        
        struct Project* project = nextProject->Data;
        fprintf(doableProjectsFile, "%d\r\n%s\r\n", project->Id, project->ProjectName); //ID, name of project
        fprintf(doableProjectsFile, "%d %d %d %d\r\n", project->ProgrammerID1, project->ProgrammerID2, project->ProgrammerID3, project->ProgrammerID4); //programmer ID's
        
        nextProject = nextProject->Next;//next project
    }
    
    fclose(doableProjectsFile); //close file!
    
}//end writeSuccesfulProjects

//write undoable projects to the appropriate file.
void writeUnsuccessfulProjects(struct LinkedList* undoableProjects){
    FILE *undoableProjectsFile;
    undoableProjectsFile = OpenAsOutput("undoable-projects.txt"); // [myfunctions.h]
    /*
     The second report is to save the projects that are not doable.
     The second report is to save the project id, project title, and the skills needed by the programmers to work on the project.
     */
    struct LinkNode* nextProject = undoableProjects->Head;
    
    //fprintf(undoableProjectsFile, "%d\r\n", undoableProjects->Count);//write Count at beginning of file.
    
    while(nextProject != NULL){
        
        struct Project* project = nextProject->Data;
        
        fprintf(undoableProjectsFile, "%d %-60s\r\n", project->Id, project->ProjectName); //write ID, project name, 60=PROJECTNAMEMAXSIZE.
        
        //loop through the skills and write them out.
        for(int i = 0; i < project->skillcount; i++){
            fprintf(undoableProjectsFile, "%-32s ", project->Skills[i]); //constant size, 32=SKILLNAMESIZE
        }
        
        fprintf(undoableProjectsFile, "\r\n");//line ending after skills
        
        nextProject = nextProject->Next;//next node
    }
    
    fclose(undoableProjectsFile); //close file
    
}//end writeUnsuccessfulProjects


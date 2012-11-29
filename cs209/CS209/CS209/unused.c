//
//  unused.c
//  CS209
//
//  Created by Thomas Byrne on 11/15/12.
//  Copyright (c) 2012 Thomas Byrne. All rights reserved.
//

//#include <stdio.h>
//#include <string.h>
//#include <stdlib.h>
//let's put a simple size check for lines, so we don't get too much
/*#define MAXLINESIZE 512

//arbitrary number of skills that we will read.
#define MAXSKILLS 100

//Maximum size of names, first, last or skill name. Choosing an arbitrary size based on the data sets.
#define MAX_NAME_SIZE 128

//Maximum number of programmer skills. Specified in project description
#define MAX_PROGRAMMER_SKILLS 10


//Yes, I'm going to waste a lot of memory here since we've only got 29 skills.
//For now I'm going to do it anyway because it's making my functions and data handoff
//cleaner. In an OO world I'd have a dynamic object, and wouldn't waste the space.
//I may still come back to this and optimize it later.
typedef struct {
    int skillSize;
    char skills[MAXSKILLS][MAX_NAME_SIZE];
}SkillList;

typedef struct{
    int id;
    char firstname[MAX_NAME_SIZE];
    char lastname[MAX_NAME_SIZE];
    int project1_id;
    int project2_id;
    int skillcount;
    char skills[MAX_PROGRAMMER_SKILLS][MAX_NAME_SIZE];
}Programmer;


//function definitions
SkillList readSkills(char skillsfileName[]);
char *trimwhitespace(char *str);
Programmer parseProgrammer(char *record, char *delim);



int oldmain(int argc, const char * argv[])
{
    char skillsfileName[] = "skills.txt";
    
    SkillList skillList = readSkills(skillsfileName);
    
    
    
    for(int i = 0; i < skillList.skillSize; i++){
        char *skill = skillList.skills[i];
        printf("Found Skill: %s\n", skill);
    }
    
    char line2[] = " 1019                  Tom                 Ford    -1    -1     6                palm                 psp               basic          web-socket                 ada                  .c\r\n";
    
    Programmer pr1 = parseProgrammer(trimwhitespace(line2), " ");
    
    return 0;
}

SkillList readSkills(char* skillsfileName){
    //read skills file.
    FILE *file = fopen(skillsfileName, "r");
    if ( file == NULL )
    {
        printf("Could not open %s for reading \n", skillsfileName );
        exit(1);
    }
    
    char line[MAXLINESIZE];
    
    fgets(line,sizeof(line),file);//Let's get the header row, it tells us how many skills there are.
    
    printf("%s", line);
    
    int skillSize = atoi(line);
    
    //Let's double check this
    if(0 >= skillSize || skillSize > MAXSKILLS){
        printf("Skills file showed %d skill size. This is out of range.\n", skillSize);
        exit(1);
    }
    
    int skillIndex = 0;
    //set up our array of skills
    SkillList sl;//={skillSize, skArray};
    sl.skillSize = skillSize;
    //sl.skills = ;//calloc2d(skillSize, MAXLINESIZE, sizeof(char));
    
    
    while((fgets(line,sizeof(line),file)!= NULL) && (skillIndex < skillSize)) {
        strcpy(sl.skills[skillIndex++], trimwhitespace(line));
    }
    
    return sl;
}

//simple function I took from stackoverflow and modified.
//I'm going to use the isspace() call to remove whitespace from the beginning
//and end of the string.
char *trimwhitespace(char *str)
{
    char *end;
    
    // Trim leading space
    while(isspace(*str)){
        str++;
    }
    
    if(*str == 0){  // All spaces?
        return str;
    }
    
    // Trim trailing space
    end = str + strlen(str) - 1;
    
    while(end > str && isspace(*end)){
        end--;
    }
    
    // Write new null terminator
    *(end+1) = 0;
    
    return str;
}

Programmer parseProgrammer(char *record, char *delim){
    
    char arr[15][MAX_NAME_SIZE];
    
    char *p=strtok(record,delim);
    int fld=0;
    
    while(p)
    {
        strcpy(arr[fld],p);
        fld++;
        p=strtok(NULL,delim);
    }
    Programmer pr;
    //
    pr.id = atoi(arr[0]);
    strcpy(pr.firstname, arr[1]);
    strcpy(pr.lastname, arr[2]);
    pr.project1_id = atoi(arr[3]);
    pr.project2_id = atoi(arr[4]);
    pr.skillcount = atoi(arr[5]);
    for(int i = 0; i < pr.skillcount; i++){
        strcpy(pr.skills[i],arr[6+i]);
    }
    return pr;
    
}*/
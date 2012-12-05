//
//  projects.h
//  CS209
//
//  Created by Thomas Byrne on 11/29/12.
//  Copyright (c) 2012 Thomas Byrne. All rights reserved.
//

#define PROJECTPTR struct Project *
/**
 104
 embedded gps bikes : Spokes and Sprockets
 -1 -1 -1 -1 5
 dos            embedded                ipad                  .c               cocoa
 */
struct Project
{  //  struct Project
    
    int Id;  // Project id
    char ProjectName[ PROJECTNAMEMAXSIZE ];  // programmer's first name
    
    int ProgrammerID1;  //  first Programmer working on this project
    int ProgrammerID2;  //  second Programmer working on this project
    int ProgrammerID3;  //  third Programmer working on this project
    int ProgrammerID4;  //  fourth Programmer working on this project
    int skillcount; //number of skills for this project.
    char Skills[ PROJECTSKILLS ][ SKILLNAMESIZE ];  // the array of strings of the project's required skills
    
};  //  struct Programmer


PROJECTPTR NewProject()
{  //  PROJECTPTR NewProgrammer()
    
    return( malloc( sizeof( struct Project ) ) );
    
}  //  PROJECTPTR NewProgrammer()


struct LinkedList LoadProjects()
{
    FILE *ProjFile;  // file pointer to the projects.txt data file
    int RecordCount;  // number of programmer records in the data file
    
    PROJECTPTR TempProj;  //  a pointer to a temp programmer to add to the list
    
    struct LinkedList projectList = createEmptyLinkedList();
    // open the data file
    ProjFile = OpenAsInput( "projects.txt" );
    char buff[MAXLINELENGTH];
    //read to end of file.
        //first read the record count.
        fgets(buff, MAXLINELENGTH, ProjFile);
        //buff contains project record count.
        RecordCount = atoi(buff);
        while(RecordCount){
            
            
            TempProj = NewProject();
            
            
            // check if we got a block of memory
            if( TempProj == NULL ){
                ErrorExit( "could not get memory for TempProg", "in function LoadProjects", 0 );
            }
            
            /**
             104
             embedded gps bikes : Spokes and Sprockets
             -1 -1 -1 -1 5
             dos            embedded                ipad                  .c               cocoa
             */
            //read the first line, project ID
            fgets(buff, MAXLINELENGTH, ProjFile);
            TempProj->Id = atoi(buff);
           
            //second line has project name.
            fgets(buff, MAXLINELENGTH, ProjFile);
            strcpy(TempProj->ProjectName, TrimWhitespace(buff));

            //third line has programmers assigned, and skill count.
            fgets(buff, MAXLINELENGTH, ProjFile);
            sscanf(buff, "%d %d %d %d %d", &TempProj->ProgrammerID1, &TempProj->ProgrammerID2, &TempProj->ProgrammerID3, &TempProj->ProgrammerID4, &TempProj->skillcount);
            
            //last line has skills.
            // read the skills that the programmer has
            fgets(buff, MAXLINELENGTH, ProjFile);
            
            //tokenize the string on a space, and copy them into the skill array
            char *tmpPtr = strtok(buff, " ");            
            for( int i = 0;  i < TempProj->skillcount;  i ++ ){
                strcpy(TempProj->Skills[i], TrimWhitespace(tmpPtr));
                tmpPtr = strtok(NULL,  " ");
            }
                
            
            AddItem(&projectList, TempProj); //add the item to the linked list.
            
            RecordCount--;
        }
    
    
      //  close the input data file
    fclose( ProjFile );
    
    //return our list.
    return projectList;
}//end ReadProject

//This will remove this programmer from the project, and remove the project from the programmer.
//returns 1 if done, 0 if not.
int RemoveProgrammerFromProject(struct Project* project, struct Programmer* programmer){
    int toReturn = 1;//return success, hopefully.
    
    //Look for which ID has this programmer assigned, and unassign it.
    if(project->ProgrammerID1 == programmer->Id){
        project->ProgrammerID1 = -1;
    }else  if(project->ProgrammerID2 == programmer->Id){
        project->ProgrammerID2 = -1;
    }else  if(project->ProgrammerID3 == programmer->Id){
        project->ProgrammerID3 = -1;
    }else  if(project->ProgrammerID4 == programmer->Id){
        project->ProgrammerID4 = -1;
    }else{//Uh-oh. Didn't find him assigned.
        toReturn = 0;
        if(DEBUGON){printf("Was asked to remove programmer ID %d from Project %d, but the project didn't have them assigned.", programmer->Id, project->Id);}
    }
    
    //Look for which programmer slot has the assignment.
    if(programmer->Proj1 == project->Id){
        programmer->Proj1 = -1;
        
    }else if (programmer->Proj2 == project->Id){
        programmer->Proj2 = -1;
    }else{
        //didn't find the project.
        if(DEBUGON){printf("Was asked to remove programmer ID %d from Project %d, but the programmer didn't have that assignment.", programmer->Id, project->Id);}
        toReturn = 0;//if it wasn't 0 before, make it now. Was going to use a bitwise and, but simple assignment does the same thing.

    }
    
    return toReturn;
}//end RemoveProgrammerFrom Project.


//this adds this programmer to the first available slot, and assigns the project to the programmer as well.
//returns 1 if successful, 0 if not.
int AddProgrammerToProject(struct Project* project, struct Programmer* programmer){
    
    //first check if programer has room. I could check this later,
    //but I'm putting a short circuit to jump out before any assignments.
    
    if(programmer->Proj1 != -1 && programmer->Proj2 != -1){
        return 0;//programmer has no slots.
    }
    
    //check which slot in the project is free.
    if(project->ProgrammerID1 == -1){
        project->ProgrammerID1 = programmer->Id;
    }else if(project->ProgrammerID2 == -1){
        project->ProgrammerID2 = programmer->Id;
    }else if(project->ProgrammerID3 == -1){
        project->ProgrammerID3 = programmer->Id;
    }else if(project->ProgrammerID4 == -1){
        project->ProgrammerID4 = programmer->Id;
    }else{
        if(DEBUGON){printf("Tried to assign programmer %d to project %d, but project had no free slots.", programmer->Id, project->Id);}
        return 0;//we're going to shortcircut the return, since we don't want to fall through.
    }

    //find our empty slot in the programmer and assign it. 
    if(programmer->Proj1 == -1){
        programmer->Proj1 = project->Id;
    }else if(programmer->Proj2  == -1){
        programmer->Proj2 = project->Id;
    }else{//This should never happen, since we checked at the beginning fo the method. 
        if(DEBUGON){printf("Tried to assign programmer %d to project %d, but programmer had no free slots.", programmer->Id, project->Id);}
        return 0;//something went bad.
    }
    
    return 1;//was successful
}//end addProgrammerToProject


//This function will return true (1) if this programmer can work on this project, and false (0) if it can't.
int ProgrammerHasMatchingSkills(struct Project* project, struct Programmer* programmer){
    int matchingSkillCount = 0;
    for(int i = 0; i < programmer->SkillCount; i++){
        for(int j = 0; j < project->skillcount; j++){
            if(0 == strcmp(project->Skills[j], programmer->Skills[i])){
                matchingSkillCount++;
                continue;
            }
        }
    }
    
    if(matchingSkillCount >= 2){
        return 1;
    }
    
    return 0;//End, match not found.
}

//This is a complicated function. It will look at a set of programmers, and determine whether those programmers can complete this project.
//return 1(true) if these programmers can complete the project, 0(false) if not.

int CanSelectedProgrammersCompleteProject(int programmerIDs[], int programmerCount, struct Project* project, struct LinkedList* programmerList){
    struct SetList projectSkillList = createEmptySetList();//unique set of skills.
    int toReturn = 1;//return success, hopefully.
    
    //add all the project skills into the setList.
    for(int i = 0; i < project->skillcount; i++){
        AddDataToSetList(&projectSkillList, project->Skills[i]);
    }//for skill loop
    
    //loop through the programmers, find matching ones, remove their skills from the setlist.
    struct LinkNode* nextNode = programmerList->Head;
    
    while(nextNode != NULL){
        struct Programmer* currentProgrammer = nextNode->Data;
        if(intArrayContainsValue(programmerIDs, programmerCount, currentProgrammer->Id)){
            //use his skills.
            for(int j = 0; j < currentProgrammer->SkillCount; j++){
                removeFromSetListAndFree(&projectSkillList, currentProgrammer->Skills[j]);
            }
        }
        
        nextNode = nextNode->Next;
    }
    
    if(projectSkillList.Count > 0){//if there's anything left, they are missing some skillz.
        toReturn = 0;
    }
    
    
    FreeSetList(&projectSkillList);
    return toReturn;
}//end CanSelectedProgrammersCompleteProject


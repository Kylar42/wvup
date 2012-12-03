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

int removeProgrammerFromProject(struct Project* project, struct Programmer* programmer){
    return 0;
}

//this adds this programmer to the first available slot, and assigns the project to the programmer as well.
//returns 1 if successful, 0 if not.
int addProgrammerToProject(struct Project* project, struct Programmer* programmer){
    //first check if programer has room.
    if(programmer->Proj1 != -1 && programmer->Proj2 != -1){
        return 0;//programmer has no slots.
    }
    //check which slot in the project is free.
    if(project->ProgrammerID1 == -1){
        project->ProgrammerID1 = programmer->Id;
    }else if(project->ProgrammerID2 == -1){
        project->ProgrammerID2 = programmer->Id;
    }else if(project->ProgrammerID3 == -1){
        project->ProgrammerID2 = programmer->Id;
    }else if(project->ProgrammerID4 == -1){
        project->ProgrammerID2 = programmer->Id;
    }else{
        if(DEBUGON){printf("Tried to assign programmer %d to project %d, but project had no free slots.", programmer->Id, project->Id);}
        return 0;
    }

    if(programmer->Proj1 == -1){
        programmer->Proj1 = project->Id;
    }else if(programmer->Proj2  == -1){
        programmer->Proj2 = project->Id;
    }else{
        if(DEBUGON){printf("Tried to assign programmer %d to project %d, but programmer had no free slots.", programmer->Id, project->Id);}
        return 0;//something went bad.
    }
    
    return 1;//was successful
}//end addProgrammerToProject


//This function will return true (1) if this programmer can work on this project, and false (0) if it can't.
int DoesProgrammerHaveMatchingSkills(struct Project* project, struct Programmer* programmer){
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
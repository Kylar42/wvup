//
//  main.c
//  CS209
//
//  Created by Thomas Byrne on 11/15/12.
//  Copyright (c) 2012 Thomas Byrne. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>


#include "projectconstants.h"
#include "myfunctions.h"
#include "linkedlist.h"
#include "linkedset.h"
#include "programmers.h"
#include "projects.h"

//This I'll change to 0 and turn debug printing off later. 
#define DEBUGON 1





int main(int argc, const char * argv[])
{
    if(DEBUGON){printf("Start program.\n");}//debug print
    
    struct LinkedList programmerList = LoadProgrammers();//load our programmers from the file.
    struct LinkedList projectList = LoadProjects();// Load our projects.
    removeUnusableProgrammers(&programmerList);//remove all unusable programmers and free their memory. We don't need them anymore.
    
    //let's look and see if any projects are entirely undoable (they require any skill that we don't have.)
    //in order to do this, we'll need to get a list of programmers that can work on the project, and see if that list
    //has every skill the project needs when put together.
    //this isn't exact, since we don't know which programmers
    //will work on each project, but it will help us to
    //eliminate projects that definitely can't be done.
    
    
    struct LinkedList undoableProjects = createEmptyLinkedList();
    
    struct LinkNode* nextProject = projectList.Head;
    
    while(nextProject != NULL){
        PROJECTPTR currentProject = nextProject->Data;
        struct SetList projectSkillList = createEmptySetList();//unique set of skills.
        //add all the project skills into the setList.
        for(int i = 0; i < currentProject->skillcount; i++){
            add(&projectSkillList, currentProject->Skills[i]);
        }//for skill loop 
        
        //now rip through the programmer list, and make sure that each programmer has >= 2 skills matching.
        struct LinkNode* nextProgrammer = programmerList.Head;
        
        
        //list of good and bad programmers that I will use for later determining whether a project is doable.
        int goodProgrammerCount = 0;
        void *goodProgrammers[programmerList.Count];
        int badProgrammerCount = 0;
        void *badProgrammers[programmerList.Count];

        //loop through the programmers and see which ones match this project.
        while(nextProgrammer != NULL){
            
            PROGRAMMERPTR currentProgrammer = nextProgrammer->Data;
                        
            //If we matched 2 or more skills, the programmer is 'eligible' for this project.
            if(DoesProgrammerHaveMatchingSkills(currentProject, currentProgrammer)){
                goodProgrammers[goodProgrammerCount++] = currentProgrammer;
            }else{
                badProgrammers[badProgrammerCount++] = currentProgrammer;
            }
            
            nextProgrammer = nextProgrammer->Next;
                   
        }//end programmer while 
        
        
        /*if(goodProgrammerCount < 3){
            if(DEBUGON){printf("Unable to find 3 programmers for project %d\n", currentProject->Id);}
            //loop through bad programmers for testing.
            for(int i = 0; i < badProgrammerCount; i++){
                PROGRAMMERPTR badPrg = badProgrammers[i];
                printf("Bad Programmer ID: %d\n ", badPrg->Id);
                
            }
            
        }*/
        
        //Now that we have 'good programmers', we need to determine if they have all the needed skills to complete the project. If not, we mark the project as 'undoable'.
        for(int i = 0; i < goodProgrammerCount; i ++){
            PROGRAMMERPTR currentProgrammer = goodProgrammers[i];
            for(int j = 0; j < currentProgrammer->SkillCount; j++){
                removeFromSetListAndFree(&projectSkillList, currentProgrammer->Skills[j]);
            }
        }//end for goodProgrammers
        
        
        //If there are any skills missing, we didn't have a matching programmer that could 
        if(projectSkillList.count > 0){
            struct LinkNode* tmpPointer = nextProject->Next;
            //we are unable to do this project, as no programmer assigned has the needed skills.
            if(DEBUGON){printf("Unable to do project %d, missing skill:%s\n", currentProject->Id, projectSkillList.head->data);}
            
            //remove it from the project list, and add it to the undoable list.
            RemoveNode(&projectList, nextProject);
            addNode(&undoableProjects, nextProject);
            //We also need to keep the list of skills that are not available.
             
            //update the pointer for the loop.
            nextProject = tmpPointer;
            
        }else{
            nextProject = nextProject->Next;            
        }
        
        
    }//end project while
    
    
    //OK, once we've gotten here, our programmer list contains 'good' programmers - ones that are capable of being in at least one project.
    //we've also sorted out any projects that are completely 'undoable' - ones that we lack the skills to do.
    
    //so now we're just going to go through the projects and assign programmers until we're out of programmers, or out or projects.
    //I'm going to do this in a bit of a weird way. There are some programmers that can only be assigned to a single project,
    //either because they only have one free slot, or because they only have the needed skills to do so. So I'm going to do a small
    //optimization here, and find those programmers first, and assign them
    
    
    
    
    
    
    
    FreeLinkedList(&projectList); //free our project list.
    FreeLinkedList(&programmerList);//free our programmer list before we exit.
    FreeLinkedList(&undoableProjects);//free undoable projects list.
    return 0;
}


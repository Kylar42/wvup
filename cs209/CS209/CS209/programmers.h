//  programmers.h
//  Raymond Lamp
//  09/19/2011
//  programmers data//  programmers data


// tbyrne - I'm going to take this and modify it as well
// to use my modified LinkedList, and when LoadProgrammers is called, it will return a pointer to the instance of the LinkedList.

#define PROGRAMMERPTR struct Programmer *

struct Programmer
{  //  struct Programmer
    
    int Id;  // programmer's id
    char FirstName[ NAMESIZE ];  // programmer's first name
    char LastName[ NAMESIZE ];  //  programmer's last name
    int Proj1;  //  project 1 that the programmer is working on
    int Proj2;  //  project 2 that the programmer is working on
    int SkillCount;  // the number of skills the programmer has
    char Skills[ MAXSKILLS ][ SKILLNAMESIZE ];  // the array of strings of the programmer's skills
    
};  //  struct Programmer


struct ProgrammerTuple{//programmer tuple - contains a group of programmers. Max size is 4, since that's how many can work on a project.
    int IDs[4];
    int Count;
};


PROGRAMMERPTR NewProgrammer()
{  //  PROGRAMMERPTR NewProgrammer()
    
    return( malloc( sizeof( struct Programmer ) ) );
    
}  //  PROGRAMMERPTR NewProgrammer()


struct LinkedList LoadProgrammers()
{  
    
    FILE *ProgFile;  // file pointer to the programmers.txt data file
    int RecordCount;  // number of programmer records in the data file
    int Index;  // used to read the programmer's skills
    
    PROGRAMMERPTR TempProg;  //  a pointer to a temp programmer to add to the list
    
    struct LinkedList programmerList = createEmptyLinkedList();
    // open the data file
    ProgFile = OpenAsInput( "programmers.txt" );
    
    //  read the number of programmer records
    
    fscanf( ProgFile, "%d",
           &RecordCount );
    
    
    
    
    //  read each programmer's record
    
    while( RecordCount )
    {  //  while RecordCount ! 0
        
        //  get memory for the new programmer
        
        
        TempProg = NewProgrammer();
        
        
        // check if we got a block of memory
        if( TempProg == NULL ){
            ErrorExit( "could not get memory for TempProg", "in function LoadProgrammers", 0 );
        }
        
        // read the id, first name, and last name
        fscanf( ProgFile, "%d %s %s",
               &TempProg -> Id, TempProg -> FirstName, TempProg -> LastName );
        
        // read project1, project2, and skill count
        
        fscanf( ProgFile, "%d %d %d",
               &TempProg -> Proj1, &TempProg -> Proj2, &TempProg -> SkillCount );
        
        // read the skills that the programmer has
        for( Index = 0;  Index < TempProg -> SkillCount;  Index ++ )
            fscanf( ProgFile, "%s",
                   TempProg -> Skills[ Index ] );
        
        
        
        // add the record to the ProgrammersList
        AddItem(&programmerList, TempProg );
        
        -- RecordCount;
        
    }  //  while RecordCount ! 0
    
    //  close the input data file
    fclose( ProgFile );
    
    return programmerList;
    
}  //  void LoadProgrammers()

//return 1(true) if this programmer has any available project slots,
//and 0, if it doesn't.
int ProgrammerHasAvailableSlots(struct Programmer* programmer){
    return (programmer->Proj1 == -1 || programmer->Proj2 == -1) ? 1 : 0;
}

void RemoveUnusableProgrammers(struct LinkedList* programmerList){

    //OK, first thing, let's look through the programmers and remove any of them that are already assigned to 2 projects, since we can't use them for anything.
    //Going to keep track of the previous node as well, since we're going to need it to drop nodes.
    
    struct LinkNode* next = programmerList->Head;
    struct LinkNode* prev = NULL;
    
    while(next != NULL){
        PROGRAMMERPTR programmer = next->Data;
        
        //OK look at both projects, and remove this programmer if they're both assigned
        if(programmer->Proj1 > -1 && programmer->Proj2 > -1){
            //OK we need to remove this programmer.
            
            if(DEBUGON){printf("In RemoveUnusableProgrammers: Removing Programmer ID:%d\n", programmer->Id);}
            
            //if the PREV is NULL, then we're at the head. Reassign the head, and remove.
            if(NULL == prev){
                struct LinkNode* tmpPtr = next;//store this away for later.
                programmerList->Head = next->Next; //fix up the head of the list
                programmerList->Count--; //one less in the list
                next = programmerList->Head;//re-set next for the loop.
                FreeNode(tmpPtr);//free our memory
                continue;
                
            }else{
                //Here we need to keep prev, and have it point to the 'next' next.
                struct LinkNode* tmpPtr = next;//store this away for later.
                prev->Next = next->Next;//have prev point to the right node
                next = next->Next; //set for loop iterator.
                programmerList->Count--;//one less in the list.
                FreeNode(tmpPtr);//free our memory.
                continue;//next loop iteration
            }
        }else{//else - one project at least was unassigned.
            prev = next;
            next = next->Next;
        }//end if check for projects.
        
        
    }//end while loop.
    
}//End RemoveUnusable Programmers


//This will cycle through the list of programmers, and assemble a programmer tuple based on the bits set in the current mask. This way
//I can iteratively go through every 3 and 4tuple, and find out which ones can complete each project.

struct ProgrammerTuple ProgrammerTupleFromMask(PROGRAMMERPTR *arbitraryProgrammerList, int programmerListSize, int *mask, int tupleSize){
    struct ProgrammerTuple toReturn;
    //toReturn.Count = tupleSize;
    int count = 0;// how many programmers we've assigned to this tuple.
    
    for(int i = 0; i < programmerListSize; i++){
        struct Programmer *currentProgrammer = arbitraryProgrammerList[i];//just for clarity.
        
        //if(DEBUGON){ printf("Examining programmer: %d\n", currentProgrammer->Id);}//debug printing
        
        if(mask[i] == 1){
            toReturn.IDs[count++] = currentProgrammer->Id;
        }
    }
    
    //set count.
    toReturn.Count = count;
    
    return toReturn; //return our new tuple.
}




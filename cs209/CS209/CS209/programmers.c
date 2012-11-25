//  programmers.c
//  Raymond Lamp
//  09/19/2011
//  used to create a linked list of programmers from the programmers.txt file

#include <stdio.h>
#include <stdlib.h>
//#include <malloc.h>


#include "myfunctions.h"

#include "linkedlist.h"

#include "programmers.h"

#include "menu.h"



int mainP( int argc, char *args[] )
{  //  int main( argc, *args[] )
    
    //  initialize data structures
    InitializeProgram();
    
    //  the program menu
    Menu();
    
    
    //  free allocated memory
    CloseProgram();
    
    
    // wait for a key to be pressed
    system( "pause" );
    
    //  return back to the os
    return( 0 );
    
    
}  //  int main( argc, *args[] )



void InitializeProgram()
{  //  void InitializeProgram()
    
    InitProgrammersList();
    
    LoadProgrammers();
    
}  //  void InitializeProgram()



void CloseProgram()
{  //  void CloseProgram()
    
    //  free up the nodes in the programmers list
    
    FreeProgrammersList();
    
    
}  //  void CloseProgram()


//  myfunctions.h
//  Raymond Lamp
//  09/14/2011
//  my general fumctions and pcb data structs

//  modified on 09/19/2011




//  used to initialize pointer to structures ...
//  function body is found after the main function
void InitializeProgram();

//  used to free any allocated menory from data structures
//  function body is after the program main function
void CloseProgram();

//  display messages and exit back to the os with an ErrorCode

void ErrorExit( char *Message1, char *Message2, int ErrorCode  )
{  //  void ErrorExit( *Message1, *Message2, ErrorCode )
    
    printf("\n%s\n%s\n", Message1, Message2 );
    
    CloseProgram();  // free any allocated menory
    
    
    exit( ErrorCode );
    
}  //  void ErrorExit( *Message1, *Message2, ErrorCode )

// open a file for input


FILE * OpenAsInput( char *FileName )
{  //  FILE * OpenAsInput( *FileName )
    
    FILE *TempFile;  // return from this function
    
    TempFile = fopen( FileName, "rt" );
    
    if( TempFile == NULL )
        ErrorExit( "could not open as input", FileName, 1 );
    
    return( TempFile );
    
    
    
}  //  FILE * OpenAsInput( *FileName )



// open a file for output

FILE * OpenAsOutput( char *FileName )
{  //  FILE * OpenAsOutput( *FileName )
    
    FILE *TempFile;
    
    TempFile = fopen( FileName, "w+t" );
    
    if( TempFile == NULL )
        ErrorExit( "could not open as output", FileName, 2 );
    
    return( TempFile );
    
}  //  FILE * OpenAsOutput( *FileName )



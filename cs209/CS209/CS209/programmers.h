//  programmers.h
//  Raymond Lamp
//  09/19/2011
//  programmers data//  programmers data

#define SKILLNAMESIZE 32
#define NAMESIZE 32
#define MAXSKILLS 10

#define PROGRAMMERPTR struct Programmer *

struct Programmer
{  //  struct Programmer
    
    int Id;  // programmer's id
    char FirstName[ NAMESIZE ];  // programmer's first name
    char LastName[ NAMESIZE ];  //  programmer's last name
    int Proj1;  //  project 1 that the programmer is working on
    int Proj2;  //  project 2 that the programmer is working on
    int SkillCount;  // the number of skills the programmer has
    char Skills[ MAXSKILLS ][ SKILLNAMESIZE ];  // the array of zstrings of the programmer's skills
    
};  //  struct Programmer



PROGRAMMERPTR NewProgrammer()
{  //  PROGRAMMERPTR NewProgrammer()
    
    return( malloc( sizeof( struct Programmer ) ) );
    
}  //  PROGRAMMERPTR NewProgrammer()


void LoadProgrammers()
{  //  void ReadProgrammers()
    
    FILE *ProgFile;  // file pointer to the programmers.txt data file
    int RecordCount;  // number of programmer records in the data file
    int Index;  // used to read the programmer's skills
    
    PROGRAMMERPTR TempProg;  //  a pointer to a temp programmer to add to the list
    
    
    
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
        if( TempProg == NULL )
            ErrorExit( "could not get memory for TempProg", "in function LoadProgrammers", 0 );
        
        
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
        AddProgrammer( TempProg );
        
        -- RecordCount;
        
    }  //  while RecordCount ! 0
    
    //  close the input data file
    fclose( ProgFile );
    
}  //  void LoadProgrammers()


void ShowProgrammer( PROGRAMMERPTR P )
{  //  void ShowProgrammer( *P )
    
    
    int Index;
    
    //  id, first name, and last name
    printf( "\n\n     %6d %s %s\n",
           P -> Id, P-> FirstName, P -> LastName );
    
    
    // project1, project 2, and skill count
    printf( "     %6d %6d %6d\n",
           P -> Proj1, P -> Proj2, P -> SkillCount );
    
    //  the skills
    
    printf( "     " );
    
    for( Index = 0;  Index < P -> SkillCount;  Index ++ )
        printf( "%s ",
               P -> Skills[ Index ] );
    
    
    puts( "" );
    
}  //  void ShowProgrammer( *P )



void DoShowProgrammers()
{  //  void DoShowProgrammers()
    
    
    char TempChar;
    
    NODEPTR TempNode;
    
    TempNode = GetHeadProgrammer();
    
    while( TempNode != NULL )
    {  // while not at end of the linked list of programmers
        
        
        ShowProgrammer( TempNode -> Data );
        
        TempChar = ' ';
        printf( "\n\n     enter n for next programmer or m to go back to the menu: " );
        while(( TempChar != 'n' ) && ( TempChar != 'm' ))
            scanf( " %c", &TempChar );
        
        if( TempChar == 'm' )
            return;  // go back to the menu
        
        TempNode = GetNextProgrammer( TempNode );  //  next record
    }  //  while not at the end of the linked list of programmers
    
    
    
    
    TempChar = ' ';
    
    // display prompt and get char
    printf( "\n\n     enter m to go back to the menu: " );
    while( TempChar != 'm' )
        scanf( " %c", &TempChar );
    
}  //  void DoShowProgrammers()




char BackToMenu()
{  //  char BackToMenu()
    
    char TempChar;
    
    TempChar = ' ';
    printf( "\n\n     enter m to go back to the main menu: " );
    while( TempChar != 'm' )
        scanf( " %c", &TempChar );
    
    return( TempChar );  // should only return 'm'
    
}  // char BackToMenu()

char NextOrMenu()
{  //  char NextOrMenu()
    
    char TempChar;
    
    
    TempChar = ' ';
    printf("\n\n     enter n for next record or m to go back to the menu: " );
    while(( TempChar != 'n' ) && ( TempChar != 'm' ))
        scanf( " %c", &TempChar );
    
    return( TempChar );  // return 'n' or 'm'
    
}  //  char NextOrMenu()



void PromptForString( char *Prompt, char *Str )
{  //  void PromptForString( *Prompt, *Str )
    
    printf("\n\n     %s: ", Prompt );
    scanf( "%s", Str );
    
    
}  //  void PromptForString( *Prompt, *Str )


void DoFindName()
{  //  void DoFindName()
    
    
    char TempStr[ NAMESIZE ];
    NODEPTR TempNode;
    PROGRAMMERPTR TempProg;
    
    PromptForString( "enter the name to search for", TempStr );
    
    
    
    TempNode = GetHeadProgrammer();
    
    while( TempNode != NULL )
    {  // while not at end of the list
        
        TempProg = TempNode -> Data;
        
        if(
           ( strcmp( TempProg -> FirstName, TempStr ) == 0 )
           || ( strcmp( TempProg -> LastName, TempStr ) == 0 ) )
        {  // if a match was found
            
            ShowProgrammer( TempProg );
            
            if( NextOrMenu() == 'm' )
                return;  // go back to the menu
            
        }  // if a match was found
        
        TempNode = GetNextProgrammer( TempNode );
        
        
    }  //  while not at the end of the list
    
    BackToMenu();
    
    
}  //  void DoFindName()





void DoFindSkill()
{  //  void DoFindSkill()
    
    
    int Index;
    char TempStr[ SKILLNAMESIZE ];
    NODEPTR TempNode;
    PROGRAMMERPTR TempProg;
    int Found;
    
    PromptForString( "enter the skill to search for: ", TempStr );
    
    TempNode = GetHeadProgrammer();
    
    while( TempNode != NULL )
    {  //  while not at end of list
        
        // search the skills
        
        Found = 0;  // no match found
        
        TempProg = TempNode -> Data;
        
        for( Index = 0;  Index < TempProg -> SkillCount;  Index ++ )
            if( strcmp( TempProg -> Skills[ Index ], TempStr ) == 0 )
                Found = 1;  // a match was found
        
        
        
        if( Found == 1 )
        {  // if a match was found
            
            ShowProgrammer( TempProg );
            
            if( NextOrMenu() == 'm' )
                return;  // back to the menu
            
        }  // if a match was found
        
        
        TempNode = GetNextProgrammer( TempNode );
        
        
    }  //  while not at end of list
    
    BackToMenu();
    
}  //  void DoFindSkill()

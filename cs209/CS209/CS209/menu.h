//
//  menu.h
//  CS209
//
//  Created by Thomas Byrne on 11/15/12.
//  Copyright (c) 2012 Thomas Byrne. All rights reserved.
//

//  menu.h
//  Raymond Lamp
//  09/19/2011
//  program menu

void Menu()
{  //  void Menu()
    
    
    char Option;
    
    Option = ' ';
    
    while( Option != 'E' )
    {  // while not exit
        
        
        // menu title
        printf( "\n\n%48s\n\n", "programmers menu" );
        
        
        // options
        
        printf( "     P:  show the programmers\n\n" );
        
        printf( "     N:  search for a name\n\n" );
        
        printf( "     S:  search for a skill\n\n" );
        
        printf( "     E:  exit this program\n\n" );
        
        printf ("     enter your selection: " );
        scanf( " %c", &Option );
        
        switch( Option )
        {  // switch Option
                
            case 'P':  DoShowProgrammers();  break;
                
            case 'N':  DoFindName();  break;
                
            case 'S':  DoFindSkill();  break;
                
                
        }  // switch Option
        
        
        
    }  //  while not exit
    
    
}  //  void Menu()


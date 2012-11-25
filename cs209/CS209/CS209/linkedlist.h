//  linkedlist.h
//  Raymond Lamp
//  09/19/2011
//  the linked list


//  a link node
#define NODEPTR struct LinkNode *

struct LinkNode
{  //  struct LinkNode
    
    void *Data;  // the node data
    NODEPTR Next;  //  next node in the list
    
};  //  struct LinkNode




NODEPTR NewNode()
{  //  NODEPTR NewNode()
    
    
    NODEPTR TempNode;
    
    TempNode = malloc( sizeof( struct LinkNode ) );
    
    return( TempNode );
    
}  //  NODEPTR NewNode()



void FreeNode( NODEPTR N )
{  //  void FreeNode( *N )
    
    
    void * TempData;
    
    //  free the data at the node
    
    TempData = N -> Data;
    free( TempData);
    
    //  free the node
    free( N );
    
    
    
}  //  void FreeNode( *N )



// the linked list

#define LISTPTR struct LinkedList *

struct LinkedList
{  //  struct LinkedList
    
    int Count;  // number of nodes in the list
    NODEPTR Head;  // the head of the LinkedList
    
};  //  struct LinkedList




struct LinkedList ProgrammersList;

void InitProgrammersList()
{  //  void InitProgrammersList()
    
    ProgrammersList. Count = 0;  // no items in the list
    ProgrammersList. Head = NULL;  // points to nothing
    
}  //  void InitProgrammersList()


int AddProgrammer( void *P )
{  //  int AddProgrammer( *P )
    
    NODEPTR TempNode;  // a temp node
    
    
    
    TempNode = NewNode();
    
    //  did we get a new node
    if( TempNode == NULL )
        ErrorExit( "could not get memory for TempNode", "in AddProgrammer", 0 );
    
    
    //  to get here we got a TempNode
    
    TempNode -> Data = P;  // add the programmer
    TempNode -> Next = ProgrammersList. Head;  // place TempNode at the head of the list
    
    ProgrammersList. Head = TempNode;  // now point to the new head of the list
    
    
    
    ++ ProgrammersList. Count;  //  add 1 to the count
    
    return( ProgrammersList. Count );
    
    
}  //  int AddProgrammer( *P )





void FreeProgrammersList()
{  //  void FreeProgrammersList()
    
    
    NODEPTR TempNode;
    NODEPTR NextNode;
    TempNode = ProgrammersList. Head;
    
    while( TempNode != NULL )
    {  // while not finished
        
        
        NextNode = TempNode -> Next;  // next node in the list
        
        FreeNode( TempNode );
        
        TempNode = NextNode;  // go to next node in the list
        
    }  //  while not finished
    
    
    ProgrammersList. Count = 0;
    
    ProgrammersList. Head = NULL;
    
    
}  //  void FreeProgrammersList()




NODEPTR GetHeadProgrammer()
{  //  NODEPTR GetHeadProgrammer()
    
    return( ProgrammersList. Head );  // ghe head of the list
    
}  //  NODEPTR GetHeadProgrammer()



NODEPTR GetNextProgrammer( NODEPTR N )
{  //  NODEPTR GetNextProgrammer( *N )
    
    
    return( N -> Next );
    
}  //  NODEPTR GetNextProgrammer( *N )

//  linkedlist.h
//  Raymond Lamp
//  09/19/2011
//  the linked list



// I've taken out the Programmer specific list, and made this a generic linked list creation/destruction/manipulation library.
// Now we can create multiple instances of a LinkedList and operate on them seperately.

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

//#define LISTPTR struct LinkedList *

struct LinkedList
{  //  struct LinkedList
    
    int Count;  // number of nodes in the list
    NODEPTR Head;  // the head of the LinkedList
    
};  //  struct LinkedList



struct LinkedList createEmptyLinkedList(){
    struct LinkedList toReturn;
    toReturn.Count = 0;
    toReturn.Head = NULL;
    return toReturn;
}



//Add this data to the SetList. Return 1(True) if we did,
//and 0(false) if we didn't.
int AddItem(struct LinkedList* list, void *P){
    NODEPTR TempNode;  // a temp node
    
    
    
    TempNode = NewNode();
    
    //  did we get a new node
    if( TempNode == NULL ){
        ErrorExit( "could not get memory for TempNode", "in AddProgrammer", 0 );
    }
    //  to get here we got a TempNode
    
    TempNode -> Data = P;  // add the programmer
    TempNode -> Next = list->Head;  // place TempNode at the head of the list
    
   list->Head = TempNode;  // now point to the new head of the list
    
    
    
    ++ list->Count;  //  add 1 to the count
    
    return( list->Count );
}


void FreeLinkedList(struct LinkedList* list)
{  //  void FreeLinkedList()
    
    
    NODEPTR TempNode;
    NODEPTR NextNode;
    TempNode = list->Head;
    
    while( TempNode != NULL )
    {  // while not finished
        
        
        NextNode = TempNode -> Next;  // next node in the list
        
        FreeNode( TempNode );
        
        TempNode = NextNode;  // go to next node in the list
        
    }  //  while not finished
    
    
    list->Count = 0;
    
    list->Head = NULL;
    
    
}  //  void FreeLinkedList()

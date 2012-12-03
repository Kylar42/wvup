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



//return an empty linked list structure.
struct LinkedList createEmptyLinkedList(){
    //define our structure
    struct LinkedList toReturn;
    
    //set our defaults.
    toReturn.Count = 0;
    toReturn.Head = NULL;
    
    return toReturn;
}//end createEmptyLinkedList



//Add this data to the SetList. Return 1(True) if we did,
//and 0(false) if we didn't.
int AddItem(struct LinkedList* list, void *P){
    NODEPTR TempNode;  // a temp node
    
    //allocate
    TempNode = NewNode();
    
    //  did we get a new node
    if( TempNode == NULL ){
        ErrorExit( "could not get memory for TempNode", "in AddProgrammer", 0 );
    }
    //  to get here we got a TempNode
    
    TempNode -> Data = P;  // add the data pointer
    TempNode -> Next = list->Head;  // place TempNode at the head of the list
    
   list->Head = TempNode;  // now point to the new head of the list
    
    ++ list->Count;  //  add 1 to the count
    
    return( list->Count );
}

//add this node to this linked list. This is useful if we've removed this node from a
//different linked list.
int addNode(struct LinkedList* list, NODEPTR ptr){
    ptr->Next = list->Head;//set the next pointer
    
    list->Head = ptr;//set the head of the list to this node
    
    list->Count++;// add one to count.
    
    return (list->Count);
}//end add


//remove the node from the linked list. 
void RemoveNode(struct LinkedList* list, NODEPTR N){
    NODEPTR prev = NULL;
    NODEPTR next = list->Head;
    
    //might be the head.
    if(next == N){
        //if it is, point the head to the next node
        list->Head = next->Next;//remove the pointer
        
        list->Count --;
        return;
    }
    
    
    while(next != NULL){
        
        if(next == N){
            prev->Next = next->Next;
            list->Count--;
        }
        prev = next;
        next = next->Next;
    }
    
}//End of RemoveNode

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

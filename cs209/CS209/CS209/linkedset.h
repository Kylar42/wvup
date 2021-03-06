//
//  linkedset.h
//  CS209
//
//  Created by Thomas Byrne on 11/24/12.
//  Copyright (c) 2012 Thomas Byrne. All rights reserved.
// An unordered doubly linked list that contains char[10] objects, and compares them for equality on insert.
//

#define PTR struct SetListNode *

struct SetListNode
{
    char data[SKILLNAMESIZE]; //data - will hold a skill
    PTR Prev; // previous node.
    PTR Next; // next node
};



PTR NewSetListNode(){
    PTR toReturn;
    toReturn = malloc( sizeof(struct SetListNode));
    return toReturn;
}


void FreeSetListNode(PTR node)
{
    //Only have to call free on the struct since there's no embedded data pointers.
    free(node);
}


struct SetList
{
    int Count;
    PTR Head;
    PTR Tail;
};

//Function to create a new, empty SetList.
struct SetList createEmptySetList(){
    struct SetList toReturn;
    toReturn.Count = 0;
    toReturn.Head = NULL;
    toReturn.Tail = NULL;
    return toReturn;
}



//Add this data to the SetList. Return 1(True) if we did,
//and 0(false) if we didn't.
int AddDataToSetList(struct SetList* list, char data[SKILLNAMESIZE]){
    
    //OK, let's first see if our list is empty.
    
    if(0 == list->Count){
        PTR node = NewSetListNode();
        strncpy(node->data, data, 10);
        node->Prev = NULL;//nothing before
        node->Next = NULL;//nothing after.
        list->Head = node;//point the list head and tail to this node.
        list->Tail = node;
        list->Count++;//mark that we added a node.
        return 1;//success! 
    }
    
    PTR nxt = list->Head;
    while(nxt != NULL){
        
        if(DEBUGON){printf("Comparing %s to %s \n", nxt->data, data);}
        
        if(0 == strcmp(nxt->data, data)){ //is this data right?
            return 0;//found a match, no insert.
        }
        nxt = nxt->Next;
    }
    
    //If we got here, we should be at the end of the SetList, and didn't find the data. 
    PTR node = NewSetListNode(); //new node
    
    strcpy(node->data, data); //copy the data into the node.
    
    node->Prev = list->Tail; //add it at the end.
    node->Next = NULL;
    
    list->Tail->Next = node; //update the previous tail.
    list->Tail = node; //we are the new tail.
    list->Count++; //one more node.
    return 1; //return true!
    
    
}//End AddDataToSetList

/*
 remove a specific element from the list, and free the associated memory.
 */
int RemoveFromSetListAndFree(struct SetList* list, char data[SKILLNAMESIZE]){
    if(0 == list->Count){
        return 0;//failed. Nothing in our list, nothing to free.
    }
    
    PTR nxt = list->Head;
    while(nxt != NULL){
        if(0 == strcmp(data, nxt->data)){
            //found it. Remove this node and return.
            
            //Get the previous and following nodes.
            PTR prev = nxt->Prev;
            PTR next = nxt->Next;
            
            //Two special cases - this node may be the head, or the tail.
            //if this node is the head, assign the head pointer to the next node.
            if(list->Head == nxt){
                list->Head = next;
            }
            
            //if this node is the tail node, assign the tail node to the previous node.
            if(list->Tail == nxt){
                list->Tail = prev;
            }
            //if previous node isn't NULL, assign it's Next pointer to the following node.
            if(prev != NULL){
                prev->Next = next;
            }
            //if the next node isn't NULL, assign it's prev pointer to the previous node.
            if(next != NULL){
                next->Prev = prev;  
            }
            list->Count--;//1 less item in the list.
            
            
            //release our memory.
            FreeSetListNode(nxt);
            
            return 1;//return success!
            
        }
        nxt = nxt->Next;//keep looking.
    }
    
    
    return 0;//we hit the end, nothing was there.
}

//This method will return 1 if the data exists in the setlist,
//and 0 if it does not.
int DoesSetListContainData(struct SetList* list, char data[10]){
    PTR node = list->Head;
    
    while(node != NULL){ //loop through nodes
        if(0 == strcmp(data, node->data)){ //does it match?
            return 1; //Yes! Return true(1).
        }
        node = node->Next;
    }
    
    return 0; //got here, didn't find this data. Return false(0).

}//end int setListContainsData

void FreeSetList(struct SetList* list)
{  //  void FreeLinkedList()
    
    
    PTR TempNode;
    PTR NextNode;
    TempNode = list->Head;
    
    while( TempNode != NULL )
    {  // while not finished
        
        
        NextNode = TempNode -> Next;  // next node in the list
        
        FreeSetListNode( TempNode ); // free the memory.
        
        TempNode = NextNode;  // go to next node in the list
        
    }  //  while not finished
    
    
    list->Count = 0;
    
    list->Head = NULL;
    list->Tail = NULL;
    
}  //  void FreeLinkedList()


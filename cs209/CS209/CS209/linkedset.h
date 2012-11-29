//
//  linkedset.h
//  CS209
//
//  Created by Thomas Byrne on 11/24/12.
//  Copyright (c) 2012 Thomas Byrne. All rights reserved.
// An unordered doubly linked list that contains char[10] objects, and compares them for equality on insert.
//

#define PTR struct Node *

struct Node
{
    char data[SKILLNAMESIZE]; //data - will hold a skill
    PTR Prev; // previous node.
    PTR Next; // next node
};



PTR newNode(){
    PTR toReturn;
    toReturn = malloc( sizeof(struct Node));
    return toReturn;
}


void freeNode(PTR node)
{
    //Only have to call free on the struct since there's no embedded pointers.
    free(node);
}


struct SetList
{
    int count;
    PTR head;
    PTR tail;
};

struct SetList createEmptySetList(){
    struct SetList toReturn;
    toReturn.count = 0;
    toReturn.head = NULL;
    toReturn.tail = NULL;
    return toReturn;
}



//Add this data to the SetList. Return 1(True) if we did,
//and 0(false) if we didn't.
int add(struct SetList* list, char data[SKILLNAMESIZE]){
    
    //OK, let's first see if our list is empty.
    
    if(0 == list->count){
        PTR node = newNode();
        strncpy(node->data, data, 10);
        node->Prev = NULL;//nothing before
        node->Next = NULL;//nothing after.
        list->head = node;//point the list head and tail to this node.
        list->tail = node;
        list->count++;//mark that we added a node.
        return 1;//success! 
    }
    
    PTR nxt = list->head;
    while(nxt != NULL){
        
        //printf("Comparing %s to %s \n", nxt->data, data);
        
        if(0 == strcmp(nxt->data, data)){
            return 0;//found a match, no insert.
        }
        nxt = nxt->Next;
    }
    
    //If we got here, we should be at the end. 
    PTR node = newNode();
    strcpy(node->data, data);
    node->Prev = list->tail;
    node->Next = NULL;
    list->tail->Next = node;
    list->tail = node;
    list->count++;
    return 1;
    
    
}
/*
 remove a specific element from the list, and free the associated memory.
 */
int removeAndFree(struct SetList* list, char data[SKILLNAMESIZE]){
    if(0 == list->count){
        return 0;//failed. Nothing in our list, nothing to free.
    }
    
    PTR nxt = list->head;
    while(nxt != NULL){
        if(0 == strcmp(data, nxt->data)){
            //found it. Remove this node and return.
            
            //Get the previous and following nodes.
            PTR prev = nxt->Prev;
            PTR next = nxt->Next;
            
            //Two special cases - this node may be the head, or the tail.
            //if this node is the head, assign the head pointer to the next node.
            if(list->head == nxt){
                list->head = next;
            }
            
            //if this node is the tail node, assign the tail node to the previous node.
            if(list->tail == nxt){
                list->tail = prev;
            }
            //if previous node isn't NULL, assign it's Next pointer to the following node.
            if(prev != NULL){
                prev->Next = next;
            }
            //if the next node isn't NULL, assign it's prev pointer to the previous node.
            if(next != NULL){
                next->Prev = prev;  
            }
            list->count--;//1 less item in the list.
            
            
            //release our memory.
            freeNode(nxt);
            
            return 1;//return success!
            
        }
        nxt = nxt->Next;//keep looking.
    }
    
    
    return 0;//we hit the end, nothing was there.
}


void debugPrintSetList(struct SetList list){
    PTR node = list.head;
    printf("\n==================\n");
    while(node != NULL){
        printf("%s", node->data);
        printf("\n");
        node = node->Next;
    }
}

void testSetList(){
    struct SetList skillList = createEmptySetList();
    char a[10] = ".c";
    
    add(&skillList, a);
    add(&skillList, "assembly");
    add(&skillList, "basic");
    debugPrintSetList(skillList);
    add(&skillList, "c++");
    debugPrintSetList(skillList);
    add(&skillList, ".c");
    debugPrintSetList(skillList);
    add(&skillList, "c++");
    add(&skillList, "PHP");
    debugPrintSetList(skillList);
    
    removeAndFree(&skillList, "basic");
    
    debugPrintSetList(skillList);
    
}



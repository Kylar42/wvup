//
//  linkedset.h
//  CS209
//
//  Created by Thomas Byrne on 11/24/12.
//  Copyright (c) 2012 Thomas Byrne. All rights reserved.
// An unordered doubly linked list that contains char[10] objects, and compares them for equality on insert.
//

#define PTR struct Node *

struct 
{
    char[10] data; //data - will hold a skill
    PTR Prev; // previous node.
    PTR Next; // next node
}Node;


struct{
    int count;
    PTR head;
    PTR tail;
}SetList

PTR newNode(){
    PTR toReturn = malloc( sizeOf(struct Node));
    return PTR;
}



SetList create(){
    struct SetList toReturn;
    toReturn.count = 0;
    toReturn.head = NULL;
    toReturn.tail = NULL;
}

//Add this data to the SetList. Return 1(True) if we did,
//and 0(false) if we didn't.
int add(SetList list, char[10] data){
    //OK, let's first see if our list is empty.
    
    if(0 == list.count){
        PTR node = newNode();
        node.data = data;
        node.Prev = NULL;//nothing before
        node.Next = NULL;//nothing after.
        list.head = node;
        list.tail = node;
        return 1;
    }
    
    for(int i = 0; i < list.count; i++){
            
    }
}
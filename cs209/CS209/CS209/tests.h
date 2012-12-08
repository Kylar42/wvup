//
//  tests.h
//  CS209
//
//  Created by Thomas Byrne on 12/7/12.
//  Copyright (c) 2012 Thomas Byrne. All rights reserved.
//

//This will test my mask generation and iterations.
//it creates masks of different sizes, all with 4 bits, and counts the permutations.
// I can look at the outputs and make sure that they're right.
void testMaskGeneration(){
    int maskBits = 4;
    for(int size = 5; size < 17; size++){
        int mask[size];
        InitializeMaskArray(mask, size, maskBits);
        int full = 0;
        int count = 0;
        while(full == 0){
            if(DEBUGON){ printMask(mask, size);}
            GetNextMaskIteration(mask, size, 0);
            //check to see if the last
            full = IsMaskFull(mask, size, maskBits);
            count++;
        }
        printf("Found %d Permutations for %d bits in %d size mask\n", count, maskBits, size);
    }
    
}

void debugPrintSetList(struct SetList list){
    PTR node = list.Head;
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
    
    AddDataToSetList(&skillList, a);
    AddDataToSetList(&skillList, "assembly");
    AddDataToSetList(&skillList, "basic");
    debugPrintSetList(skillList);
    AddDataToSetList(&skillList, "c++");
    debugPrintSetList(skillList);
    AddDataToSetList(&skillList, ".c");
    debugPrintSetList(skillList);
    AddDataToSetList(&skillList, "c++");
    AddDataToSetList(&skillList, "PHP");
    debugPrintSetList(skillList);
    
    RemoveFromSetListAndFree(&skillList, "basic");
    
    debugPrintSetList(skillList);
    
    
    
}

void runAllTests(){
    testSetList();
    testMaskGeneration();
}

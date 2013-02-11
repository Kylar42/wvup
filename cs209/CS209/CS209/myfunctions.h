//  myfunctions.h
//  Raymond Lamp
//  09/14/2011
//  my general fumctions and pcb data structs

//  modified on 09/19/2011

// Added some utility functions for my own use. -tbyrne


//  display messages and exit back to the os with an ErrorCode

void ErrorExit( char *Message1, char *Message2, int ErrorCode  )
{
    
    printf("\n%s\n%s\n", Message1, Message2 );
    
    //CloseProgram();  // free any allocated menory
    
    
    exit( ErrorCode );
    
}

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


//simple function I took from stackoverflow and modified.
//I'm going to use the isspace() call to remove whitespace from the beginning
//and end of the string.
char *TrimWhitespace(char *str)
{
    char *end;
    
    // Trim leading space
    while(isspace(*str)){
        str++;
    }
    
    if(*str == 0){  // All spaces?
        return str;
    }
    
    // Trim trailing space
    end = str + strlen(str) - 1;
    
    while(end > str && isspace(*end)){ //isspace is from ctypes.h
        end--;
    }
    
    // Write new null terminator
    *(end+1) = 0;
    
    return str;
}//End Trim whitespace.


//simple function that returns 1(true) if the array contains the value. 0(false) if not.
int IntArrayContainsValue(int values[], int sizeOfArray, int valueToCheck){
    
    for(int i = 0; i < sizeOfArray; i++){//loop through the array
    
        if(values[i] == valueToCheck){//if it matches, return true
            return 1;
        }//end if
    }//end for
    
    return 0;//if we iterated the whole array and didn't find it, return false.
}//end intArrayContainsValue



//This will generate a starting array, with the correct numBits set to 1.
//for example, if you pass in a size of 10 and a numBits of 3, you will end up with:
// [1, 1, 1, 0, 0, 0, 0, 0, 0, 0]
void InitializeMaskArray(int *mask, int size, int numBits){
    for(int i = 0; i < size; i++){
        mask[i] = (i < numBits) ? 1 : 0;
    }
}//end InitializeMaskArray


// This function looks at a mask/bitset, and determines if the 1's are all in the highest-order positions.
// The mask is an int array that looks like a bitset, eg: [0, 0, 1, 1, 0].
// this returns true if the maskSize number of bits are all 1 at the end of the array.
int IsMaskFull(int *mask, int size, int maskSize){
    for(int i = 0; i < maskSize; i++){// iterate the size of the mask
        int index = size-(i+1);// the index is the end, minus the count.
        
        if(mask[index] == 0){//from the right, for maskSize number of bits.
            return 0;//All the top maskSize bits must be 1, or the mask isn't full.
        }
        
    }
    
    return 1;//success! All the high order bits in the mask are 1.
}//end isMaskFull


/*
 This is a bit of a complicated function. It takes in an int array that is treated like a mask, or bitset.
 for example: [1,1,0,0]
 and it's function is to manipulate the mask by moving the highest order set bit that it can, up by one.
 So, as an example, the previous set would be manipulated like this:
 Start: 1 1 0 0 0 (size = 5)
 iter1: 1 0 1 0 0
 iter2: 1 0 0 1 0
 iter3: 1 0 0 0 1
 iter4: 0 1 1 0 0
 iter5: 0 1 0 1 0
 iter6: 0 1 0 0 1
 iter7: 0 0 1 1 0
 iter8: 0 0 1 0 1
 iter9: 0 0 0 1 1
 
 End.
 
 The goal is to return all available permutations of the mask with a constant number of 1 bits. 
 
 */
int GetNextMaskIteration(int *mask, int size, int stack){
    
    // If the last bit is one, then we just go through until we find the highest order 1 bit, and move it up by one.
    if(mask[size-1] == 0){
        for(int i = size-2; i >= 0; i--){// start from one less than the end, and iterate to the beginning
            
            if(mask[i] == 1){//we have found a 1.
                mask[i] = 0;//set that index to 0
                mask[i+1] = 1;//and the next index to 1, swapping them.
                
                //here we have a possibility that we were called recursively, and we chopped off a 1 bit at the end.
                //in this case, we should try to append an additional 1 on the next index, and remove it from the end.
                
                if(stack > 0){
                    //we should try to put a 1 in mask[i+2] as well.
                    if((i+2) < size){
                        mask[i+2]=1;
                        //reduce stack by 1 because we were able to do this manipulation.
                        return stack-1;
                    }else{
                        //return stack depth unchanged because we didn't manipulate it.
                        //this will cause the outer loop to leave the 1 that they chopped off where it was, probably the end.
                        return stack;
                    }
                    
                }//end if stack > 0
                
                i = 0;//jump out of the loop.
            }//end if mask == 1
            
        }//End for loop from the beginning.
        
    }else{
        
        //The last item in the mask is a 1. That means we have to find the second last 1 and move it up a bit,
        //then append a 1 after it. What we'll do is set the value at this index to 0, but then
        //add one to our stack, indicating we've got an additional 1 to push back on the mask.
        mask[size-1] = 0;
        
        //So now we're going to pass the same array back in, without the last digit, and recursively we'll find the
        //highest order 1 we can change.
        //this will return our stack size that we still need to manipulate.
        int changed = GetNextMaskIteration(mask, size-1, (stack+1));
        
        //if changed is > 0, it means we still have at least 1 bit on the stack to re add.
        //since we're possibly recursing multiple times, let's set this bit back to 1,
        //reduce our changed/stack, and return the new value.
        
        if(changed > 0){
            mask[size-1] = 1;
            return changed-1;
        }//end if
        
    }//end else
    
    return 0;//the end of the method, we return a 0, so any recursive calls that are looking for a stack will work correctly.
}//end GetNextMaskIteration

//Simple function to print out a Mask
void PrintMask(int *mask, int size){
    for(int i = 0; i < size; i++){
        printf("%d",mask[i]);
    }
    printf("\n");
}





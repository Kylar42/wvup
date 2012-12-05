//  myfunctions.h
//  Raymond Lamp
//  09/14/2011
//  my general fumctions and pcb data structs

//  modified on 09/19/2011

// Added some utility functions for my own use. -tbyrne




//  used to initialize pointer to structures ...
//  function body is found after the main function
//void InitializeProgram();

//  used to free any allocated menory from data structures
//  function body is after the program main function
//void CloseProgram();

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
    
    while(end > str && isspace(*end)){
        end--;
    }
    
    // Write new null terminator
    *(end+1) = 0;
    
    return str;
}//End Trim whitespace.


//simple function that returns 1(true) if the array contains the value. 0(false) if not.
int intArrayContainsValue(int values[], int sizeOfArray, int valueToCheck){
    for(int i = 0; i < sizeOfArray; i++){
        if(values[i] == valueToCheck){
            return 1;
        }//end if
    }//end for
    
    return 0;
}

void flipBit(int *mask[], int bit, int value){
    *mask[bit] = value;
}

int foo(int *mask, int size, int stack){
    if(mask[size-1] == 0){
        //easy. find the next 1 and pull it out one.
        for(int i = size-2; i >= 0; i--){
            if(mask[i] == 1){
                mask[i] = 0;
                mask[i+1] = 1;
                //extra check.
                if(stack > 0){
                    //we should try to put a 1 in mask[i+2] as well.
                    if((i+2) < size){
                        mask[i+2]=1;
                        //reduce stack by 1 because we were able to manipulate.
                        return stack-1;
                    }else{
                        //return stack depth unchanged because we didn't manipulate it.
                        return stack;
                    }
                    
                }
                i = 0;//jump out of the loop.
            }
        }
    }else{
        //last one must be a one.
        mask[size-1] = 0;//set last one to 0, may be set back to 1.
        int changed = foo(mask, size-1, (stack+1));
        if(changed > 0){
            mask[size-1] = 1;
            return changed-1;
        }
    }
    return 0;
}

void printMask(int *mask, int size){
    for(int i = 0; i < size; i++){
        printf("%d",mask[i]);
    }
    printf("\n");
}
int isMaskFull(int *mask, int size, int maskSize){
    for(int i = 0; i < maskSize; i++){
        int index = size-(i+1);
        if(mask[index] == 0){//from the right, for maskSize number of bits.
            return 0;//All the top maskSize bits must be 1.
        }
    }
    return 1;//success! All the high order bits in the mask are 1.
}

void maskTest(){
    int maskBits = 4;
    for(int size = 5; size < 17; size++){
        int mask[size];
        for(int i = 0; i < size;i++){
            mask[i]=0;
        }
        //set the first bits to 1. 
        for(int bit = 0; bit < maskBits; bit++){
            mask[bit] = 1;
        }
        
        int full = 0;
        int count = 0;
        while(full == 0){
            foo(mask, size, 0);
            //check to see if the last
            full = isMaskFull(mask, size, maskBits);
            count++;
        }
        printf("Found %d Permutations for %d bits in %d size mask\n", count, maskBits, size);
    }
    
}


#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAXLINESIZE 512
#define MAXROWS 700
#define MAXFIELDSIZE 128
#define MAXCOLS 27

//defined structure for song and artist
typedef struct {
   char *song;
   char *artist;
}Music;

//Function prototypes
void sort(Music *a, int n);
void parse(char *record, char *delim, char arr[][MAXFIELDSIZE]);

int main() 
{ 
  //Variable decalaration
  Music *musicArray;
  static const char filename[] = "music.txt.tsv";
  char nameField[40];
  int index = 0;
  char arr[MAXCOLS][MAXFIELDSIZE];
  char line[MAXLINESIZE];
  int i = 0;

  musicArray = (Music *)calloc(MAXROWS, sizeof(Music));
  if (musicArray == NULL) 
  {
    printf("Out of memory!!!\n");
    exit(1);
  }

  FILE *file = fopen(filename, "r");
  if ( file == NULL )     
  { 
    printf("Could not open %s for reading \n", filename ); 
    exit(1);       
  }

  fgets(line,sizeof(line),file);//skipping the header row

  while((fgets(line,sizeof(line),file)!= NULL) && (index<MAXROWS)) {
    parse(line,"\t",arr);
     
    musicArray[index].song = (char*)malloc((strlen(arr[0])+1));
    musicArray[index].artist = (char*)malloc((strlen(arr[1])+1));
    
    if ( musicArray[index].song == NULL) 
    {
      printf("Out of memory!!!\n");
      exit(1);
    }
    if ( musicArray[index].artist == NULL)
    {
      printf("Out of memory!!!\n");
      exit(1);
    }

    strcpy(musicArray[index].song, arr[0]);
    strcpy(musicArray[index].artist, arr[1]);
    index++;
  }
  //sort music array
  sort (musicArray, index);

  //print the song and artist
  printf("\nSorted Songs:\n\n");

  for (i = 0; i < index; i++) {
    printf("%s\t%s\n",
      musicArray[i].song, musicArray[i].artist);
      free(musicArray[i].song);
      free(musicArray[i].artist);
  }
  free(musicArray);
  return 0;
}

/*parse tab delimited line of the file*/ 
void parse( char *record, char *delim, char arr[][MAXFIELDSIZE])
{
  char*p=strtok(record,delim);
  int fld=0;
 
  while(p)
  {
    strcpy(arr[fld],p);
    fld++;
    p=strtok(NULL,delim);
  }
}

/* Sort function: Sorts the array based on Song*/
void sort(Music *a, int n) 
{
  int min,i,j;
  Music m;

  for (i = 0; i < n; i++) {
    min = i;
    for (j = i+1; j < n; j++) {
      if (strcmp(a[j].song,a[min].song) < 0) min = j;
    }
    m = a[min];
    a[min] = a[i];
    a[i] = m;
  }
}

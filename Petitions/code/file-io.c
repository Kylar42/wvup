/* prog11-1.c: fileio */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
   char s[20];
   char *p;
   FILE *f;

   strcpy(s,"file I/O test!");

   printf("%s\n",s);

   f = fopen("testfile","w");
   if (f==NULL)
   {
      printf("Error: unable to open testfile for writing\n");
      return EXIT_FAILURE;
   }

   fputs(s,f);

   fclose(f);

   strcpy(s,"overwritten");

   printf("%s\n",s);

   f = fopen("testfile","r");
   if (f==NULL)
   {
      printf("Error: unable to open testfile for reading\n");
      return EXIT_FAILURE;
   }

   if (fgets(s, sizeof s, f) != NULL)
   {
      p = strchr(s,'\n');
      if (p!=NULL)
         *p = '\0';

      printf("%s\n",s);
   }

   fclose(f);

   if (remove("testfile") != 0)
   {
      printf("Error: unable to remove testfile\n");
      return EXIT_FAILURE;
   }

   return EXIT_SUCCESS;
}

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
  if (argc != 2) {
    printf("brightness required.\n");
    return 1;
  }

  FILE* fp = fopen("/sys/class/backlight/intel_backlight/brightness", "w");

  if (fp != NULL) {
    fprintf(fp, "%d", atoi(argv[1]));
    fclose(fp);
  }

  return 0;
}

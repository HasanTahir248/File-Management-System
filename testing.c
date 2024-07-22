#include <stdio.h>

int main() {
    char name[100];

    // Ask for the name
    printf("What is your name? ");
    scanf("%s", name);

    // Print greetings
    printf("Hello, %s! Welcome!\n", name);

    return 0;
}

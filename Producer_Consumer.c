#include <stdio.h>
#include <stdlib.h> 

int mutex = 1, full = 0, empty = 3, x = 0;

void producer();
void consumer();
int wait(int);
int signal(int);

int main() {
    int n;
    printf("\n[1] Producer\n[2] Consumer\n[3] Exit\n");
    while (1) {
        printf("\nProducer/Consumer/Exit = ");
        scanf("%d", &n);
        if (n == 1) {
            if ((mutex == 1) && (empty != 0)) {
                producer();
            } else {
                printf("Buffer Full.\n");
            }
        } else if (n == 2) {
            if ((mutex == 1) && (full != 0)) {
                consumer();
            } else {
                printf("Buffer Empty.\n");
            }
        } else if (n == 3) {
            printf("Exiting...\n");
            exit(0); // Terminate the program
        } else {
            printf("Invalid option. Please enter 1, 2, or 3.\n");
        }
    }
    return 0;
}

int wait(int s) {
    return (--s);
}

int signal(int s) {
    return (++s);
}

void producer() {
    mutex = wait(mutex);
    full = signal(full);
    empty = wait(empty);
    x++;
    printf("Producer produces the item %d\n", x);
    mutex = signal(mutex);
}

void consumer() {
    mutex = wait(mutex);
    full = wait(full);
    empty = signal(empty);
    printf("Consumer consumes the item %d\n", x);
    x--;
    mutex = signal(mutex);
}

#include <stdio.h>
int main() {
    int m, n;

    printf("Enter number of processes: ");
    scanf("%d", &n);
    printf("Enter number of resources: ");
    scanf("%d", &m);
    int alloc[n][m];
    printf("\n==========Allocation==========\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            printf("Enter resource %d of process %d: ", j, i);
            scanf("%d", &alloc[i][j]);
        }
    }
    int max[n][m];
    printf("\n==========Max==========\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            printf("Enter maximum resource %d of process %d: ", j, i);
            scanf("%d", &max[i][j]);
        }
    }
    int avail[m];
    printf("\n==========Available Resources==========\n");
    for (int i = 0; i < m; i++) {
        printf("Enter available resource %d: ", i);
        scanf("%d", &avail[i]);
    }
    // Calculate need matrix
    int need[n][m];
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            need[i][j] = max[i][j] - alloc[i][j];
        }
    }
    int f[n], ans[n], ind = 0;
    for (int k = 0; k < n; k++) {
        f[k] = 0;
    }

    int y = 0;
    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n; i++) {
            if (f[i] == 0) {
                int flag = 0;
                for (int j = 0; j < m; j++) {
                    if (need[i][j] > avail[j]) {
                        flag = 1;
                        break;
                    }
                }
                if (flag == 0) {
                    ans[ind++] = i;
                    for (y = 0; y < m; y++)
                        avail[y] += alloc[i][y];
                    f[i] = 1;
                }
            }
        }
    }

    int flag = 1;
    for (int i = 0; i < n; i++) {
        if (f[i] == 0) {
            flag = 0;
            printf("The system is not in a safe state.\n");
            break;
        }
    }
    if (flag == 1) {
        printf("The system is in a safe state.\n");
        printf("Safe sequence is: ");
        for (int i = 0; i < n - 1; i++)
            printf("P%d --> ", ans[i]);
        printf("P%d\n", ans[n - 1]);
    }

    return 0;
}

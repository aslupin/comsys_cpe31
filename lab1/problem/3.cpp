#include <stdio.h>
int A[8] = {0, 2, 1, 6, 4, 3, 5, 3};
int B[8] = {0, 0, 0, 0, 0, 0, 0, 0};
int C[7] = {0, 0, 0, 0, 0, 0, 0};
int main()
{
    int i;
    int n = 8, k = 7;
    for (i = 1; i < n; i++)
        C[A[i]]++;
    for (i = 2; i < k; i++)
    {
        C[i] = C[i] + C[i - 1];
    }

    for (i = n - 1; i >= 1; i--)
    {
        B[C[A[i]]] = A[i];
        C[A[i]]--;
        printf(" %d", C[A[i]]);
    }
    printf("A[] = \n");
    for (i = 0; i < n; i++)
        printf(" %d", A[i]);
    printf("\n");
    printf("B[] = \n");
    for (i = 0; i < n; i++)
    {
        printf(" %d", B[i]);
    }
    printf("\n");
    return 0;
}
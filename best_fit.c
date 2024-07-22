#include<stdio.h>
#define max 20
void main()
{
int f[max],p[max],i,j,nf,np,temp,lowest=10000;
static int ff[max],pf[max];
printf("\nEnter the number of partitions:");
scanf("%d",&nf);
printf("Enter the number of processes:");
scanf("%d",&np);
printf("\nEnter the size of the partitions:-\n");
for(i=1;i<=nf;i++)
{
printf("Partition %d:",i);
scanf("%d",&f[i]);
}
printf("Enter the size of the processes :-\n");
for(i=1;i<=np;i++)
{
printf("Process %d:",i);
scanf("%d",&p[i]);
}
for(i=1;i<=np;i++)
{
for(j=1;j<=nf;j++)
{
if(ff[j]!=1)
{
temp=f[j]-p[i];
if(temp>=0)
{
if(lowest>temp)
{
pf[i]=j;
lowest=temp;
}
}
}
}
ff[pf[i]]=1;
lowest=10000;
}
printf("\nProcess No\tProcess Size \tPartition Size");
for(i=1;i<=np && pf[i]!=0;i++)
printf("\n%d\t\t%d\t\t%d \n",i,p[i],f[pf[i]]);
}

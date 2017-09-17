/*************************************************************************
	> File Name: read.c
	> Author: XuRi <xuripsw@allwinnertech.com>
	> Created Time: 2017年09月16日 星期六 14时11分13秒
    > Function: Read a file many times.

      (C) 2017 XuRi
      This code is licensed under the GPL2.
 ************************************************************************/

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc,char* argv[])
{
    int fd;
    int n;
    int cnt;
    int COUNT=atoi(argv[3]);
    char buf[atoi(argv[2])];
    
    int readbuf[20];

    fd=open(argv[1],O_RDONLY);
    if(fd<0)
    {
        printf("can't open!\n");
        exit (1);
    }
    
    for(cnt=0;cnt<COUNT;cnt++)
    {
        readbuf[cnt]=atoi(argv[cnt+4]);
        if(readbuf[cnt]!=0)
        {
            n=read(fd,buf,readbuf[cnt]);
            printf("%d\n",readbuf[cnt]); 
            if(n<0)
            {
                printf("Read ERROR!!!\n");
            }
            else
            {
                printf("Read Success.\n");
            }
        }
    }
    if(close(fd)!=0)
    {
        printf("Failed to close.");
    }
    return 0;
}

#include<pthread.h>
#include<stdlib.h>
#include<stdio.h>

#define NUMBER_OF_THREADS 10

void* print_hello_world(void* p)
{
  printf("Hello World, Greetings from thread::");
  printf("%i\n", * (int*)p);
  pthread_exit(NULL);
}

int main() {
  pthread_t threads[NUMBER_OF_THREADS];
  int status, i;
  
  for (i=0; i<NUMBER_OF_THREADS; i++) {
    status = pthread_create(&threads[i], NULL, print_hello_world, &i);
    if (status != 0) {
      printf("Opps, pthread_create returned error code %d", status);
      exit(-1);
    }
    pthread_exit(&i);
  }
  
  return(0);
}
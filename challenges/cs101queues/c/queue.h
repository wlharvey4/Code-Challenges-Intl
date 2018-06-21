/**
   challenges/cs101Queues/c/queue.h
   ====================================================
   CREATED: 2018-06-20
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Implement the following key operations:
          .............................................
            void queue_enqueue(Queue *queue, int data)
	    - Queues data to the back of the queue
	    int queue_dequeue(Queue *queue)
	    - Removes an item from the front of the queue
	      and returns its value
	    int queue_front(const Queue *queue)
	    - Returns the front item of the queue. This
	      operation should not modify the queue.
	    bool queue_is_empty(const Queue *queue)
	    - Checks whether the queue is empty. This
	      operation should not modify the queue.
	 ................................................
	  All of these operations should execute in O(1)
	  time.  Also take care to manage your memory
	  properly.  You may assume that the "front" and
	  "dequeue" operations will not be called on an
	  empty queue provided that you implement all
	  4 key operations correctly.
   NOTES:
   ----------------------------------------------------
 */

# ifndef CC_QUEUE
# define CC_QUEUE

# include <stdlib.h>
# include <stdio.h>
# include <stdbool.h>

typedef struct node {
  int data;
  struct node * next;
} Node;

typedef struct {
  Node * front, * back;
} Queue;

void queue_enqueue(Queue * queue, int data);

int queue_dequeue(Queue * queue);

int queue_front(const Queue * queue);

bool queue_is_empty(const Queue * queue);

#endif

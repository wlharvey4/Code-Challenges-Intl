/**
   challenges/cs101Queues/c/queue.c
   ====================================================
   CREATED: 2018-06-20
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: See https://www.codewars.com/kata/computer-science-101-number-2-queues
   NOTES: This implementation passed the Codewars tests
   ----------------------------------------------------
 */

# include "./queue.h"

void queue_enqueue(Queue * queue, int data) {

  Node * new = malloc(sizeof(Node));
  new->data = data;
  new->next = NULL;

  if (queue->back == NULL)
    queue->front = new;
  else
    queue->back->next = new;

  queue->back = new;
}

int queue_dequeue(Queue * queue) {

  Node * front = queue->front;
  int data = front->data;
  queue->front = front->next;

  if (queue->front == NULL) {
    queue->back = NULL;
  }
  
  free(front);
  return data;
}

int queue_front(const Queue * queue) {
  return queue->front->data;
}

bool queue_is_empty(const Queue * queue) {
  bool b = (queue->front == NULL);
  return b;
}

/**
   challenges/cs101stacks/c/stacks.c
   ====================================================
   CREATED: 2018-06-23
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: See https://www.codewars.com/kata/computer-science-101-number-1-stacks
   NOTES:
   ----------------------------------------------------
 */

# include "./stacks.h"

void stack_push(Stack * stack, int data) {
  Node * node = malloc(sizeof(Node));
  node->data = data;
  node->next = stack->root;
  stack->root = node;
}

int stack_pop(Stack * stack) {
  Node * node = stack->root;
  stack->root = node->next;
  int data = node->data;
  free(node);
  return data;
}

int stack_peek(const Stack * stack) {
  return stack->root->data;
}

bool stack_is_empty(const Stack * stack) {
  return stack->root == NULL;
}

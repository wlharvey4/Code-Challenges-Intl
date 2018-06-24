/**
   challenges/cs101stacks/c/stacks.h
   ====================================================
   CREATED: 2018-06-23
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: See https://www.codewars.com/kata/computer-science-101-number-1-stacks

          A stack is  a last in, first  out (LIFO) data
          type  that  supports  at  least  these  three
          operations:

	  1. Push - Adds an item to the top of the stack

	  2. Pop - Removes an  item from the top of the
	  stack. Most  implementations return  the item
	  that  was popped  but those  that don't  must
	  implement   another  operation   "peek"  that
	  simply returns the top item of the stack.

	  3.  Is  empty  -  Is the  stack  empty?  This
	  operation  is crucial  in  ensuring that  the
	  user of the stack doesn't accidentally pop or
	  peek at  an empty  stack (which  doesn't make
	  sense).

	  =============================================
	  Implement the following key operations of the
	  stack.   All  four  of these  key  operations
	  should operate  in O(1)  time. There  will be
	  performance  tests  in  the Submit  tests  to
	  ensure this.   You may  assume that  the peek
	  and pop operations will never be called on an
	  empty stack  provided that you  implement all
	  operations correctly.
	  =============================================

	  void stack_push(Stack *stack, int data) -
	  ---------------------------------------------
	  Pushes the  data onto  the top of  the stack,
	  allocating memory to the stack if necessary.

	  int stack_pop(Stack *stack) -
	  ---------------------------------------------
	  Pops the  top item  of the stack  and returns
	  it.  It  should   also  ideally  free  memory
	  previously allocated to the stack if possible
	  to avoid  memory leaks - the  tests will test
	  for very large  stacks so you may  run out of
	  memory if you forget to do so.

	  int stack_peek(const Stack *stack) -
	  ---------------------------------------------	  
	  Returns  the  top  item of  the  stack.  This
	  operation should not modify the stack.

	  bool stack_is_empty(const Stack *stack) -
	  ---------------------------------------------
	  Checks  whether  the  stack  is  empty.  This
	  operation should not modify the stack.
	  ---------------------------------------------
 */

# ifndef CS101STACKS
# define CS101STACKS

# include <stdlib.h>
# include <stdbool.h>

typedef struct node {
  int data;
  struct node *next;
} Node;

typedef struct {
  Node *root;
} Stack;

void stack_push(Stack * stack, int data);

int stack_pop(Stack * stack);

int stack_peek(const Stack * stack);

bool stack_is_empty(const Stack * stack);

# endif

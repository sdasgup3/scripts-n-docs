#include<stdlib.h>
#include<stdio.h>

typedef struct linked_list sll;
struct linked_list
{
int data;
sll *next;
};

sll* mknode(int val)
{
sll* p = (sll*)malloc(sizeof(struct linked_list));
if (NULL != p) {
p->data = val;
p->next = NULL;
} 
return p;
}

int sll_insert_at_beginning(sll** dhead, int val)
{
sll* temp;
if (NULL == dhead || NULL == *dhead) {
printf("\n Invalid dhead");
return -1;
} 
temp = mknode(val);
if (temp != NULL) {
temp->next = *dhead;
*dhead = temp; 
} 
return 0;
}

int sll_insert_at_end(sll**head, int val)
{
sll* trav,*temp;
if (NULL == head) {
printf("\nInvalid dhead");
return -1;
}
temp = mknode(val);
trav = *head;
while (trav->next != NULL) {
trav = trav->next;
}
trav->next = temp;
}

int sll_insert_sorted(sll** head, int val)
{
sll* trav,*temp;

if (NULL == head || NULL == *head) {
printf("\nInvalid dhead");
return -1;
}
temp = mknode(val);
if ((*head)->data > val) {
temp->next = (*head);
(*head) = temp;
return 0;
}
trav = *head;
while (trav->next != NULL) {
if (trav->next->data > val) {
temp->next = trav->next;
trav->next = temp;
return 0;
}
trav = trav->next;
}
trav->next = temp;
}

int sll_delete(sll** dhead, int val)
{
sll* trav,*temp;
if (NULL == dhead) {
printf("\nInvalid dhead");
return -1;
}

if ((*dhead)->data == val) {
temp = *dhead;
*dhead = (*dhead)->next;
free(temp);
return 0;
}
trav = *dhead;

while(trav->next != NULL && trav->next->data != val) {
trav = trav->next;
}

if (trav->next == NULL) {
printf("\nval %d not found",val);
return -1;
}

if (trav->next->data == val) {
temp = trav->next;
trav->next = trav->next->next;
free(temp);
}
return 0;
}

void sll_reverse(sll** phead)
{
sll *p = (*phead);
sll *q = NULL;
sll *r = NULL;

while (p) {
q = p->next;
p->next = r;
r = p;
p = q;
}
*phead = r;
}

main()
{
sll* head;
head = mknode(10);
sll_insert_sorted(&head,20);
sll_insert_sorted(&head,30);
sll_insert_sorted(&head,40);
sll_insert_sorted(&head,50);
sll_insert_sorted(&head,15);
sll_insert_sorted(&head,5);
sll_reverse(&head);
}


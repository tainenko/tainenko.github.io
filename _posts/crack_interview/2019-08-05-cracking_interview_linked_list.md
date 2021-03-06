---
layout: post
title:  "Cracking the coding interview - Linked list"
author: tony
categories: [interview,linked list]
image: assets/images/linked-list.png
tags: [interview,linked list]
---
## Introduction
## Questions
1. **Remove Dups**:Write code to remove duplicates from an unsorted linked list.  
    FOLLOW UP  
    How would you solve this problem if a temporary buffer is not allowed?
2. **Return Kth to Last**:Implement an algorithm to find the kth to last element of a singly linked list.
3. **Delete Middle Node**:Implement an algorithm to delete a node in the middle(i.e., any node but the first and last node, not necessarily the exact middle) of a singly linked list, given only access to that node.  
    EXAMPLE  
    Input: the node c from the linked list a->b->c->d->e->f  
    Result: nothing is returned, but the new linked list looks like a->b->d->e->f  
4. **Partition**: Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x. If x is contained within the list, the values of x only need to be after the elements less than x (see below). the partition element x can appear anywhere in the "right partition"; it does not need to appear between the left and right partitions.  
    EXAMPLE  
    Input:3->5->8->5->10->2->1[partition=5]  
    Output:3->1->2->10->5->5->8  
5. **Sum Lists**: You have two numbers represented by a linked list, where each node contains a single digit. The digits are stored in *reverse* order, such that the 1's digit is at the head of the list. Write a function that adds the two numbers and returns the sum as a linked list.  
    EXAMPLE  
    Input: (7->1->6)+(5->9->2).That is, 617+295.  
    Output: 2->1->9.That is,912.  
    FOLLOW UP  
    Suppose the digits are stored in forward order.Repeat the above problem.  
    EXAMPLE  
    Input: (6->1->7)+(2->9->5). That is, 617+295.  
    Output: 9->1->2. That is, 912.
6. **Palindrome**:Implement a function to check if a linked list is a palindrome.
7. **Intersection**: Given two (singly) linked lists, determine if the two lists intersect. Return the intersecting node. Note that the intersection is defined based on reference, not value. That is , if the kth node of the first linked list is the exact same node (by reference) as the jth node of the second linked list, then they are intersecting.
8. **Loop Detection**:Given a circular linked list, implement an algorithm that returns the node at the beginning of the loop.  
    DEFINITION  
    Circular lin ked list: A (corrupt)linked list in which a node's next pointer points to an earlier node, so as to make a loop in the linked list.  
    EXAMPLE  
    Input A->B->C->D->E->C [the same C as earlier]  
    Output: C
## Hints
## Solution
Definition:   
```python
class LinkedNode:
    def __init__(self, val=None, next=None):
    self.val=val
    self.next=next
```
1.  **Remove Dups**
    ```python
        class Solution:
            def removeDups(self,head):
                if not head:
                    return head
                curr=head
                while curr:
                    while curr.val==curr.next.val:
                        curr.next=curr.next.next
                    curr=curr.next
                return head
    ```
2.  **Return Kth to Last** 
    ```python
        class Solution:
            def returnKth(self,head,k):
                fast = head
                for _ in range(k):
                    fast = fast.next
                slow = head
                while fast:
                    slow = slow.next
                    fast = fast.next
                return fast
    ```
4. **Partition**
    ```python
    
    ```
5. **Sum Lists**
    ```python
    class Solution:
       def sumList(self,head1,head2):
           carry = 0
           curr1 = head1
           curr2 = head2
           while curr1 and curr2:
               curr1.val += carry + curr2.val
               carry = curr1//10
               curr1.val = curr1%10
           while curr1:
           while curr2:
           if carry:
           return head1

 
    ```
6. **Palindrome**
    ```python
    
    ```
7. **Intersection**
    ```python
    
    ```
8. **Loop Detection**
    ```python
    class Solution:
       def checkLoop(self,head):
           fast = head
           slow = head
           while fast and fast.next:
               if slow.val == fast:
                   return True
               fast = fast.next.next
               slow = slow.next
           return False 
    ```
#!/usr/bin/env python
# coding: utf-8

# In[ ]:


''' Ask user to Roll or Not? Basis the response, roll a dice or 
display appropriate message '''
import random
print("\nReady To Roll A Dice?\n")
q=1
while q!=0:
    q = int(input("Do you want to roll? Enter 1 for rolling and 0 for not: "))
    if(q==1):
        print("You have rolled",random.randint(1,6),"\n")
    else:
        print("\nThank you for playing!")
        break


# In[ ]:





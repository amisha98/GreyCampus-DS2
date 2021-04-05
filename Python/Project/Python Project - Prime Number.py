#!/usr/bin/env python
# coding: utf-8

# ## Question
# Create a program in Python, to check if a given number is prime.
# 
# 1. Add a function to take user input.
# 2. Also must have a function where the number is predetermined.
# 3. Use if...else
# 4. Use loops (Which one? Its your job to think)
# 5. If the number is prime or not should be printed as an output.
# 6. I need interpretation as comments at each chunk of code.
# 
# ## Solution
# 
# ### Scenerios
# The system is designed to handle 3 scenerios:
# 1. User wants to enter the number
# 2. User asks the system to generate a number between a specified range
# 3. User does not wish to enter a number and hence system should take the default value
# 
# #### Scenerio 1 : User wants to enter the number
# * System will call the function get_number_input() where it will ask the user to enter a number 
# * The number entered by the user is returned and passed onto the function check_prime() to check if it is prime or not
# 
# #### Scenerio 2 : User asks the system to generate a number between a specified range
# * System will call the function generate_number()
# * The user is asked to enter the start and end points of the range
# * Accordingly a random number is generated between that range and returned
# * This number is then passed onto the function check_prime() to check if it is prime or not
# 
# #### Scenerio 3 : User does not wish to enter a number and hence system should take the default value
# * If the user does not wish to enter the number then the default value kept in the check_prime() function is to be used. 
# * This default value is the predetermined value 
# 

# In[27]:


#To import a random number for scenerio 2
import random 


# In[ ]:


#Function to get number from the user for scenerio 1
def get_number_input():
    num = int(input("Enter a number to check: "))
    return num


# In[ ]:


#Function to geenrate a random number between a user specified range for scenerio 2
def generate_number():
    start = int(input("Enter start of range: "))
    end = int(input("Enter end of range: "))
    num = random.randint(start,end)
    return num


# In[ ]:


# Function to check if a number is prime or not
# Predetermined value used here is 37 for scenerio 3
def check_prime(num = 37):
    
    #Displaying the number being checked
    print("Number  = ",num)
    
    # We divide the number by 2 to determine the end range of the loop
    # This is done because the number will not be divisible by any number greater than 1/2 of itself
    # This helps in optimization as the number of times the loop runs is reduced
    # We add 1 to account for the loss happening because of the int() function which rounds off the result
    cnt = int(num/2) + 1  
    
    for i in range(2,cnt):
        if(num%i == 0):
            print("The number is not prime")
            break

    if(i==(cnt-1)):
        print("The number is prime")


# In[ ]:


question = "Enter your choice:\n1. I would like to enter my own number\n2. Generate a number for me to check\n3. Take the default value"

choice = int(input(question+"\nEnter choice as 1,2 or 3:\n"))

#Based on user choice, appropriate function should be called
if(choice == 1):  # Scenerio 1
    num = get_number_input()
    check_prime(num)
elif(choice ==2):  # Scenerio 2
    num = generate_number()
    check_prime(num)
else:  # Scenerio 3
    print("Default value will be used")
    check_prime() # Since no parameter is passed, the system should take the default value mentioned


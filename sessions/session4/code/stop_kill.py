import time
print("this program will end in 30 seconds")
for i in range (0, 30):
    time.sleep(1)
    print(f"the program will end in {30-i} seconds")
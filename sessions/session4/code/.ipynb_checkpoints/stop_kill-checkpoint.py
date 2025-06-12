import time
print("this program will end in 20 seconds)
for i in range (0, 20):
    time.sleep(1)
    print(f"the program will end in {20-i} seconds")
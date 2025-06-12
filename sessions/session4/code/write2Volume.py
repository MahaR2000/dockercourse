import time

# create a string that takes current hour,minutes, seconds and formats it and # prints it to the console
def print_current_time():
    current_time = time.strftime("%H:%M:%S")
    print(f"Current time: {current_time}")
    file = open("/app/data/log.txt", "w")
    file.write(f"{current_time}\n")
    file.close()
print_current_time()
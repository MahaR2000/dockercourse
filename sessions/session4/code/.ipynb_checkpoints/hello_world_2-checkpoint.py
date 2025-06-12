print("Hello world from the application running on fifth.dockerfile")

import os

env = os.environ['TITLE']
print(f"The value of environment variable TITLE is {env}")

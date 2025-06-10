import sys

args = sys.argv[1:]  # Exclude the script name
if args:
    print(f"Hello world {args[0]}")
import signal
import sys

def handle_signal(signum, frame):
    print(f"Received signal {signum}. Cleaning up...")
    # Perform cleanup tasks here
    sys.exit(0)

# Register signal handlers
signal.signal(signal.SIGTERM, handle_signal)  # Handle termination signal
signal.signal(signal.SIGINT, handle_signal)   # Handle interrupt signal (Ctrl+C)

print("Running... Press Ctrl+C to exit.")
while True:
    pass  # Simulate a long-running process

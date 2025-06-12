FROM seventhimage:latest

VOLUME /app/data
ENTRYPOINT ["python3", "readFromVolume.py"]
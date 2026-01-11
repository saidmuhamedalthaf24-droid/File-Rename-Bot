FROM python:3.11-slim-bookworm

# Install ffmpeg + cleanup
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (Render requirement)
EXPOSE 8080

# Start bot
CMD ["python3", "bot.py"]

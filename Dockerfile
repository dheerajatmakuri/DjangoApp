# Use the official Ubuntu image as a base
FROM ubuntu

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and the devops directory into the container
COPY requirements.txt /app
COPY devops /app

# Update the package list, install python3 and python3-pip, and install requirements
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install --break-system-packages -r requirements.txt

# Expose the application port
EXPOSE 8000

# Define the command to run the application
ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]

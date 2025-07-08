FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /workspace

# Install Jupyter
RUN pip install --no-cache-dir notebook

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files into the container
COPY . .

# Expose the Jupyter Notebook port
EXPOSE 8888

# Create the entrypoint script that will safely handle kaggle.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
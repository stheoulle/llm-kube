FROM python:3.9-slim

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copier requirements.txt dans l'image
WORKDIR /app
COPY requirements.txt .

# Installer les dépendances Python depuis requirements.txt
RUN pip install -r requirements.txt

# Copier tout le code de l'application
COPY . .

# Exposer le port (à adapter si nécessaire)
EXPOSE 5000

# Commande de lancement (à adapter)
CMD ["python", "app.py"]

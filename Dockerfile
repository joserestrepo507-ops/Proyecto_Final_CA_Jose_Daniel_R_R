
# Imagen base oficial de Python 3.12
FROM python:3.12-slim

# Directorio de trabajo
WORKDIR /app

# Copiar e instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar las carpetas necesarias
COPY app/ ./app/
COPY frontend/ ./frontend/
COPY models/ ./models/

# Exponer el puerto 8000
EXPOSE 8000

# Iniciar el servidor
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

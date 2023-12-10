#!/bin/bash

echo "Setting up Environment Variables.."
cat <<EOF > .env
DEBUG=1
SECRET_KEY=thisisademosecretkey
DJANGO_ALLOWED_HOSTS=localhost 54.206.46.12 [::1] localhost:8000 54.206.46.12:8000 [::1]:8000
DB_ENGINE=django.db.backends.postgresql
DB_USER=dev
DB_PASSWORD=dev
DB_HOST=db
DB_NAME=dev
DB_PORT=5432
OPENAI_API_KEY=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
EOF

echo "Installing Django and Docker Compose.."
sudo apt-get install -y python3-pip
pip3 install --user Django
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

cd /home/ubuntu/django-chatgpt

echo "Building and Starting Docker Containers.."
sudo docker-compose up -d --build 

echo "Deployment Completed Successfully!"


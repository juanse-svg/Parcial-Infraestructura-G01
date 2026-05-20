#!/bin/bash
yum update -y
yum install -y python3 python3-pip git

cd /home/ec2-user
git clone https://github.com/juanse-svg/Parcial-Infraestructura-G01.git
cd Parcial-Infraestructura-G01

pip3 install -r app/requirements.txt

cat > /etc/systemd/system/flask-app.service <<EOF
[Unit]
Description=Flask App
After=network.target

[Service]
User=ec2-user
WorkingDirectory=/home/ec2-user/Parcial-Infraestructura-G01
ExecStart=/usr/bin/python3 app/main.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable flask-app
systemctl start flask-app
sudo apt update
sudo apt install python3 python3-pip -y
pip3 install -r requirements.txt

sudo cp flask-app.service /etc/systemd/system
sudo systemctl daemon reload
sudo systemctl start flask-app.service
sudo systemctl enable flask-app.service
sudo systemctl status flask-app.service
echo "You are now set to go, Flask service is running systemd service as well!"
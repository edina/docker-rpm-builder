echo 'export M2_HOME=/opt/maven-%{version}' > /etc/profile.d/mvn.sh
chmod 755 /etc/profile.d/mvn.sh

ln -sf /opt/maven-%{version}/bin/mvn /usr/bin/mvn


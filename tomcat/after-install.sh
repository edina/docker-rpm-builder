systemctl daemon-reload

chown -R tomcat:tomcat /opt/tomcat/
chmod o+r /opt/tomcat/conf/*
chmod 644 /opt/tomcat/bin/*
chmod 755 /opt/tomcat/bin/*.sh
chmod 755 /opt/tomcat/lib/*

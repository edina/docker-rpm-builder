systemctl daemon-reload

chown -R tomcat:tomcat /opt/tomcat/
chmod o+r /opt/tomcat/conf/*
chmod o+r /opt/tomcat/bin/*
chmod 755 /opt/tomcat/lib/*

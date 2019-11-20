systemctl daemon-reload

chown -R tomcat:tomcat /opt/tomcat/
chmod o+r /opt/tomcat/conf/*
chmod -R 755 /opt/tomcat/conf/Catalina
chmod o+r /opt/tomcat/bin/*


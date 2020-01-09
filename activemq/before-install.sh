%{_sbindir}/groupadd -r activemq 2>/dev/null || :
%{_sbindir}/useradd -c "Apache Tomcat" -g tomcat \
    -s /bin/sh -r -d %{_datadir}/%{name} tomcat 2>/dev/null || :

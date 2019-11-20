%{_sbindir}/groupadd -g 91 -r tomcat 2>/dev/null || :
%{_sbindir}/useradd -c "Apache Tomcat" -u 91 -g tomcat \
    -s /bin/sh -r -d %{_datadir}/%{name} tomcat 2>/dev/null || :

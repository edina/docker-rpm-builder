Name:           prometheus-node-exporter 
Version:        1.9.1
Release:        1.edina%{?dist}
Summary:        Exporter for machine metrics
ExclusiveArch:  x86_64


Obsoletes:      golang-github-prometheus-node-exporter-devel < 1.6.1-2
Obsoletes:      golang-github-prometheus-node-exporter < 1.6.1-2
Obsoletes:      golang-github-prometheus-node_exporter < 1.6.1-2
Provides:       node_exporter


License:        Apache-2.0
URL:            https://github.com/prometheus/node_exporter
Source0:        %{name}-%{version}.tar.gz
Source1:        %{name}.sysusers
Source2:        %{name}.service
Source3:        %{name}.conf
Source4:        %{name}-tmpfiles.conf

%description
Prometheus exporter for hardware and OS metrics exposed by *NIX kernels, written
in Go with pluggable metric collectors

%prep
%setup -q -n node_exporter-%{version}.linux-amd64

%install
rm -rf $RPM_BUILD_ROOT
install -m 0755 -vd               %{buildroot}%{_bindir}
install -m 0755 -vp node_exporter %{buildroot}%{_bindir}/

install -Dpm0644 %{S:1} %{buildroot}%{_sysusersdir}/%{name}.conf
install -Dpm0644 %{S:2} %{buildroot}%{_unitdir}/%{name}.service
pushd %{buildroot}%{_unitdir}
ln -s %{name}.service node_exporter.service
popd
install -Dpm0644 %{S:3} %{buildroot}%{_sysconfdir}/sysconfig/node_exporter
mkdir -p %{buildroot}%{_tmpfilesdir}
install -m 0644 %{S:4} %{buildroot}%{_tmpfilesdir}/%{name}.conf
mkdir -vp %{buildroot}%{_sharedstatedir}/node_exporter/node-exporter
%pre
%sysusers_create_compat %{S:1}

%post
%systemd_post node_exporter.service

%preun
%systemd_preun node_exporter.service

%postun
%systemd_postun_with_restart node_exporter.service

%files
%license LICENSE NOTICE
%{_bindir}/node_exporter
%config(noreplace) %{_sysconfdir}/sysconfig/node_exporter
%{_unitdir}/%{name}.service
%{_unitdir}/node_exporter.service
%{_sysusersdir}/%{name}.conf
%dir %attr(0755,prometheus,prometheus) %{_sharedstatedir}/node_exporter
%{_tmpfilesdir}/%{name}.conf

%changelog
* Tue Aug 05 2025 Nikolaos Dandoulakis <nick.dan@ed.ac.uk> - 1.9.1-1.edina.el9
- Packaged for EL9 using binary from GitHub community release. 
- 

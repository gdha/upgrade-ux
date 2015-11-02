%define rpmrelease .git201312020913
%define optdir /opt
%define etcopt /etc/opt
%define varopt /var/opt
%define mandir /usr/share/man

### Work-around the fact that OpenSUSE/SLES _always_ defined both :-/
%if 0%{?sles_version} == 0
%undefine sles_version
%endif

Name:		upgrade-ux
Version:	1.2 
Release:	1%{?rpmrelease}%{?dist}
Summary:	Open Source framework to patch, update or upgrade UNIX systems

Group:		Applications/File
License:	GPLv3
URL:		http://www.it3.be/projects/upgrade-ux.html
Source:		%{name}-%{version}.tar.gz
BuildRoot:	%(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
BuildArch:	noarch

#BuildRequires:	
Requires:	ksh

%description
Upgrade-UX is an open source framework developed to assist in patching and/or
updating Unix Operating Systems in a consistent and repeatable way

%prep
%setup -q -n %{name}-%{version}


%build


%install
%{__rm} -rf %{buildroot}
%{__make} -C packaging/Linux install DESTDIR="%{buildroot}"
%{__mkdir} -m 755 -p %{buildroot}/%{mandir}/man8
%{__cp} %{buildroot}/%{optdir}/%{name}/man/man8/%{name}.8  %{buildroot}/%{mandir}/man8/%{name}.8
gzip  %{buildroot}/%{mandir}/man8/%{name}.8

%clean
%{__rm} -rf %{buildroot}


%files
%defattr(-, root, root, 0755)
%doc  LICENSE README.md
%doc %{mandir}/man8/%{name}-ux.8*
%doc %{optdir}/%{name}/man/man8/%{name}.8*
%{optdir}/%{name}bin/
%{optdir}/%{name}/lib/
%{optdir}/%{name}/scripts/
%{varopt}/%{name}/
%config(noreplace) %{etcopt}/%{name}/

%changelog
* Wed Dec  31 2014 Gratien D'haese <gratien.dhaese@gmail.com> - 1.2
  initial spec file for upgrade-ux

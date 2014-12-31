%define rpmrelease .git201312020913
%define optdir /opt
%define etcopt /etc/opt
%define varopt /var/opt

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
Source:		upgrade-ux-1.2.tar.gz
BuildRoot:	%(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
BuildArch:	noarch

#BuildRequires:	
Requires:	ksh

%description
Upgrade-UX is an open source framework developed to assist in patching and/or updating Unix Operating Systems in a consistent and repeatable way

%prep
%setup -q -n upgrade-ux-1.2


%build


%install
%{__rm} -rf %{buildroot}
%{__make} -C linux install DESTDIR="%{buildroot}"

%clean
%{__rm} -rf %{buildroot}


%files
%defattr(-, root, root, 0755)
%doc  ../../../LICENSE ../../../README.md
%doc %{_mandir}/man8/upgrade-ux.8*
%{optdir}/upgrade-ux/bin/
%{optdir}/upgrade-ux/lib/
%{optdir}/upgrade-ux/scripts/
%{varopt}/upgrade-ux/
%config(noreplace) %{etcopt}/upgrade-ux/

%changelog
* Wed Dec  31 2014 Gratien D'haese <gratien.dhaese@gmail.com>
  initial spec file for upgrade-ux

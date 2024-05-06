FROM rockylinux/rockylinux:9

RUN dnf install -y rpmdevtools rpmlint git \
    && mkdir /rpmbuild \
    && dnf clean cache 

WORKDIR /rpmbuild

ENTRYPOINT ["bash"]

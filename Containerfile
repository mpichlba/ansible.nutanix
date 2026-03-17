FROM fedora:latest
RUN yum -y install python3-pip
RUN yum -y install ansible
RUN yum -y install wget git
RUN pip3 install --upgrade pip setuptools
RUN git clone https://github.com/nutanix/nutanix.ansible.git ; cd nutanix.ansible; git checkout v2.4.0 -b v2.4.0
RUN cd nutanix.ansible; ansible-galaxy collection build
RUN cd nutanix.ansible; ansible-galaxy collection install nutanix.ncp





FROM centos:6
MAINTAINER "Valeriu" <valeriu@vasciuc.com>
ENV container docker

RUN yum install -y epel-release
RUN yum install -y ansible
ADD apache_inst_conf.yml apache_inst_conf.yml
RUN hostname --ip-address
RUN ansible-playbook apache_inst_conf.yml  -c local --extra-vars="hosts=localhost" --extra-vars="sudo=false" --extra-vars="sudo_cmd="

FROM jenkinsci/slave

USER root

ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.12.6
ENV DOCKER_OPTS "-H tcp://0.0.0.0:2376 -H unix:///var/run/docker.sock"

RUN set -x \
	&& curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz
	
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
		&& chmod +x ./kubectl \
		&& mv ./kubectl /usr/local/bin/kubectl

RUN mkdir /home/jenkins/.kube
COPY k8s/ca.crt /home/jenkins/.kube
COPY k8s/devops.key /home/jenkins/.kube
COPY k8s/devops.crt /home/jenkins/.kube

RUN kubectl config set-cluster minikube --server=https://192.168.99.100:8443 --certificate-authority=/home/jenkins/.kube/ca.crt
RUN kubectl config set-context devops-context --cluster=minikube --user=devops --namespace=development
RUN kubectl config set current-context devops-context
RUN kubectl config set-credentials devops --client-certificate=/home/jenkins/.kube/devops.crt --client-key=/home/jenkins/.kube/devops.key

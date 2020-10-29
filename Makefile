up: init secret-docker run-socks-shop install-tools

init:
	cd k8s-sandbox && make up && make install-cicd && make install-ingress

secret-docker:
	docker login -u amerahsultan1
	kubectl create secret generic regcred \
 	--from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
 	--type=kubernetes.io/dockerconfigjson -n test

run-socks-shop:
	cd tekton && make run

install-tools:
	cd k8s-sandbox && make install-prm-graf && install-elf

list-tasktun:
	tkn tr ls -n test

list-pipelinerun:
	tkn pr ls -n test

prod-pods:
	kubectl get pods -n prod

down-socks-shop:
	cd k8s-sandbox && make down && make delete-cicd && make delete-ingress && cd ..
	cd tekton && make down && cd ..

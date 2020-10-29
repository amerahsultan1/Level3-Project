up: init secret-docker deploy-socks-shop pods-status run-js-test install-tools

init:
	cd k8s-sandbox && make up && make install-cicd && make install-ingress

install-tools: 
	cd k8s-sandbox && make install-prm-graf && install-elf


secret-docker: 		
	docker login -u amerahsultan1
	kubectl create secret generic regcred \
 	--from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
 	--type=kubernetes.io/dockerconfigjson -n test


deploy-socks-shop: 
		
	kubectl create -f ./tekton/role.yaml -n test
	kubectl create -f ./tekton/role-binding.yaml -n test
	kubectl create -f ./tekton/sa-front-end.yaml -n test
	kubectl create -f ./tekton/PipelineResource/PipelineResource-front-end.yaml -n test	
	kubectl create -f ./tekton/PipelineResource/PipelineResource-catalogue.yaml -n test	
	kubectl create -f ./tekton/PipelineResource/PipelineResource-queue-master.yaml -n test
	kubectl create -f ./tekton/PipelineResource/PipelineResource-orders.yaml -n test
	kubectl create -f ./tekton/PipelineResource/PipelineResource-shipping.yaml -n test
	kubectl create -f ./tekton/PipelineResource/PipelineResource-user.yaml -n test
	kubectl create -f ./tekton/PipelineResource/PipelineResource-payment.yaml -n test
	kubectl create -f ./tekton/PipelineResource/PipelineResource-carts.yaml -n test	
	kubectl create -f ./tekton/PipelineResource/PipelineResource-load-test.yaml -n test
	kubectl create -f ./tekton/PipelineResource/PipelineResource-e2e-js-test.yaml -n  test
	kubectl create -f ./tekton/tasks/build-push-task.yaml -n test
	kubectl create -f ./tekton/tasks/deploy-task.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-front-end.yaml -n test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-front-end.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-catalogue.yaml -n test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-catalogue.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-queue-master.yaml -n test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-queue-master.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-rabbitmq.yaml -n test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-rabbitmq.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-orders.yaml -n test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-orders.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-shipping.yaml -n test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-shipping.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-user.yaml -n test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-user.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-payment.yaml -n test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-payment.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-carts.yaml -n test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-carts.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-load-test.yaml -n test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-load-test.yaml -n test

run-js-test:
	kubectl create -f ./tekton/tasks/run-e2e.yaml -n test
	kubectl apply -f ./tekton/tasks/deploy-prod-task.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-e2e-js-test.yaml -n  test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-e2e-js-test.yaml -n  test
	

pods-status: 
	cd tekton && ./check.sh


deploy-sockshop:
	kubectl apply -f ./deployment/front-end/front-end-dep.yaml -n test
	kubectl apply -f ./deployment/carts/carts-db-dep.yaml -n test
	kubectl apply -f ./deployment/carts/carts-db-svc.yaml -n test
	kubectl apply -f ./deployment/carts/carts-dep.yaml -n test
	kubectl apply -f ./deployment/carts/carts-svc.yml -n test
	kubectl apply -f ./deployment/catalogue/catalogue-db-dep.yaml -n test
	kubectl apply -f ./deployment/catalogue/catalogue-db-svc.yaml -n test
	kubectl apply -f ./deployment/catalogue/catalogue-dep.yaml -n test
	kubectl apply -f ./deployment/catalogue/catalogue-svc.yaml -n test
	kubectl apply -f ./deployment/orders/orders-db-dep.yaml -n test
	kubectl apply -f ./deployment/orders/orders-db-svc.yaml -n test
	kubectl apply -f ./deployment/orders/orders-dep.yaml -n test
	kubectl apply -f ./deployment/orders/orders-svc.yaml -n test
	kubectl apply -f ./deployment/payment/payment-dep.yaml -n test
	kubectl apply -f ./deployment/payment/payment-svc.yaml -n test
	kubectl apply -f ./deployment/shipping/shipping-dep.yaml -n test
	kubectl apply -f ./deployment/shipping/shipping-svc.yaml -n test
	kubectl apply -f ./deployment/user/user-db-dep.yaml -n test
	kubectl apply -f ./deployment/user/user-db-svc.yaml -n test
	kubectl apply -f ./deployment/user/user-dep.yaml -n test
	kubectl apply -f ./deployment/user/user-svc.yaml -n test
	kubectl apply -f ./deployment/load-test/loadtest-dep.yaml -n test	
	
 




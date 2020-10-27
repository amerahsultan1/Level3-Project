up: init secret-docker deploy-socks-shop pods-status e2e-js-test

init:
	git clone https://github.com/amerahsultan1/k8s-sandbox.git
	cd k8s-sandbox && make up && make install-cicd && make install-ingress


secret-docker: 		
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

e2e-js-test:
	kubectl create -f ./tekton/tasks/run-e2e.yaml -n test
	kubectl create -f ./tekton/pipeline/pipeline-e2e-js-test.yaml -n  test
	kubectl create -f ./tekton/pipelinerun/PipelineRun-e2e-js-test.yaml -n  test
	kubectl create -f ./tekton/tasks/deploy-prod-task.yaml -n test

pods-status: 
	kubectl wait --namespace test --for=condition=ready pods -l name=rabbitmq --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=front-end --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=user-db --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=user --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=shipping --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=payment --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=orders-db --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=orders --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=catalogue-db --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=catalogue --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=carts-db --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=carts --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=queue-master --timeout=900s
	kubectl wait --namespace test --for=condition=ready pods -l name=load-test --timeout=900s


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
	
 




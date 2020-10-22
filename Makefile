init:
	git clone https://github.com/amerahsultan1/k8s-sandbox.git
	cd k8s-sandbox && make up && make install-cicd && make install-ingress


secret-docker: 		
	kubectl create secret generic regcred \
 	--from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
 	--type=kubernetes.io/dockerconfigjson -n test


push-images: 
		
	kubectl create -f ./tekton/sa-front-end.yaml -n test
	kubectl create -f ./tekton/front-end/PipelineResource-front-end.yaml -n test
	kubectl create -f ./tekton/front-end/task-front-end.yaml -n test
	kubectl create -f ./tekton/front-end/TaskRun-front-end.yaml -n test
	kubectl create -f ./tekton/catalogue/PipelineResource-catalogue.yaml -n test
	kubectl create -f ./tekton/catalogue/task-catalogue.yaml -n test
	kubectl create -f ./tekton/catalogue/TaskRun-catalogue.yaml -n test
	kubectl create -f ./tekton/catalogue/task-catalogue-db.yaml -n test
	kubectl create -f ./tekton/catalogue/TaskRun-catalogue-db.yaml -n test
	kubectl create -f ./tekton/edge-router/PipelineResource-edge-router.yaml -n test
	kubectl create -f ./tekton/edge-router/task-edge-router.yaml -n test
	kubectl create -f ./tekton/edge-router/TaskRun-edge-router.yaml -n test
	kubectl create -f ./tekton/load-test/PipelineResource-load-test.yaml -n test
	kubectl create -f ./tekton/load-test/task-load-test.yaml -n test
	kubectl create -f ./tekton/load-test/TaskRun-load-test.yaml -n test
	kubectl create -f ./tekton/orders/PipelineResource-orders.yaml -n test
	kubectl create -f ./tekton/orders/task-orders.yaml -n test
	kubectl create -f ./tekton/orders/TaskRun-orders.yaml -n test
	kubectl create -f ./tekton/payment/PipelineResource-payment.yaml -n test
	kubectl create -f ./tekton/payment/task-payment.yaml -n test
	kubectl create -f ./tekton/payment/TaskRun-payment.yaml -n test
	kubectl create -f ./tekton/shipping/PipelineResource-shipping.yaml -n test
	kubectl create -f ./tekton/shipping/task-shipping.yaml -n test
	kubectl create -f ./tekton/shipping/TaskRun-shipping.yaml -n test
	kubectl create -f ./tekton/user/PipelineResource-user.yaml -n test
	kubectl create -f ./tekton/user/task-user.yaml -n test
	kubectl create -f ./tekton/user/TaskRun-user.yaml -n test
	kubectl create -f ./tekton/user/task-user-db.yaml -n test
	kubectl create -f ./tekton/user/TaskRun-user-db.yaml -n test
	kubectl create -f ./tekton/queue-master/PipelineResource-queue-master.yaml -n test
	kubectl create -f ./tekton/queue-master/task-queue-master.yaml -n test
	kubectl create -f ./tekton/queue-master/TaskRun-queue-master.yaml -n test
	kubectl create -f ./tekton/e2e-tests/PipelineResource-e2e-tests.yaml -n test
	kubectl create -f ./tekton/e2e-tests/task-e2e-tests.yaml -n test
	kubectl create -f ./tekton/e2e-tests/TaskRun-e2e-tests.yaml -n test
	kubectl create -f ./tekton/carts/PipelineResource-carts.yaml -n test
	kubectl create -f ./tekton/carts/task-carts.yaml -n test
	kubectl create -f ./tekton/carts/TaskRun-carts.yaml -n test

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
	
 




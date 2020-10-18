init:
	git clone https://github.com/amerahsultan1/k8s-sandbox.git
	cd k8s-sandbox && make up && make install-cicd && make install-ingress

push-images: 
		
	kubectl create -f ./catalogue/tkn-docker/sa-catalogue.yaml -n test
	kubectl create -f ./catalogue/tkn-docker/PipelineResource-catalogue.yaml -n test
	kubectl create -f ./catalogue/tkn-docker/task-catalogue.yaml -n test
	kubectl create -f ./catalogue/tkn-docker/TaskRun-catalogue.yaml -n test
	kubectl create -f ./edge-router/tkn-docker/sa-edge-router.yaml -n test
	kubectl create -f ./edge-router/tkn-docker/PipelineResource-edge-router.yaml -n test
	kubectl create -f ./edge-router/tkn-docker/task-edge-router.yaml -n test
	kubectl create -f ./edge-router/tkn-docker/TaskRun-edge-router.yaml -n test
	kubectl create -f ./front-end/tkn-docker/sa-front-end.yaml -n test
	kubectl create -f ./front-end/tkn-docker/PipelineResource-front-end.yaml -n test
	kubectl create -f ./front-end/tkn-docker/task-front-end.yaml -n test
	kubectl create -f ./front-end/tkn-docker/TaskRun-front-end.yaml -n test
	kubectl create -f ./load-test/tkn-docker/sa-load-test.yaml -n test
	kubectl create -f ./load-test/tkn-docker/PipelineResource-load-test.yaml -n test
	kubectl create -f ./load-test/tkn-docker/task-load-test.yaml -n test
	kubectl create -f ./load-test/tkn-docker/TaskRun-load-test.yaml -n test
	kubectl create -f ./orders/tkn-docker/sa-orders.yaml -n test
	kubectl create -f ./orders/tkn-docker/PipelineResource-orders.yaml -n test
	kubectl create -f ./orders/tkn-docker/task-orders.yaml -n test
	kubectl create -f ./orders/tkn-docker/TaskRun-orders.yaml -n test
	kubectl create -f ./payment/tkn-docker/sa-payment.yaml -n test
	kubectl create -f ./payment/tkn-docker/PipelineResource-payment.yaml -n test
	kubectl create -f ./payment/tkn-docker/task-payment.yaml -n test
	kubectl create -f ./payment/tkn-docker/TaskRun-payment.yaml -n test
	kubectl create -f ./shipping/tkn-docker/sa-shipping.yaml -n test
	kubectl create -f ./shipping/tkn-docker/PipelineResource-shipping.yaml -n test
	kubectl create -f ./shipping/tkn-docker/task-shipping.yaml -n test
	kubectl create -f ./shipping/tkn-docker/TaskRun-shipping.yaml -n test
	kubectl create -f ./user/tkn-docker/sa-user.yaml -n test 
	kubectl create -f ./user/tkn-docker/PipelineResource-user.yaml -n test
	kubectl create -f ./user/tkn-docker/task-user.yaml -n test
	kubectl create -f ./user/tkn-docker/TaskRun-user.yaml -n test
	kubectl create -f ./queue-master/tkn-docker/sa-queue-master.yaml -n test
	kubectl create -f ./queue-master/tkn-docker/PipelineResource-queue-master.yaml -n test
	kubectl create -f ./queue-master/tkn-docker/task-queue-master.yaml -n test
	kubectl create -f ./queue-master/tkn-docker/TaskRun-queue-master.yaml -n test
	kubectl create -f ./e2e-tests/tkn-docker/sa-e2e-tests.yaml -n test
	kubectl create -f ./e2e-tests/tkn-docker/PipelineResource-e2e-tests.yaml -n test
	kubectl create -f ./e2e-tests/tkn-docker/task-e2e-tests.yaml -n test
	kubectl create -f ./e2e-tests/tkn-docker/TaskRun-e2e-tests.yaml -n test
	kubectl create -f ./carts/tkn-docker/sa-carts.yaml -n test
	kubectl create -f ./carts/tkn-docker/PipelineResource-carts.yaml -n test
	kubectl create -f ./carts/tkn-docker/task-carts.yaml -n test
	kubectl create -f ./carts/tkn-docker/TaskRun-carts.yaml -n test

deploy: 
	kubectl apply -f ./front-end/deploy-files/ingress.yaml -n test
 




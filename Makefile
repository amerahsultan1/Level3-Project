init:
	git clone https://github.com/amerahsultan1/k8s-sandbox.git
	cd k8s-sandbox && make up && make install-cicd

up: catalogue edge-router front-end load-test orders payment shipping user queue-master e2e-tests carts 	


catalogue:
	 kubectl create -f ./catalogue/tkn-docker/sa-catalogue.yaml -n test -f ./catalogue/tkn-docker/PipelineResource-catalogue.yaml -n test -f ./catalogue/tkn-docker/task-catalogue.yaml -n test -f ./catalogue/tkn-docker/TaskRun-catalogue.yaml -n test

edge-router:
	kubectl create -f ./edge-router/tkn-docker/sa-edge-router.yaml -n test -f ./edge-router/tkn-docker/PipelineResource-edge-router.yaml -n test -f ./edge-router/tkn-docker/task-edge-router.yaml -n test -f ./edge-router/tkn-docker/TaskRun-edge-router.yaml -n test

front-end: 
	kubectl create -f ./front-end/tkn-docker/sa-front-end.yaml -n test -f ./front-end/tkn-docker/PipelineResource-front-end.yaml -n test -f ./front-end/tkn-docker/task-front-end.yaml -n test -f ./front-end/tkn-docker/TaskRun-front-end.yaml -n test

load-test:
	kubectl create -f ./load-test/tkn-docker/sa-load-test.yaml -n test -f ./load-test/tkn-docker/PipelineResource-load-test.yaml -n test -f ./load-test/tkn-docker/task-load-test.yaml -n test -f ./load-test/tkn-docker/TaskRun-load-test.yaml -n test

orders:
	kubectl create -f ./orders/tkn-docker/sa-orders.yaml -n test -f ./orders/tkn-docker/PipelineResource-orders.yaml -n test -f ./orders/tkn-docker/task-orders.yaml -n test -f ./orders/tkn-docker/TaskRun-orders.yaml -n test

payment:    
	kubectl create -f ./payment/tkn-docker/sa-payment.yaml -n test -f ./payment/tkn-docker/PipelineResource-payment.yaml -n test -f ./payment/tkn-docker/task-payment.yaml -n test -f ./payment/tkn-docker/TaskRun-payment.yaml -n test

shipping:   
	kubectl create -f ./shipping/tkn-docker/sa-shipping.yaml -n test -f ./shipping/tkn-docker/PipelineResource-shipping.yaml -n test -f ./shipping/tkn-docker/task-shipping.yaml -n test -f ./shipping/tkn-docker/TaskRun-shipping.yaml -n test

user:       
	kubectl create -f ./user/tkn-docker/sa-user.yaml -n test ./user/tkn-docker/PipelineResource-user.yaml -n test -f ./user/tkn-docker/task-user.yaml -n test -f user/tkn-docker/TaskRun-user.yaml -n test

queue-master:  
	kubectl create -f ./queue-master/tkn-docker/sa-queue-master.yaml -n test -f ./queue-master/tkn-docker/PipelineResource-queue-master.yaml -n test -f ./queue-master/tkn-docker/task-queue-master.yaml -n test -f ./queue-master/tkn-docker/TaskRun-queue-master.yaml -n test

e2e-tests:     
	kubectl create -f ./e2e-tests/tkn-docker/sa-e2e-tests.yaml -n test -f ./e2e-tests/tkn-docker/PipelineResource-e2e-tests.yaml -n test -f ./e2e-tests/tkn-docker/task-e2e-tests.yaml -n test -f ./e2e-tests/tkn-docker/TaskRun-e2e-tests.yaml -n test

carts:        
	kubectl create -f ./carts/tkn-docker/sa-carts.yaml -n test -f ./carts/tkn-docker/PipelineResource-carts.yaml -n test -f ./carts/tkn-docker/task-carts.yaml -n test -f ./carts/tkn-docker/TaskRun-carts.yaml -n test






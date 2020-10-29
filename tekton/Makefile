run: deploy-microservices pods-status run-js-test  

deploy-microservices: 
		
	kubectl create -f ./role.yaml -n test
	kubectl create -f ./role-binding.yaml -n test
	kubectl create -f ./sa-front-end.yaml -n test
	kubectl create -f ./PipelineResource/PipelineResource-front-end.yaml -n test	
	kubectl create -f ./PipelineResource/PipelineResource-catalogue.yaml -n test	
	kubectl create -f ./PipelineResource/PipelineResource-queue-master.yaml -n test
	kubectl create -f ./PipelineResource/PipelineResource-orders.yaml -n test
	kubectl create -f ./PipelineResource/PipelineResource-shipping.yaml -n test
	kubectl create -f ./PipelineResource/PipelineResource-user.yaml -n test
	kubectl create -f ./PipelineResource/PipelineResource-payment.yaml -n test
	kubectl create -f ./PipelineResource/PipelineResource-carts.yaml -n test	
	kubectl create -f ./PipelineResource/PipelineResource-load-test.yaml -n test
	kubectl create -f ./PipelineResource/PipelineResource-e2e-js-test.yaml -n  test
	kubectl create -f ./tasks/build-push-task.yaml -n test
	kubectl create -f ./tasks/deploy-task.yaml -n test
	kubectl create -f ./pipeline/pipeline-front-end.yaml -n test
	kubectl create -f ./pipelinerun/PipelineRun-front-end.yaml -n test
	kubectl create -f ./pipeline/pipeline-catalogue.yaml -n test
	kubectl create -f ./pipelinerun/PipelineRun-catalogue.yaml -n test
	kubectl create -f ./pipeline/pipeline-queue-master.yaml -n test
	kubectl create -f ./pipelinerun/PipelineRun-queue-master.yaml -n test
	kubectl create -f ./pipeline/pipeline-rabbitmq.yaml -n test
	kubectl create -f ./pipelinerun/PipelineRun-rabbitmq.yaml -n test
	kubectl create -f ./pipeline/pipeline-orders.yaml -n test
	kubectl create -f ./pipelinerun/PipelineRun-orders.yaml -n test
	kubectl create -f ./pipeline/pipeline-shipping.yaml -n test
	kubectl create -f ./pipelinerun/PipelineRun-shipping.yaml -n test
	kubectl create -f ./pipeline/pipeline-user.yaml -n test
	kubectl create -f ./pipelinerun/PipelineRun-user.yaml -n test
	kubectl create -f ./pipeline/pipeline-payment.yaml -n test
	kubectl create -f ./pipelinerun/PipelineRun-payment.yaml -n test
	kubectl create -f ./pipeline/pipeline-carts.yaml -n test
	kubectl create -f ./pipelinerun/PipelineRun-carts.yaml -n test
	kubectl create -f ./pipeline/pipeline-load-test.yaml -n test
	kubectl create -f ./pipelinerun/PipelineRun-load-test.yaml -n test

run-js-test:
	kubectl create -f ./tasks/run-e2e.yaml -n test
	kubectl apply -f ./tasks/deploy-prod-task.yaml -n test
	kubectl create -f ./pipeline/pipeline-e2e-js-test.yaml -n  test
	kubectl create -f ./pipelinerun/PipelineRun-e2e-js-test.yaml -n  test

pods-status:
	./check.sh

delete-roles:
	kubectl delete -f role.yaml -n test -f role-binding.yaml -n test -f sa-front-end.yaml -n test

delete-pipelineresource:
	cd PipelineResource && kubectl delete -f . -n test 

delete-tasks:
	cd tasks && kubectl delete -f . -n test

delete-pipeline:
	cd pipeline && kubectl delete -f . -n test

delete-pipelinerun:
	cd pipelinerun && kubectl delete -f . -n test

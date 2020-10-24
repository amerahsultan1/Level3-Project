try-test:
	kubectl create -f PipelineResource-e2e-js-test.yaml -n  test
	kubectl create -f task-e2e-js-test.yaml -n  test
	kubectl create -f task-e2e-js-test-dep.yaml -n  test
	kubectl create -f pipeline-e2e-js-test.yaml -n  test
	kubectl create -f PipelineRun-e2e-js-test.yaml -n  test

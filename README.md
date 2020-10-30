# DevOps Bootcamp Level 3 Final Project

## Capstone Project

The level 3 project give chance to the DevOps Engineer Trainee to deploy the [Weaveworks Shock Shop demo](https://github.com/microservices-demo)  

## The level3-project Repository Include: 

* Separate directory for each micro-service.

* Documentation: contains the [task.md](https://github.com/amerahsultan1/level3-project/blob/main/documentation/tasks.md) and [dairy.md](https://github.com/amerahsultan1/level3-project/blob/main/documentation/dairy.md) files.

* [Deployment](https://github.com/amerahsultan1/level3-project/tree/main/deployment): all the deployment and services yaml files for all micro-service.  

* [k8s-sandbox](https://github.com/amerahsultan1/level3-project/tree/main/k8s-sandbox): provides a modularized k8s platform based on K3D. The elf directory has a `elf.sh` to install elf. the grafana directory

* [Tekton](https://github.com/amerahsultan1/level3-project/tree/main/tekton): contains all the tasks, PipelineResource, Pipeline, PipelineRun. 

## Run Socks Shop

* To deploy and build the socks shop website you just need to run:
```bash
make up
```

* Creating cluster, install ingress and install cicd you should run:
```bash
make init
```

* To have access to push the images you need to `login -u amerahsultan1`, amerahsultan1 is the username, and enter the password, after that the secret will created:
```bash
make secret-docker
```

* To deploy all micro-services you need to run:
```bash
make run-socks-shop
```

 


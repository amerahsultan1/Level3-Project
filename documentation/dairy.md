# Daily Notes

## Day1 - Friday
* Discover the micro-services git hub account, to know how many micro-service we have, clone them in single repository. 

* Start with front-end Dockerfile, to check if the Dockerfile need any changes before move to sandbox and automate the image using Tekton tool. Building and running Dockerfile successfully.

* Build and run edge-router, and catalogue Dockerfiles locally.

![cataloguecurl](https://user-images.githubusercontent.com/66031162/96351234-ce8d5200-10c2-11eb-8c5c-c8247bfd33db.png)

### Obsticales
* The edge-router respond with bad gateway. Since not all micro-service are work.  

*  Faced some obstacles to connect the catalogue-db with catalogue micro-service, it was easy when creating a network to connect all micro-service and run the website later. 

## Day2 - Saturday
* Build and run e2e-tests, load-test, carts and user successfully.

* Edit the carts multi-stage Dockerfile, since there is some errors in the latest one. 

![cartscurl](https://user-images.githubusercontent.com/66031162/96352514-765b4d80-10cc-11eb-8fe8-681cf9f65f8c.png)

![usercurl](https://user-images.githubusercontent.com/66031162/96352534-870bc380-10cc-11eb-95eb-b0c80653dc56.png)

### Obsticales
* The e2e-test container exit always, so I keep this image to fix it later since it’s for testing all micro-service.

* The load-test image was in old version, search for suitable one and fix the errors. 

* The carts image doesn’t work, so fix that with checkout to 0.4.8 version and build, run complete successfully.

## Day3 - Sunday

* Edit the orders, payment, shipping and queue-master multi-stag images, build and run complete successfully.

![orderscurl](https://user-images.githubusercontent.com/66031162/96353318-6f840900-10d3-11eb-9da9-6f26a7e8493a.png)
![paymentcurl](https://user-images.githubusercontent.com/66031162/96353322-7c086180-10d3-11eb-8bfe-30ced7030580.png)
![queuecurl](https://user-images.githubusercontent.com/66031162/96353325-862a6000-10d3-11eb-9066-243ab9a6f226.png)
![shippingcurl](https://user-images.githubusercontent.com/66031162/96353332-904c5e80-10d3-11eb-86bb-74a967479f6a.png)

### Obsticales
* Error in payment image in set capabilities in file app, so solve this problem by adding app/main.

* Face problem in queue-master image, solve it by remove the dependencies in pom.xml file.

## Day4 - Monday
* Run Sandbox, create cluster, install Tekton to automate the images, push all images to docker hub after creating the following files: secret, Taske, TaskRun, PipelineResource and ServiceAccount. 

* Successed to push half of images to docker hub.

### Obsticales
* Get errors that the resources cant access, solve this issue by making the github repo public. 

* run the secret file in default namespace, and other files in test namespace.

## Day5 - Tusday
* Complete push remaining images to docker hub.

* To make sure that all images are work, I create “sock-shop” network in sandbox, to run all images in the same network. Run the public database images which are: mongo:3.4 for user and orders. Rabbitmq fot queue-master.

![docker-ps](https://user-images.githubusercontent.com/66031162/96353774-dacfda00-10d7-11eb-8ae9-fdad3e7213cf.png)
![web](https://user-images.githubusercontent.com/66031162/96353858-9bee5400-10d8-11eb-9495-d4b100b56a4f.png)


## Day6 - Wednesday
* Start with create YAML files for all micro-services, acually it's all in the socks-shop demo in github, but it's need some changes.

* I deploy the micro-services manually, if it's work, I start to automate them via Tekton, creating Task to deploy the services in test namespace, PipelineResource, Pipeline, PipelineRun.  

* Edit the catalogue deploy and service files, add the dockerhub account and image name that I pushed before. 
* Catalogue and Cataloge-db are deploy successfully. Automate them using Tekton. 

### Obsticales
* Have a problem when deploy the catalogue micro-service, the pod status shows CrashLoopBackOff, because of permission denied problem.
solving this problem by editing the Dockerfile and remove (USER ${SERVICE_USER}). Push the image again, delete the pods, recreate it and it's work. 

## Day7 - Thursday
* Edit the front-end yaml files by adding the image, ingress.yaml. at the end of the day it's work after suffering from simple mistake :) 

### Obsticales
* The front-end doesn't work at the first time, I thought that I'm using the wrong port, but after that I notice that I didn't Install an Ingress controller.  

## Day8 - Friday
* Start with deploy carts and carts-db, everything is ok, day with no errors.  

## Day9 - Saturday
* Have a diffecult time to deploy user micro-service as the Dockerfile need to be edit and push to Dockerhub again, since the old image was fine locally but when I start to deploy the service it doesn't work. after solve all errors and deploy it successfully, I start with user-db to deploy it, same things the cause of errors from the Dockerfile, fix it and the service deploy successfully. 

### Obsticales
* The user micro-service expose in port 8084, so I change it to 80 because it was show that the (connection reset by peer). 

* The user-db logs shows permission denied problem from (mongo_create_insert.sh) script, so chmod the script and remove the (--shutdown) as the database logs will exit immediately.

## Day10 - Sunday
* Deploy the orders micro-service and orders-db, the orders deploy successfully. The orders-db deploy by using public mongo image.  

## Day11 - Monday
* Start with deploy the payment micro-service, the pod status is CrashLoopBackOff, and the logs shows the permission denied. Back to Dockerfile and discove that I witre the path /app without main. fix it, remove the pods and create it again, and it's work.       

## Day12 - Tusday
* The shipping micro-service deploy successfully, without any errors :)


## Day13 - Wednesday
* Also, working to complete the deployment, the load-test doesn't take much time, so spend the rest of the day to complete the Tikton pipelines for other services.
* All micro-services deploy successfully

![success](https://user-images.githubusercontent.com/66031162/97737294-dea72780-1aed-11eb-8348-b855a9e7d60d.png)

* The Socks Shop website

![webfinal](https://user-images.githubusercontent.com/66031162/97737539-35146600-1aee-11eb-8a1d-79bff706a0a0.png)

## Day14 - Thursday
* After deploy all microservies through Tekton successfully, I start the e2e-js-test. First, edit the Dockerfile by adding WORKDIR and COPY the alpine node in it. Then push the image to Dockerhub.
* Fix the path in runner.sh
* Create Tekton Task to run the e2e-js-test.
* Try to understand the e2e-js-test, search on the socks shop about the user and password they have. I fix the password to (eve).

![userssss](https://user-images.githubusercontent.com/66031162/97738289-34c89a80-1aef-11eb-9f0c-815301b2bc6a.png)

## Day15 - Friday
* Complete to fix e2e-js-test in order to pass all tests. Fix the login in checkout.test, as it's not lead the user to "my order" page.

## Day16 - Saturday
* Also today not finish yet, complete working on e2e-js-test by edit the statement in homepage-test (get a pet hamster for free!), the right one is (get a shoe for free!). 

### Obsticales
* Suddenly catalogue micro-service doesn't work, i dont know the reason for that, the PipelineRun shows that the build-push task is failed. I decide to run it again tomorrow.    

## Day17 - Sunday
* Start with catalogue, try to run the PipelineRun again and it was success.
* Finally, all microservices pass the e2e-js-test successfully. Now, start to deploy them to (prod) namespace.   

## Day18 - Monday
* Start with create yaml file for all micro-services, change the NodePort 30001 to 30002, since it used by front-end service in test namespace.
* Create a deploy-prod.yaml task, to deploy all micro-services to prod namespace.

## Day19 - Tusday
* Run the wait command via Makefile to check the pods status before run the test, using this command in makfile not a good idea. The Makefile will exit when the pods not ready or timeout the limit, I ask for help, and my frind show me a script by using Do While, so the command will never exit until the pods status ready.
* Create a wait task to use it in all pipelines.

## Day20 - Wednesday
* Add the wait task, deploy to prod task in all micro-services pipelines. Run them and some will failed, the aim is one or more micro-service will pass the test and go to deploy all micro-services in prod namespace.

* List of PipelineRun
![pass](https://user-images.githubusercontent.com/66031162/97744677-b96be680-1af8-11eb-9948-12790447344e.png)

* All micro-services pass the e2e-js-test

![passingg](https://user-images.githubusercontent.com/66031162/97744943-24b5b880-1af9-11eb-9747-779e5f2346f3.png)

* The micro-services deploy on prod namespace

![prodnamespace](https://user-images.githubusercontent.com/66031162/97745064-575fb100-1af9-11eb-9b37-ee84b77f22ec.png)

## Day21 - Thursday
* Start to install elf and grafana tools, install them using helm.

## Day22 - Friday
* Finishing up the repo, edit Makefiles and remove some files.

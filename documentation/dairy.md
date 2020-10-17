# Daily Notes
## Day1 - Sunday
* Discover the micro-services git hub account, to know how many micro-service we have, clone them in single repository. 

* Start with front-end Dockerfile, to check if the Dockerfile need any changes before move to sandbox and automate the image using Tekton tool. Building and running Dockerfile successfully.

* Build and run edge-router, and catalogue Dockerfiles locally.

![cataloguecurl](https://user-images.githubusercontent.com/66031162/96351234-ce8d5200-10c2-11eb-8c5c-c8247bfd33db.png)

### Obsticales
* The edge-router respond with bad gateway. Since not all micro-service are work.  

*  Faced some obstacles to connect the catalogue-db with catalogue micro-service, it was easy when creating a network to connect all micro-service and run the website later. 

## Day2 - Monday
* Build and run e2e-tests, load-test, carts and user successfully.

* Edit the carts multi-stage Dockerfile, since there is some errors in the latest one. 

![cartscurl](https://user-images.githubusercontent.com/66031162/96352514-765b4d80-10cc-11eb-8fe8-681cf9f65f8c.png)

![usercurl](https://user-images.githubusercontent.com/66031162/96352534-870bc380-10cc-11eb-95eb-b0c80653dc56.png)

### Obsticales
* The e2e-test container exit always, so I keep this image to fix it later since it’s for testing all micro-service.

* The load-test image was in old version, search for suitable one and fix the errors. 

* The carts image doesn’t work, so fix that with checkout to 0.4.8 version and build, run complete successfully.

## Day3 - Tusday

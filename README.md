# Sample helm app to demonstrate deployment of a spring boot and an angular pod in a minikube cluster locally.

## To install the helm yamls 
- First got to the root of the project  
- then`helm install helloworld .`

## To uninstall use
`helm uninstall helloworld`  
**Note : before you uninstall, you must delete the services and deployments that are created by this helm chart

## Use port-forwarding while trying to access the pods locally as ClusterIP is not supported out of the box by minikube

use this for 
- spring boot app `k port-forward helloworld-helloworldchart-... 2200:2200`   
- angular app `k port-forward helloworld-helloworldchart-ng-... 8080:8080`

**Note : the names of the pods are different each time they are deployed so fill up the `...` with their appropriate hashes.

then you can access http://localhost:8080 in browser and curl to http://localhost:2200/hello/version to test both the apps are working fine



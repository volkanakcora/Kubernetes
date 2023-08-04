kubectl get namespace


oh856@pc9d034:~/kubernetes$ kubectl get ns                                                                                                   
NAME              STATUS    AGE                                                                                                              
argocd            Active    14m                                                                                                              
default           Active    30h                                                                                                              
kube-node-lease   Active    30h                                                                                                              
kube-public       Active    30h                                                                                                              
kube-system       Active    30h    


for specific namespace's pods: 

kubectl get pods --namespace argocd 

all pods in all namespace:

kubectl get pods --all-namespaces


how to connect that pod: 

kubectl exec -it namespacepod -n development -- /bin/sh 

if you wanna set namespace as a defaut:

kubectl config set-context --curent --namespace=development


after setting it now we have the pods from that specific:

oh856@pc9d034:~/kubernetes$ kubectl config set-context --current --namespace=development                                                     │
Context "minikube" modified.                                                                                                                 │
oh856@pc9d034:~/kubernetes$ kubectl get pods                                                                                                 │
NAME           READY   STATUS    RESTARTS   AGE                                                                                              │
namespacepod   1/1     Running   0          14m      
# label ve label selector
**label ve label selector** konusuyla ilgili dosyalara buradan erişebilirsiniz.
***
Objelere etiket tanımlama.
```
$ kubectl label "obje_tipi" "obje_ismi" "anahtar=değer"

Ör: kubectl label pods pod9 app=thirdapp
```
***
Objelerden etiket kaldırma.
```
$ kubectl label "obje_tipi" "obje_ismi" "anahtar-"

Ör: kubectl label pods pod9 app-
```
***
Objelere atanmış etiketi güncelleme.
```
$ kubectl label --overwrite "obje_tipi" "obje_ismi" "anahtar=değer"

Ör: kubectl label --overwrite pods pod9 team=team3
```
***
Bir namespace’deki tüm objelere toplu halde label eklemek. 
```
$ kubectl label "obje_tipi" --all "anahtar=değer"

Ör: kubectl label pods --all foo=bar
```
***
Objelere atanmış etiketleri listeleme. 
```
$ kubectl get "obje_tipi" --show-labels

Ör: kubectl get pods --show-labels
```
***
Objeleri belirlenen etiketlere göre listeleme. 

```
$ kubectl get "obje_tipi" -l "anahtar:değer"

Ör: kubectl get pods -l "app"
```
***
Objeleri belirlenen etiketlere göre listeleme. _(virgül **","** **ve**, **"="** **eşittir**, **"!="** **eşit değildir** anlamına gelir. Set-based **"in" içinde**, **"notin" içinde değil** anlamına gelir)_

```
$ kubectl get "obje_tipi" -l "anahtar:değer"

Ör: kubectl get pods -l "app=firstapp,tier=frontend" --show-labels
Ör: kubectl get pods -l "app=firstapp,tier!=frontend" --show-labels
Ör: kubectl get pods -l "app,tier=frontend" --show-labels
Ör: kubectl get pods -l 'app in (firstapp)' --show-labels
Ör: kubectl get pods -l "app=firstapp,app=secondapp" --show-labels
Ör: kubectl get pods -l 'app in (firstapp,secondapp)' --show-labels
Ör: kubectl get pods -l 'app notin (firstapp)' --show-labels
Ör: kubectl get pods -l 'app,app notin (firstapp)' --show-labels
Ör: kubectl get pods -l '!app' --show-labels
Ör: kubectl get pods -l 'app in (firstapp),tier notin (frontend)' --show-labels
```
***

2030  kubectl get pods --label firstapp
 2031  kubectl get pods --label app
 2032  kubectl get pods --label=app
 2033  kubectl get pods --label=firstapp
 2034  kubectl get pods -l "app"
 2035  kubectl get pods -l "app" --show-labels
 2036  kubectl get pods -l "team1" --show-labels
 2037  kubectl get pods -l "team" --show-labels
 2038  kubectl get pods -l "app" --show-labels
 2039  kubectl get pods -l "app=firstapp" --show-labels
 2040  kubectl get pods -l "app=secondapp" --show-labels
 2041  kubectl get pods -l "team=team1" --show-labels
 2042  kubectl get pods -l "team=team2" --show-labels
 2043  kubectl get pods -l "app" --show-labels
 2044  kubectl get pods -l "app=firstapp" --show-labels
 2045  kubectl get pods -l "app=firstapp,tier=frontend" --show-labels
 2046  kubectl get pods -l "app=firstapp,tier=backend" --show-labels
 2047  kubectl get pods -l "app,tier!=backend" --show-labels
 2048  kubectl get pods -l 'app in (firstapp)' --show-labels
 kubectl get pods -l "app in (firstapp, secondapp)" --show-labels
 kubectl get pods -l "app,app notin (firstapp)" --show-labels  it will bein app, but without firstapp

 oh856@pc9d034:~/kubernetes$ kubectl get pods -l "team,team notin (team1)" --show-labels
NAME      READY     STATUS    RESTARTS   AGE       LABELS
pod10     1/1       Running   0          12m       team=team2


not apps:

oh856@pc9d034:~/kubernetes$ kubectl get pods -l '!app' --show-labels
NAME      READY     STATUS    RESTARTS   AGE       LABELS
pod10     1/1       Running   0          13m       team=team2
pod11     0/1       Pending   0          13m       <none>
pod9      1/1       Running   0          13m       team=team1



add label:
 kubectl get pods --show-labels

remove label:
 kubectl label pods pod9 app-

update:
kubectl label --overwrite pods pod9 team=team3

add labels to the all pods:
kubectl label pods --all foo=bar



looks up for specific label:

---
apiVersion: v1
kind: Pod
metadata:
  name: pod11
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80
  nodeSelector:
    hddtype: ssd


	currently it's down: 
	
	^Coh856@pc9d034:~/kubernetes$ kubectl get pods -w
NAME      READY     STATUS    RESTARTS   AGE
pod1      1/1       Running   0          49m
pod10     1/1       Running   0          49m
pod11     0/1       Pending   0          49m
pod2      1/1       Running   0          49m


,, as soon as we add this label to our node: 
 kubectl label nodes minikube hddtype=ssd


 it started running: 

 pod9      1/1       Running   0          49m
pod11     0/1       Pending   0         50m
pod11     0/1       ContainerCreating   0         50m
pod11     1/1       Running   0         50m


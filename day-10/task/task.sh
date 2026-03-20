# task1 -- 
kubectl create ns ns1
kubectl create ns ns2 

# task2 -- 
kubectl create deploy deploy-ns1 --image=nginx --replicas=1 -n ns1
kubectl create deploy deploy-ns2 --image=nginx --replicas=1 -n ns2

# task3 -- 
kubectl describe pod deploy-ns1-7cb9db495-g8987 -n ns1   # 10.244.1.7
kubectl describe pod deploy-ns2-7959d77754-sk8jj -n ns2 #  10.244.2.6

# task4 -- 
kubectl exec -it deploy-ns1-7cb9db495-g8987 -n ns1 -- sh
curl 10.244.2.6

kubectl exec -it deploy-ns2-7959d77754-sk8jj -n ns2 -- sh
curl 10.244.1.7 

# task5 -- 
kubectl scale --replicas=3 deploy/deploy-ns1 -n ns1    
kubectl scale --replicas=3 deploy/deploy-ns2 -n ns2

# task6 -- 
kubectl expose deploy/deploy-ns1 --name=svc-ns1 --port 80 -n ns1
kubectl expose deploy/deploy-ns2 --name=svc-ns2 --port 80 -n ns2

# task7 
kubectl exec -it deploy-ns1-7cb9db495-g8987 -n ns1 -- sh       
kubectl get svc -n ns2 
curl 10.96.220.99

kubectl exec -it deploy-ns2-7959d77754-sk8jj -n ns2 -- sh
kubectl get svc -n ns1
curl 10.96.54.220

# task8 
kubectl exec -it deploy-ns1-7cb9db495-g8987 -n ns1 -- sh 
curl svc-ns2 # error 

kubectl exec -it deploy-ns2-7959d77754-sk8jj -n ns2 -- sh
curl svc-ns1

# task9 
kubectl exec -it deploy-ns1-7cb9db495-g8987 -n ns1 -- sh
curl svc-ns2
cat /etc/resolv.conf
curl svc-ns2.ns2.svc.cluster.local

kubectl exec -it deploy-ns2-7959d77754-sk8jj -n ns2 -- sh
curl svc-ns1.ns1.svc.cluster.local

# task10 
kubectl delete ns ns1 
kubectl delete ns ns2

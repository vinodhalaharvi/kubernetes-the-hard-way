kubectl create secret generic kubernetes-the-hard-way \
  --from-literal="mykey=mydata"


gcloud compute ssh controller-0 \
  --command "sudo ETCDCTL_API=3 etcdctl get \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/etcd/ca.pem \
  --cert=/etc/etcd/kubernetes.pem \
  --key=/etc/etcd/kubernetes-key.pem\
  /registry/secrets/default/kubernetes-the-hard-way | hexdump -C"

kubectl run nginx --image=nginx


kubectl get pods -l run=nginx


POD_NAME=$(kubectl get pods -l run=nginx -o jsonpath="{.items[0].metadata.name}")

echo "Sleeping while the pod comes up for 20 secs .. "  && sleep 20

kubectl port-forward $POD_NAME 8080:80

echo "Open new terminal and verify .. " 
echo " kubectl logs $POD_NAME"



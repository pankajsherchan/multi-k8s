docker build -t pankajsherchan/multi-client:latest -t pankajsherchan/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t pankajsherchan/multi-server:latest -t pankajsherchan/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t pankajsherchan/multi-worker:latest -t pankajsherchan/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push pankajsherchan/multi-client:latest
docker push pankajsherchan/multi-server:latest
docker push pankajsherchan/multi-worker:latest
docker push pankajsherchan/multi-client:$SHA
docker push pankajsherchan/multi-server:$SHA
docker push pankajsherchan/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=pankajsherchan/multi-client:$SHA
kubectl set image deployments/server-deployment server=pankajsherchan/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=pankajsherchan/multi-worker:$SHA
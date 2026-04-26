## Task 8/40


In this exercise, you will create a Deployment with multiple replicas. After inspecting the Deployment, you will update its Pod template. You will also be able to use the rollout history to roll back to a previous revision.

> [!NOTE]
> If you do not already have a Kubernetes cluster, you can create a local Kubernetes cluster by following [Day06 Video](https://youtu.be/RORhczcOrWs)


## Replicaset
- Create a new Replicaset based on the nginx image with 3 replicas --listo 
- Update the replicas to 4 from the YAML -- listo 
- Update the replicas to 6 from the command line -- listo 

## Deployment
1. Create a Deployment named `nginx` with 3 replicas. The Pods should use the `nginx:1.23.0` image and the name `nginx`. The Deployment uses the label `tier=backend`. The Pod template should use the label `app=v1`.
2. List the Deployment and ensure the correct number of replicas is running.
3. Update the image to `nginx:1.23.4`.
4. Verify that the change has been rolled out to all replicas.
5. Assign the change cause "Pick up patch version" to the revision.
6. Scale the Deployment to 5 replicas.
7. Have a look at the Deployment rollout history.
8. Revert the Deployment to revision 1.
9. Ensure that the Pods use the image `nginx:1.23.0`.

1. Cree una implementación llamada `nginx` con 3 réplicas. Los Pods deben utilizar la imagen `nginx:1.23.0` y el nombre `nginx`. La implementación utiliza la etiqueta `tier=backend`. La plantilla Pod debe utilizar la etiqueta `app=v1`. -- listo
2. Enumere la implementación y asegúrese de que se esté ejecutando la cantidad correcta de réplicas. -- listo 
3. Actualice la imagen a `nginx:1.23.4`. -- listo 
4. Verifique que el cambio se haya implementado en todas las réplicas. -- listo 
5. Asigne la causa de cambio "Recoger versión del parche" a la revisión.  --listo 
6. Escale la implementación a 5 réplicas. -- listo 
7. Eche un vistazo al historial de implementación. -- listo 
8. Revertir la implementación a la revisión 1. -- listo 
9. Asegúrese de que los Pods utilicen la imagen `nginx:1.23.0`. -- listo 

## Troubleshooting the issue
1. Apply the below YAML and fix the issue with it -- listo 

``` YAML
apiVersion: v1
kind:  Deployment
metadata:
  name: nginx-deploy
  labels:
    env: demo
spec:
  template:
    metadata:
      labels:
        env: demo
      name: nginx
    spec:
      containers:
      - image: nginx
        name: nginx
        ports:
        - containerPort: 80
  replicas: 3
  selector:
    matchLabels:
      env: demo
```

2. Apply the below YAML and fix the issue with it

``` YAML -- listo 
apiVersion: v1
kind:  Deployment
metadata:
  name: nginx-deploy
  labels:
    env: demo
spec:
  template:
    metadata:
      labels:
        env: demo
      name: nginx
    spec:
      containers:
      - image: nginx
        name: nginx
        ports:
        - containerPort: 80
  replicas: 3
  selector:
    matchLabels:
      env: dev
```
3. **Share your learnings**: Document your key takeaways and insights in a blog post and social media update
4. **Make it public**: Share what you learn publicly on LinkedIn or Twitter.
   - **Tag us and use the hashtag**: Include the following in your post:
     - Tag [@PiyushSachdeva](https://www.linkedin.com/in/piyush-sachdeva) and [@CloudOps Community](https://www.linkedin.com/company/thecloudopscomm) (on both platforms)
     - Use the hashtag **#40daysofkubernetes**
     - **Embed the video**: Enhance your blog post by embedding the video lesson from the Kubernetes series. This will provide visual context and reinforce your written explanations.

## Blog Post Focus 📝

- **Clarity is essential**: Write your blog post clearly and concisely, making it easy for anyone to grasp the concepts, regardless of their prior Kubernetes experience.

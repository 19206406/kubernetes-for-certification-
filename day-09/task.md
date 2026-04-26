## Task 9/40


In this exercise, you will create a Deployment and expose a container port for its Pods. You will demonstrate the differences between the service types ClusterIP and NodePort.

> [!NOTE]
> If you do not already have a Kubernetes cluster, you can create a local Kubernetes cluster by following [Day06 Video](https://youtu.be/RORhczcOrWs)
> Also, do the node binding at the cluster level if you are using KIND. The Day9 video has the details on how to do that.

### Task details
1. Create a Service named `myapp` of type `ClusterIP` that exposes port 80 and maps to the target port 80.
2. Create a Deployment named `myapp` that creates 1 replica running the image `nginx:1.23.4-alpine`. Expose the container port 80.
3. Scale the Deployment to 2 replicas.
4. Create a temporary Pod using the image `busybox` and run a `wget` command against the IP of the service.
5. Run a `wget` command against the service outside the cluster.
6. Change the service type so the Pods can be reached outside the cluster.
7. Run a `wget` command against the service outside the cluster.
8. Discuss: Can you expose the Pods as a service without a deployment?
9. Discuss: Under what condition would you use the service types `LoadBalancer,` `node port,` `clusterIP,` and `external`?

### Detalles de la tarea
1. Cree un servicio denominado «myapp» de tipo «ClusterIP» que exponga el puerto 80 y se asigne al puerto de destino 80. -----> listo 
2. Cree una implementación denominada «myapp» que cree una réplica que ejecute la imagen «nginx:1.23.4-alpine». Exponga el puerto 80 del contenedor. ----> listo 
3. Escalar la implementación a dos réplicas.-----> listo 
4. Crear un pod temporal utilizando la imagen «busybox» y ejecutar un comando «wget» contra la IP del servicio. -- listo 
5. Ejecutar un comando «wget» contra el servicio fuera del clúster. -- listo 
6. Cambie el tipo de servicio para que se pueda acceder a los pods fuera del clúster. -- listo 
7. Ejecute un comando «wget» en el servicio fuera del clúster. -- listo 
8. Debate: ¿Se pueden exponer los pods como un servicio sin una implementación?

Es un recurso que proporciona un punto de acceso estable a un conjunto de Pods, ocultando sus IP cambiantes y permitiendo balanceo de tráfico.

3. **Share your learnings**: Document your key takeaways and insights in a blog post and social media update
4. **Make it public**: Share what you learn publicly on LinkedIn or Twitter.
   - **Tag us and use the hashtag**: Include the following in your post:
     - Tag [@PiyushSachdeva](https://www.linkedin.com/in/piyush-sachdeva) and [@CloudOps Community](https://www.linkedin.com/company/thecloudopscomm) (on both platforms)
     - Use the hashtag **#40daysofkubernetes**
     - **Embed the video**: Enhance your blog post by embedding the video lesson from the Kubernetes series. This will give you visual context and reinforce your written explanations.

## Blog Post Focus 📝

- **Clarity is essential**: Write your blog post clearly and concisely, making it easy for anyone to grasp the concepts, regardless of their prior Kubernetes experience.

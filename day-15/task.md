## Task 15/40

In this exercise, you will explore Node Affinity in Kubernetes
> [!NOTE]
> If you do not already have a Kubernetes cluster, you can create a local Kubernetes cluster by following [Day06 Video](https://youtu.be/RORhczcOrWs)
Also, could you do the port binding at the cluster level if you are using KIND? The Day9 video has the details on how to do that.

### Task details
- create a pod with nginx as the image and add the nodeffinity with property requiredDuringSchedulingIgnoredDuringExecution and condition disktype = ssd
- check the status of the pod and see why it is not scheduled
- add the label to your worker01 node as distype=ssd and then check the status of the pod
- It should be scheduled on worker node 1
- create a new pod with redis as the image and add the nodeaffinity with property requiredDuringSchedulingIgnoredDuringExecution and condition disktype without any value
- add the label to worker02 node with disktype and no value
- ensure that pod2 should be scheduled on worker02 node

3. **Share your learnings**: Document your key takeaways and insights in a blog post and social media update
4. **Make it public**: Share what you learn publicly on LinkedIn or Twitter.
   - **Tag us and use the hashtag**: Include the following in your post:
     - Tag [@PiyushSachdeva](https://www.linkedin.com/in/piyush-sachdeva) and [@CloudOps Community](https://www.linkedin.com/company/thecloudopscomm) (on both platforms)
     - Use the hashtag **#40daysofkubernetes**
     - **Embed the video**: Enhance your blog post by embedding the video lesson from the Kubernetes series. This will give you visual context and reinforce your written explanations.

## Blog Post Focus 📝

- **Clarity is essential**: Write your blog post clearly and concisely, making it easy for anyone to grasp the concepts, regardless of their prior Kubernetes experience.

### Detalles de la tarea
- Crea un pod con la imagen de Nginx y añade la afinidad de nodo con la propiedad `requiredDuringSchedulingIgnoredDuringExecution` y la condición `disktype = ssd`.
- Comprueba el estado del pod y averigua por qué no se ha programado.
- Añade la etiqueta `distype=ssd` a tu nodo worker01 y, a continuación, comprueba el estado del pod.
- Debería programarse en el nodo worker 1
- Crea un nuevo pod con redis como imagen y añade la nodeaffinity con la propiedad requiredDuringSchedulingIgnoredDuringExecution y la condición disktype sin ningún valor
- Añade la etiqueta al nodo worker02 con disktype y sin valor
- Asegúrate de que el pod2 se programa en el nodo worker02
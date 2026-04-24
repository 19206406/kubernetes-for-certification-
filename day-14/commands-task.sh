
# Tarea 1 
# Crear tolerancias para los nodos de trabajo del cluster 

cd day-14
k taint node cka-cluster2-worker gpu=true:NoSchedule 
k taint node cka-cluster2-worker2 gpu=false:NoSchedule 

# Tarea 2 
# Crear un pod con una tolerancia para el nodo cka-cluster2-worker

k run nginx --image=nginx -o yaml > nginx-pod.yaml
k delete pod nginx 
k apply -f nginx-pod.yaml # modificar el archivo yaml para agregar la tolerancia
k get pods # Verificar si el pod se ha creado correctamente y esta corriendo como se debe 

# Tarea 3 
# Eliminar la marca del taint del nodo del cluster 
k taint node cka-cluster2-worker gpu=true:NoSchedule-
k describe node cka-cluster2-worker # Verificar que el taint se ha eliminado correctamente

# Tarea 4 
# Crear un nuevo pod y verificar en cual nodo se va ha ejecutar 
k run redis --image=redis # se debe de crear o administrar el nodo del worker1 

# Tarea 5 
# Añadir de nuevo el taint al node 
# En este caso el pod de nginx que tiene se ejecuta con normalidad en el nodo 
# en el caso del pod de redis tambien se ejecuta con normalidad ya que se creo despues de eliminar 
# el taint al node y al momento de agregar el taint con el efecto de NoSchedule los pods
# que no tenian este taint se siguen ejecutando con normalidad 

k taint node cka-cluster2-worker gpu=true:NoSchedule
k describe node cka-cluster2-worker 
k get pods

# Eliminar las taints de los nodos al final para continuar correctamente con el aprendizaje 
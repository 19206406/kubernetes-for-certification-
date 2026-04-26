
# TAREA 1 
# Inicia sesión en tu clúster y crea un nuevo espacio de nombres con el nombre «mem-example»
k create ns mem-example 

# TAREA 2 
# Instala el servidor de métricas utilizando el archivo YAML que se proporciona en este repositorio
# Ya lo tenia instalado desde la clase 

cd day-16
k apply -f metrics-server.yaml
k get pod -n kube-system # Verificar si se aplico correctamente el pod 
k top 
k top node 

# TAREA 3 
# Sigue los pasos que se indican en el siguiente documento:
# Es basicamente seguir la documentación de kubernetes sobre este tema que hay un 
# ejemplo sobre estas metricas 

# Link: https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource/#specify-a-memory-request-and-a-memory-limit

k apply -f memory-request-limits.yaml -n mem-example 
k get pods -n mem-example 
k get pod memory-demo --output=yaml -n mem-example # ver información detallada de un pod como si fuera un describe 

k top pod memory-demo -n mem-example # ver el detalle de rendimiento del pod 
k delete pod memory-demo -n mem-example # eliminar el pod 

# exceder el limite de memoria de un pod 
# los mismos pasas que el anterior pero con el siguiente archivo este va generar una fallo debido a la 
# memoria asignada 
k apply -f memory-request-limits2.yaml -n mem-example 
kubectl get pod memory-demo-2 --namespace=mem-example
k describe nodes
kubectl delete pod memory-demo-2 --namespace=mem-example

# exceder el limite de memoria del nodo 
# es basicamente hacer lo mismo que lo anterior 
# lo más importante es analizar correctamente los dos tipos de error que son cuando 
# asignamos al contenedor una memoria menor que la que le vamos a exigir y la segunda cuando 
# le pedimos al nodo una mayor cantidad de memoria 

# Cabe aclarar que no lo hare debido a que esto lo vi en la clase 
k apply -f memory-request-limits3.yaml
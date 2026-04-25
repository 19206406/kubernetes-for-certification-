# TAREA 1
# Crea un pod con la imagen de Nginx y añade la afinidad de nodo con la propiedad 
#`requiredDuringSchedulingIgnoredDuringExecution` y la condición `disktype = ssd`.

cd day-15
# --dry-run=client: Evita que se intente programar el pod y podamos 
# modificar el archivo yaml antes de crear el recurso
k run nginx --image=nginx --dry-run=client -o yaml > pod.yaml
k apply -f pod.yaml

# TAREA 2
# - Comprueba el estado del pod y averigua por qué no se ha programado.

# No se ha programado porque ninguno de los worker 
# tienen la affinity que se le programo al pod por esta razón      
# el pod queda como pendiente para programarse 

# TAREA 3 
# - Añade la etiqueta `disktype=ssd` a tu nodo worker01 y, a continuación, 
# comprueba el estado del pod.

# verificar si alguno de los nodos tiene alguna etiqueta ya configurada 
k get nodes --show-labels 

# eliminar una etiqueta que no queremos en el nodo 
k label node cka-cluster2-worker disktype-

# añadir la etiqueta que queremo configurada en el nodo 
k label node cka-cluster2-worker disktype=ssd

# verificar si el pod se ha configurado correctamente
k get pods -o wide

# TAREA 4 
# - Crea un nuevo pod con redis como imagen y añade la nodeaffinity con la propiedad 
# requiredDuringSchedulingIgnoredDuringExecution y la condición disktype sin ningún valor

# crear y modificar yaml 
k run redis --image=redis --dry-run=client -o yaml > pod2.yaml

# aplicar cambios al yaml
k apply -f pod2.yaml

# TAREA 5
Añade la etiqueta al nodo worker02 con disktype y sin valor


# TAREA 6
# - Añade la etiqueta al nodo worker02 con disktype y sin valor
k label node cka-cluster2-worker2 disktype=

# TAREA 7 
# - Asegúrate de que el pod2 se programa en el nodo worker02

# En este caso me toco que eliminarlo ya que anteriormente el pod 
# se programo en el nodo worker01 ya que como pod no tiene un valor 
# en la affinity este simplemente se programaria en el nodo que 
# tuviera simplemente la etiqueta disktype sin importar el valor 
# debido a la propiedad Exist 

k delete pod redis

k apply -f pod2.yaml

k get pods -o wide 
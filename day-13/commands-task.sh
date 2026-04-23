
# Tarea 1 -- programar un pod sin scheduler directamente del archivo yaml 

# movernos al directorio del dia 13 
cd day-13

# Crear un pod y guardar su configuración en un archivo yaml
# Al momento de ejecutar este comando se crea el pod en el 
# segundo nodo worker 
# en el archivo yaml especificare que se cree en el nodo worker  
k run nignx-task --image=nginx -o yaml > nginx-task.yaml 

# eliminar el nodo antes creado 
k delete pod nginx-task

# aplicar los nuevos cambios en el archivo yaml 
k apply -f pod-task.yaml

# Tare 2 -- reiniciar los componentes del plano de control

# para esta tarea no lo voy hacer ya que tengo que modificar 
# o hacer cambios en estos archivos y no quiero hacerlo 
# pero mostrare como se llegaria a estos archivos en kind 

# mirar los contenedores del cluster 
docker ps 

# ingresar al contenedor del plano de control
docker exec -it cka-cluster2-control-plane bash 

# nos movemos a la carpeta donde se encuentran los archivos de los componentes del plano de control
cd /etc/kubernetes/manifests/ 

# listar los archivos de esta carpeta para ver los componentes del plano de control
ls -lrt 

# salir del contenedor 
exit 

# Tarea 3 -- Crear 3 pods con la imagen de nginx y colocarles etiquetas diferentes 

# crear tres pods con la imagen de nginx y luego colocarles etiquetas en especifico 
# todo estaran en los archvios yaml 

k run pod1 --image=nginx -o yaml > pod1-task.yaml
k run pod2 --image=nginx -o yaml > pod2-task.yaml
k run pod3 --image=nginx -o yaml > pod3-task.yaml

# eliminar los pods creados 
k delete pod pod1, pod2, pod3

# aplicar los cambios en los archivos yaml para crear los pods con las etiquetas especificas
k apply -f pod1-task.yaml  
k apply -f pod2-task.yaml  
k apply -f pod3-task.yaml  

# ver los labels de cada pod 
k get pods --show-labels

# Tarea 4 - Rastrear pod con un label en especifico 
k get pod --selector env=dev --show-labels
k get pod --selector env=prod --show-labels


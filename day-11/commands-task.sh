# crear los init-containers
k create -f pod-task.yaml 

# crear servicio de deploy 
k create deploy golang-deploy --image nginx --port 80 

# exponer servicio 
k expose deploy golang-deploy --name mygolang --port 80 

# crear el segundo servicio 
k create deploy python-deploy --image nginx --port 80

# exponer servicio 
k expose deploy python-deploy --name mypython --port 80

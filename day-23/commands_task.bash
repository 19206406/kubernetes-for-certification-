# 1. Cambia al contexto «krishna» que creaste en la tarea del día 22.
k config use-contexts sebastian 

# 2. Crea un nuevo pod. ¿Qué esperas que suceda?
k apply -f pod-new.yaml 
# No se crea ya que mi usuario no puede crear crear recursos pods 
#  pods is forbidden: User "sebastian" cannot create resource "pods" in API group "" in the namespace "default"

# ----------------------------------------------------- # 
# la continuación de la tarea es hacer lo mismo que se vio en la clase pero con un usuario 
# nuevo esto ya lo hice con el usuario mío (sebastian) simplemente voy a crear las especificaciones de role y del role binding 
# con mi usuario 

# - Vuelve al contexto original con permisos de administrador. 
k config use-context kind-cka-cluster2
k auth whoami # verificar si estamos como administrador de kubernetes 

# - Crea un nuevo rol llamado «pod-reader». El rol debe conceder permisos para obtener, supervisar y listar pods.
# este es el mismo rol de la clase voy a agregar el permiso de crear pods 
k apply -f new-role.yaml # este archivo se encuentra en este mismo directorio agrege crear, actualizar y eliminar pods 
k get roles 
k describe roles pod-writter # verificar si estan los verbos correctamente 

# - Crea un nuevo RoleBinding llamado «read-pods». Asigna el usuario «krishna» al rol llamado «pod-reader».
k apply -f new-rolebinding.yaml # el archivo esta en el directorio day-23 
k get rolebindings 
k describe rolebindings write-pods 

# - Cambia al contexto denominado sebastian o el usuario propio. 
k config use-context sebastian 

# - Crea un nuevo pod llamado «nginx» con la imagen «nginx». ¿Qué esperas que suceda? 
k create -f pod-new.yaml # me permite crearlo sin ningun problema debido a los nuevos permisos agregados 

# - Enumera los pods del espacio de nombres. ¿Qué esperas que suceda?
k get pods # nada cuento con el permiso de hacerlo 

# - Crea un nuevo despliegue llamado «nginx-deploy». ¿Qué esperas que suceda?
k create -f new-deploy.yaml # esta en el directorio day-23 
# no puedo crearlo ya que no cuento con el permiso de hacerlo 

# Talves luego muestro todos los comandos de forma ordenada para crear un nuevo usuario certificado. 
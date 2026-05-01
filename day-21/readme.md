**Nuevo usuario:**
openssl genrsa -out adam.key 2048 

**Nuevo certificado:**
openssl req -new -key adam.key -out adam.csr -subj "/CN=adam"

**Necesitamos que el certificado este en base 64**
Este certificado lo pasamos al request del csr.yaml
cat adam.csr | base64
Get-Content -Raw adam.csr | base64

>[!IMPORTANT]
Evitar saltos de linea

cat adam.csr | base64 | tr -d "\n" 

Hay que tener en cuenta que el archivo anterior debe de estar en base64
para poder crear el certificado 

**Ver el certificado**
k get csr 

**Aprobar el certificado**
k certificate approve adam 

**ver si se aprovo**
k get csr 

**Obtener el certificado del request directamente del yaml**
k get csr adam -o yaml > issuecert.yaml 

luego hacer esto
echo LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0NCk1JSUNWRENDQVR3Q0FRQXdEekVOTUFzR0ExVUVBd3dFWVdSaGJUQ0NBU0l3RFFZSktvWklodmNOQVFFQkJRQUQNCmdnRVBBRENDQVFvQ2dnRUJBT0gxaHExSHVMa1pIUzF1cEtEajZxMk40Q01KeThmQng0NHVYWTQ4TDJRT2FNU0UNCnR0dzB6N0kxbDNCMUdhN3p0NjBvZVFCOU9EdUVFcDVjWjBXOHJnQjYzTHF3dkdhOWRySEdGSkdFNFdQNnFDMTINCkZHR096WUppczBsL2xaVmlsYjhVUU5mTnJsWUpidE5GSzFMVzlDOW00YXh2a2Y3eWdDb2JoQncySVAycXAvNHMNCjZlOHdxSFZDRFpwT3JiV1hGR2lwaWFmVy9Pa2cvOGhobjdZU3RGalppdEVSNFFQUHFaRXJwUEJZZGlvUGxuZ28NCmp1WEhESmRVVnErUjRHR29kdythemdSZ1lhUjhNZjBXWGRVZU5ocUEvRkpoYlZ6SEF1cGFhbmlMTEI5c1V4T20NCmF1aDVaY3FXUXlXUWdrUml1ZmViNVN3bVczeG9VdnBoMjNCc0c3VUNBd0VBQWFBQU1BMEdDU3FHU0liM0RRRUINCkN3VUFBNElCQVFCNCt3NjdRVWtxVkc3alFMNU9HVE13ZnZXZVFUQmlMOUUwNm4yV0xVZUgrTWNHcUpPenNsZ3oNClV5dmlOYlVTQ1BDRDVTaWVCUXk5N3lGbFNXUmR6OXIveE5BeTFMUG40aVMvT1UxcURWQjF2VFFra2VpUnYxWUkNCldmODgwWG1sc2h3My81TWZKM3k5SnBZSG1HaW5WYVozTVo4NENGSDRzRHpZWW1aK1ZpSXpzeEs1SnBPcXpzYWMNCk5BZGR4UUZPRjVKYUkzZFVyd2o0SlFEdHhNZUVBSkxLakVSYWJwMi91TG9UVENpdE56Vmhkb0o4dk5ZVG5iR3cNCkVtVm9OQWljUWZDWnlWNVREbDZrZGZNSFBvR0wyVk1EWFZodlRRYy9pYlFML2wrM1JJREFyTXNudFUzc1NaQnkNCkM4QytqbU1oZnJEN2ZXTVE1TGZYUEhmWG5lL3JoMGxqDQotLS0tLUVORCBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0NCg | base64

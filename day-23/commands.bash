# Generar llave de nuevo usuario 
openssl genrsa -out sebastian.key 2048

# crear el csr de mi nuevo usuario 
openssl req -new -key sebastian.key -out sebastian.csr -subj "/CN=sebastian"

# crear el archivo csr.yml 
# aplicar los cambios de ese archivo para nuestro usuario 

k apply -f csr.yaml 
k get csr 

# aprovar el certificado desde kubernetes 
k certificate approve sebastian 

# aplicar el binding con el rol 
k apply -f binding.yaml 

# crear el crt 
# eligimos el certificado de ese archivo y lo convertimos en base64
k get csr -o yaml > sebastian.crt
echo "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM5RENDQWR5Z0F3SUJBZ0lRU1hlcVp6Vkc1LzNZQnZmWmNwS1I2REFOQmdrcWhraUc5dzBCQVFzRkFEQVYKTVJNd0VRWURWUVFERXdwcmRXSmxjbTVsZEdWek1CNFhEVEkyTURZeE9URTRNRGcxTWxvWERUSTJNRGN3TXpFNApNRGcxTWxvd0R6RU5NQXNHQTFVRUF4TUVZV1JoYlRDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDCkFRb0NnZ0VCQU9IMWhxMUh1TGtaSFMxdXBLRGo2cTJONENNSnk4ZkJ4NDR1WFk0OEwyUU9hTVNFdHR3MHo3STEKbDNCMUdhN3p0NjBvZVFCOU9EdUVFcDVjWjBXOHJnQjYzTHF3dkdhOWRySEdGSkdFNFdQNnFDMTJGR0dPellKaQpzMGwvbFpWaWxiOFVRTmZOcmxZSmJ0TkZLMUxXOUM5bTRheHZrZjd5Z0NvYmhCdzJJUDJxcC80czZlOHdxSFZDCkRacE9yYldYRkdpcGlhZlcvT2tnLzhoaG43WVN0RmpaaXRFUjRRUFBxWkVycFBCWWRpb1BsbmdvanVYSERKZFUKVnErUjRHR29kdythemdSZ1lhUjhNZjBXWGRVZU5ocUEvRkpoYlZ6SEF1cGFhbmlMTEI5c1V4T21hdWg1WmNxVwpReVdRZ2tSaXVmZWI1U3dtVzN4b1V2cGgyM0JzRzdVQ0F3RUFBYU5HTUVRd0V3WURWUjBsQkF3d0NnWUlLd1lCCkJRVUhBd0l3REFZRFZSMFRBUUgvQkFJd0FEQWZCZ05WSFNNRUdEQVdnQlJkUmdNUE1ONUtWV3Y1RGhSK3ZhTGEKTTdTcy9EQU5CZ2txaGtpRzl3MEJBUXNGQUFPQ0FRRUFDVVdHV2ROR1VVQVhidkVnMVZ1eWtFNXJGSnBpTzFwRgpqTkF2VlBvaE1mQUpHbHhWOE0zS2J4ajJ5bUJjSngyOHd5VGVLNXNROUhSV0JpVFlnUjZOK0dFeUVCMHIveTBVCjhxWmVuUXpVWG84Sk5EZVdvRVVzNVdaWDhVSHdWK05Leks0N1lHczc3QlB0SjcwMXJmckM3UjhkdFFLZGRxTG4KWitBSnloV3gvcnBKRlp4L0tKVFVkWUVMclhDeG5yN3pxTnQwSW9hc1AweG1sZXhzOG1XMXlGdGM1T1gvZk1zSApGekQxbk1Ha0s4d3FseXoxQy9NR29VTHJPa3FTcW9ITG5HNHdGSEIwRXFxb09RUWd4T2k2aHFMLzVvbzZuZ1RTCkpkdW5IVjRzV2dtWUYwZ2ZtYnZsSUhrSEQrOVZTQjdZNDhHMzNZelA0TldLL3pXTDZZdVR4UT09Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K" | base64 -d | tr -d "/n" > sebastian.crt

# utilizar el siguiente comando mejor 
kubectl get csr sebastian -o jsonpath='{.status.certificate}' | base64 -d > sebastian.crt

# crear contexto para el usuario 
k config set-context sebastian --cluster=kind-cka-cluster2 --user=sebastian
# verificar contexto 
k config get-contexts 
# cambiar de contexto 
k config use-context sebastian 

# iniciar sesion
k config set-credentials sebastian --client-key=sebastian.key --client-certificate=sebastian.crt --embed-certs=true

# para obtener correctamente le certificado del usuario firmado mejor utilizar el siguiente comando 
kubectl get csr sebastian -o jsonpath='{.status.certificate}' | % { [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($_)) }

# validar el certificado firmado en powershell 
openssl x509 -in sebastian.crt -noout -subject -dates

# TODO FUNCIONO BIEN comandos luego de estos. 

## leer la documentación de authorization 
# ver el archivo config 
k config view 

# configuración del certificado
curl -k https://localhost:52890/api/v1/namespace/default/pods --key sebasti
an.key --cacert ca.crt --cert sebastian.crt -o yaml 

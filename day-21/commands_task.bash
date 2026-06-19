
# 1. Genera una clave privada PKI y una CSR, y asígnales los nombres «learner.key» y «learner.csr», respectivamente.

openssl genrsa -out learner.key 2048
openssl req -new -key learner.key -out learner.csr -subj "/CN=learner" 





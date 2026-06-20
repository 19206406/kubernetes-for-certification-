## Task 21/40

In this exercise, you to work with TLS certificates in Kubernetes

### Task details
1. Generate a PKI private key and CSR and name it as learner.key and learner.csr
2. Create a CertificateSigningRequest for learner and set the expiration date to 1 week
3. Make sure to use the encoded value of csr in the request field
4. Approve the csr
5. Retrieve the certificate from the CSR
6. Export the issued certificate from the CertificateSigningRequest to a yaml
7. Redirect the certificate value to learner.crt file after decoding it
8. Verify the steps one more time, we will use these details in the next task.

1. Genera una clave privada PKI y una CSR, y asígnales los nombres «learner.key» y «learner.csr», respectivamente. listo 
2. Crea una solicitud de firma de certificado (CSR) para «learner» y establece la fecha de caducidad en 1 semana. listo 
3. Asegúrate de utilizar el valor codificado de «csr» en el campo de solicitud. listo
4. Aprueba la CSR. listo 
5. Recupera el certificado de la CSR. listo 
6. Exporta el certificado emitido desde la solicitud de firma de certificado a un archivo YAML.
7. Redirige el valor del certificado al archivo «learner.crt» tras descodificarlo.
8. Verifica los pasos una vez más; utilizaremos estos datos en la siguiente tarea.
   
10. **Share your learnings**: As this is a sub-task, it will be better if you create the blog of day21 and day22 all together.
11. **Make it public**: Share what you learn publicly on LinkedIn or Twitter.
   - **Tag us and use the hashtag**: Include the following in your post:
     - Tag [@PiyushSachdeva](https://www.linkedin.com/in/piyush-sachdeva) and [@CloudOps Community](https://www.linkedin.com/company/thecloudopscomm) (on both platforms)
     - Use the hashtag **#40daysofkubernetes**
     - **Embed the video**: Enhance your blog post by embedding the video lesson from the Kubernetes series. This will give you visual context and reinforce your written explanations.

## Blog Post Focus 📝

- **Clarity is essential**: Write your blog post clearly and concisely, making it easy for anyone to grasp the concepts, regardless of their prior Kubernetes experience.
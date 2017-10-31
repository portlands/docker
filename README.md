# Portlands Docker Collection
This is a docker image collection, inspired by [AdamBien/docklands](https://github.com/AdamBien/docklands).
It features Alpine Linux based images for Java, JavaScript and HTML5 developers. All portlands images are 
configured with SSL capabilities, this is particularly important if you want to benefit from HTTP/2. 

## SSL


If you want to connect to one of the containers, you need to import the self-signed
 [root ca certificate](pki/ca.crt) in your system setup. It is valid 
 until `2027-12-31 23:59 GMT`. All the containers automatically trust the root certificate.

The container certificate is valid for the following Subject Alternate Names (SAN):

  * `localhost`
  * `*.docker.local`
  * `127.0.0.1` and `::1`
  
So you can easily setup your own DNS or (`/etc/hosts`) records for inter-container
communications via TLS.    

**Security advice:** The default embedded certificates should not be used in production.
The root certificate is kept safe to the best of my abilities, but should only be used
for development and testing purposes. You should *bring your own certificates*, it 
shouldn't be too hard to swap them out in the Dockerfiles.

## Images

### http2
Nginx web server with TLS, HTTP/2 and GZIP compression.
Push content to `${DEPLOYMENT_DIR}`.

The SSL configuration is set rather restrictive, please have a look at the
[server configuration](http2/conf/default.conf). Server headers are disabled.
Requests to port 80 are forwarded to port 443.

Start an instance with:
`docker run -d -p 80:80 -p 443:443 --name http2 portlands/http2`
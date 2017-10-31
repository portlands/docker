# Portlands Docker Collection
This is a lean and pragmatic docker image collection, inspired by [AdamBien/docklands](https://github.com/AdamBien/docklands).
It features Alpine Linux based images for Java, JavaScript and HTML5 developers. All portlands images are 
configured with SSL capabilities, this is particularly important if you want to benefit from HTTP/2.

The images are meant to be extended by the developer. All images provide environment
variables for deployment purposes.

Ready made images can be pulled from [DockerHub](https://hub.docker.com/u/portlands/) .

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

### Nginx HTTP/2 (http2)
Nginx web server with TLS, HTTP/2 and GZIP compression.
Push content to `${DEPLOYMENT_DIR}`.

Image size: 15.3 MB

The SSL configuration is set rather restrictive, please have a look at the
[server configuration](http2/conf/default.conf). Server headers are disabled.
Requests to port 80 are forwarded to port 443.

Start an instance with:
`docker run -d -p 80:80 -p 443:443 --name http2 portlands/http2`

### OpenLiberty MicroProfile (openliberty)
OpenLiberty MicroProfile server with SSL, JPA and EJB enabled. 
Based on the IBM J9 Small Footprint Java Runtime Environment. 
Drop your `war` files into `${DEPLOYMENT_DIR}`.

Image size: 198 MB

Start an instance with:
`docker run -d -p 9080:9080 -p 9443:9443 --name openliberty portlands/openliberty`

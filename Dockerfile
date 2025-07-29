# 1. Use Alpine Linux as the base image
FROM alpine:latest

# 2. Install Apache2 and Git
RUN apk update && \
    apk add --no-cache apache2 git

# 3. Clone the repository
RUN git clone https://github.com/shivakumar-hombal/origin.git /tmp/

# 4. Replace Apache2 index files with files from the cloned repo
# (Assuming the 2 files are in the root of the cloned repo and meant for /var/www/localhost/htdocs/)
RUN rm -rf /var/www/localhost/htdocs/* && \
    cp -r /tmp/* /var/www/localhost/htdocs/

# 5. Expose port 80 (we will map this to host port 8000)
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
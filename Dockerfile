# Pull latest wordpress from official image
FROM wordpress:latest

# Allow sudo commands within container
RUN apt-get update && apt-get -y install sudo

# Install wp-cli within container, move it to allow for "wp" command to be used
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /bin/wp-cli.phar
RUN sudo mv /bin/wp-cli.phar /bin/wp

# Return info - confirms that wp command works
RUN wp --info --allow-root

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
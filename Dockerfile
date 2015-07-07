FROM phusion/passenger-ruby22

# Offload our gems through a container
ENV GEM_HOME /ruby_gems/2.2

ADD docker /build
ADD . /home/app
RUN mv /build/app.conf /etc/nginx/sites-enabled; \
    mv /build/nginx-env.conf /etc/nginx/main.d;  \
    rm -rf /etc/service/nginx/down;              \
    rm /etc/nginx/sites-enabled/default;         \
    mkdir -p /ruby_gems/2.2;                     \
    chown -R app:app /home/app /ruby_gems

VOLUME /ruby_gems/2.2

ENV HOME /home/app
WORKDIR /home/app

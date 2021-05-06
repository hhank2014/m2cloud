FROM centos:7

RUN yum update -y 

RUN yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum -y install http://nginx.org/packages/mainline/centos/7/x86_64/RPMS/nginx-1.19.9-1.el7.ngx.x86_64.rpm && \
    yum install epel-release yum-utils -y && \
    yum-config-manager --enable remi-php74 && \
    yum update -y

RUN yum -y install nginx && \
    yum -y install vim zlib-devel pcre-devel libjpeg-turbo-devel libpng-devel freetype-devel libxml2-devel glibc-devel glib2-devel bzip2-devel ncurses-devel libcurl-devel e2fsprogs-devel krb5-devel openssl-devel  libzip-devel  libxslt-devel && \
    yum -y install php php-fpm php-devel php-common php-embedded php-opcache php-cli php-gd php-gmp php-mbstring php-mysqlnd php-pecl-mcrypt php-pecl-redis5 php-soap php-json php-bcmath php-intl php-xml php-pdo php-pecl-zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/sbin/composer && \
    composer --version

RUN mkdir -p /run/php-fpm && \
    mkdir -p /var/lib/php/session && \
    chown nginx:nginx /run/php-fpm && \
    chown nginx.nginx /var/lib/php/session


RUN yum -y install supervisor

ADD ./supervisord.d/ /etc/supervisord.d/

RUN yum clean all

EXPOSE 9000 80 443

CMD ["supervisord", "-n" , "-c" , "/etc/supervisord.conf"]

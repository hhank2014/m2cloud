v2.2

Installation Guide:

        OS: CentOS 7
        nginx: 1.20.0
        PHP: 7.4.16
        MySQL: 5.7.34
        Redis: 6.x
        ElasticSearch: 7.12

Custom parameter configuration:

        env

        key1=value1
        ...........
        keyn=valuen
        
pre-install:

        sh deploy prenv  (install docker and docker-compose)
        
install:

        sh deplopy [mysql|magento2|all]
        
del docker instance:

        sh deploy [del_mysql|del_magento2|del_all]
        
set Permission:

        sh deploy setPermission

start|stop instances:

        bin/stop|start|restart [mysql|magento2|all]

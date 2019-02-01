# Postgres
## Fedora

    jdbc:postgresql://localhost:5432/postgres

Usuario y contraseña para la version de postgresql local, instalada en fedora 23.

Para instalar la base de datos use el comando:

    sudo dnf install postgresql-server postgresql-contrib pgadmin

Para preparar la base de datos para su ejecución por primera vez:

    sudo postgresql-setup --initdb --unit postgresql

Para inicializar la base de datos:

    sudo systemctl start postgresql

Para comprobar que este corriendo:

    sudo systemctl status postgresql

Para inicializar la base de datos cada vez que inicia el sistema:

    sudo systemctl enable postgresql

En caso de que ya exista el /var/lib/pgsql/data y de un error de inicializacion:

    sudo rm -rf /var/lib/pgsql/data

Para acceder a la consola de postgres:

    su
    su - postgres
    psql

Para poder acceder con el usuario administrador 'postgres' por defecto cambiar la pass una vez dentro de la consola:

    \password

Para crear un usuario, dentro de la consola (no recomendado):

    CREATE USER dsalvio WITH PASSWORD 'Axx2A9inFFEk6muS';

Para crear una base de datos, dentro de la consola:

    CREATE DATABASE instalationTestDB OWNER dsalvio;

Para listar las bases de datos dentro de la consola:

    \l

Para listar todas las tablas dentro de una base de datos en la consola:

    \dt

Para ver la estructura de una tabla cualquiera:
    
    \d cualquiera

Para salir de la terminal de postgres:

    \q

Por defecto hay que configurar el metodo de autenticacion de postgres para permitir conexiones locales mediante usuario y contraseña, por lo cual hay que editar el archivo "/var/lib/pgsql/data/pg_hba.conf" pero eso no se puede hacer dentro de la consola de postgres, asi que hay que salir de la consola o en otra terminal:

    sudo gedit /var/lib/pgsql/data/pg_hba.conf

Hay que modificar la configuración a password siguiente:

    # TYPE  DATABASE        USER            ADDRESS                 METHOD

    # "local" is for Unix domain socket connections only
    local   all             all                                     password
    # IPv4 local connections:
    host    all             all             127.0.0.1/32            password

Para reiniciar el postgres en caso de hacer algun cambio:

    sudo systemctl restart postgresql

Para conectarse a la consola desde cualquier usuario en la terminal:

    psql -h localhost -U postgres

Tutorial: https://www.youtube.com/watch?v=IQ3WeCPo0B4

## Manjaro

    pg_ctl -D /var/lib/postgres/data -l logfile start
You can now start the database server using:

    sudo pacman -Sy postgresql pgadmin3
    su
    su - postgres
    sudo systemctl start postgresql

usuario: `postgres`

pass: 

https://www.youtube.com/watch?v=YyAEho7sDro
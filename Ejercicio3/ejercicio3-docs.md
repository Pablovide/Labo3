## Instalación Contenedor SQL Server 2019

Descargar imagen MSSQLServer
```
$ docker pull mcr.microsoft.com/mssql/server:2019-latest	
```

Ejecutar contenedor 
```
$ docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Pa$$w0rd" `
   -p 1433:1433 --name sql1 -h sql1 `
   -d mcr.microsoft.com/mssql/server:2019-latest
```

Listar contenedores
```
$ docker ps -a
```
| CONTAINER ID | IMAGE                                      | COMMAND                 | CREATED   | STATUS   | PORTS                  | NAMES |
|--------------|--------------------------------------------|-------------------------|-----------|----------|------------------------|-------|
| f625f46d9e8a | mcr.microsoft.com/mssql/server:2019-latest | "opt/mssql/bin/perm..." | 1 min ago | Up 1 min | 0.0.0.0:1433->1433/tcp | sql1  |


## Conexión a través de Azure Data Studio

Tomamos "CONTAINER ID" de la imagen (f625f46d9e8a)*

Iniciamos el contenedor(si no está up)
```
$ docker start f625f46d9e8a
```

Inspeccionamos el contenedor para encontrar en las variables de entorno el puerto y la contraseña
```
$ docker inspect f625f46d9e8a
```

```json
"Env": [
                "ACCEPT_EULA=Y",
                "SA_PASSWORD=\u003cYourStrong@Passw0rd\u003e",
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],

"Ports": {
                "1433/tcp": [
                    {
                        "HostIp": "0.0.0.0",
                        "HostPort": "1433"
                    }
                ]
            },
```

### En Azure Data Studio

Establecemos nueva conexión:


 - Connection Details
Connection type: Microsoft SQL Server

- Server:  localhost, 1433

- Authentication type: SQL Login
User name: sa
Password: Pa$$w0rd

- Name(optional): LAB3

- Connect





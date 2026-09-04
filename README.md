# <img src="https://gitlab.archlinux.org/uploads/-/system/group/avatar/23/iconfinder_archlinux_386451.png?width=48" width="32"> Fuciones Básicas - Arch Linux

Herramienta interactiva escrita en **Bash** para realizar diferentes comprobaciones y consultas básicas sobre un sistema **Arch Linux**.

El script proporciona un menú desde el que se pueden consultar paquetes, comprobar binarios, verificar privilegios, comprobar la conectividad de red, consultar el UID del usuario y obtener un ranking de los comandos más utilizados.

## Características

El script incluye las siguientes funciones:

| Opción | Función            | Descripción                                                 |
| -----: | ------------------ | ----------------------------------------------------------- |
|      0 | Salir              | Finaliza la ejecución del script                            |
|      1 | Buscar paquete     | Obtiene el paquete propietario de un binario                |
|      2 | Paquete instalado  | Comprueba si un paquete está instalado                      |
|      3 | Paquete disponible | Comprueba si un paquete está disponible en los repositorios |
|      4 | Comprobar root     | Comprueba si el usuario actual es `root`                    |
|      5 | Comprobar conexión | Comprueba la conectividad mediante `ping`                   |
|      6 | Comprobar binario  | Comprueba si un binario existe en el `PATH`                 |
|      7 | Contar parámetros  | Cuenta los parámetros introducidos                          |
|      8 | Ayuda              | Muestra la ayuda del script                                 |
|      9 | UID                | Muestra el UID del usuario actual                           |
|     10 | Ranking            | Muestra los 10 comandos más utilizados                      |

## Requisitos

El script está diseñado para sistemas **Arch Linux** y utiliza herramientas disponibles habitualmente en una instalación estándar.

### Dependencias

* Bash
* pacman
* awk
* ping
* command
* sort
* uniq
* head
* tput

El script utiliza principalmente `pacman` para realizar las consultas relacionadas con paquetes.

## Instalación

Clona el repositorio:

```bash
git clone https://github.com/ElLucaMx/fuciones-basicas.git
```

Accede al directorio:

```bash
cd fuciones-basicas
```

Concede permisos de ejecución:

```bash
chmod +x "fuciones basicas.sh"
```

## Uso

Ejecuta el script:

```bash
./"fuciones basicas.sh"
```

También puedes ejecutarlo directamente mediante Bash:

```bash
bash "fuciones basicas.sh"
```

Una vez iniciado, aparecerá un menú interactivo desde el que podrás seleccionar la operación que quieras realizar.

## Ejemplo

Al iniciar el programa se muestra un menú similar a:

```text
==================================================
  0.  Para salir del script
  1.  Para buscar el paquete al que pertenece el binario
  2.  Para saber si el paquete está instalado
  3.  Para saber si el paquete se encuentra en los repositorios
  4.  Para saber si estás ejecutando el script como root
  5.  Para comprobar si hay conexion
  6.  Para saber si el binario está instalado
  7.  Para contar los parametros añadidos
  8.  Para obtener la ayuda de este script
  9.  Para saber tu UID
  10. Top 10 de los comandos más utilizados
==================================================
```

## Funciones principales

### Buscar el paquete propietario de un binario

Utiliza `pacman -Qo` para determinar qué paquete proporciona un determinado binario.

Por ejemplo:

```text
Escribe el nombre del paquete
- bash

El paquete es: bash
```

### Comprobar si un paquete está instalado

Utiliza `pacman -Qi` para comprobar si un paquete está instalado actualmente.

### Comprobar disponibilidad de un paquete

Utiliza `pacman -Si` para comprobar si un paquete está disponible en los repositorios configurados.

### Comprobar privilegios

Permite determinar si el script se está ejecutando como `root`.

### Comprobar conexión

Realiza varias peticiones `ping` contra `8.8.8.8` para comprobar la conectividad.

### Comprobar binarios

Utiliza `command -v` para comprobar si un determinado comando o binario está disponible en el `PATH`.

### Contar parámetros

Permite introducir varios parámetros separados por espacios y muestra cuántos han sido introducidos.

### Consultar UID

Muestra el UID correspondiente al usuario que está ejecutando el script.

### Ranking de comandos

Consulta el historial de Bash del usuario y muestra los 10 comandos que aparecen con mayor frecuencia.

## Estructura

El script está organizado en diferentes zonas:

```text
fuciones basicas.sh
│
├── Información
├── Colores
├── Variables
├── Funciones
│   ├── f_menu
│   ├── f_buscar_paquetes
│   ├── f_paquete_instalado
│   ├── f_paquete_disponible
│   ├── f_eres_root
│   ├── f_hay_conexion
│   ├── f_bin_instalado
│   ├── f_parametros
│   ├── f_ayuda
│   ├── f_uid
│   ├── f_ranking_comandos
│   ├── f_inicio_script
│   └── f_banner
└── Ejecución
```

## Tecnologías

* Bash
* Arch Linux
* pacman
* GNU/Linux utilities

## Estado del proyecto

Proyecto en desarrollo.

Actualmente el script está enfocado en proporcionar una colección sencilla de funciones y comprobaciones útiles para la administración básica de sistemas Arch Linux.

Se pueden añadir nuevas funciones y mejorar las existentes progresivamente.

## Autor

**ElLucaMx**

GitHub:

https://github.com/ElLucaMx

#!/bin/bash

# =========
# Información
# =========

# Git-Hub: https://github.com/ElLucaMx?tab=repositories
# Creador: ElLucaMx
# Fecha creación: 2/9/2026
# Última modificación: 3/9/26
# Web: (Próximamente)


# =========
# Zona de colores
# =========

# Tonos Normales
NEGRO=$'\e[30m'
ROJO=$'\e[31m'
VERDE=$'\e[32m'
AMARILLO=$'\e[33m'
AZUL=$'\e[34m'
MAGENTA=$'\e[35m'
CIAN=$'\e[36m'
BLANCO=$'\e[37m'

# Tonos Intensos
GRIS=$'\e[90m'
ROJO_BRILLANTE=$'\e[91m'
VERDE_BRILLANTE=$'\e[92m'
AMARILLO_BRILLANTE=$'\e[93m'
AZUL_BRILLANTE=$'\e[94m'
MAGENTA_BRILLANTE=$'\e[95m'
CIAN_BRILLANTE=$'\e[96m'

# Reset
RESET=$'\e[0m'

# =========
# Zona de variables
# =========

# =========
# Zona de funciones
# =========

f_menu () {
    clear
    cat << EOF
==================================================
    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
    ████╗ ████║██╔════╝████╗  ██║██║   ██║
    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝
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
EOF
    read -p "Elige una opción: " opcion

# Salir del script
    if [ $opcion -eq 0 ]; then
        echo "=================================================="
        echo "Finalizando script"
        exit 0
# Opción 1 del menu
    elif [ $opcion -eq 1 ]; then
        cat << EOF
==================================================
 Escribe el nombre del paquete
==================================================
EOF
    read -p "- " paquete
    f_buscar_paquetes "$paquete"
# Opción 2 del menu
    elif [ $opcion -eq 2 ]; then
        cat << EOF
==================================================
 Escribe el nombre del paquete
==================================================
EOF
    read -p "- " paquete
    f_paquete_instalado "$paquete"
# Opción 3 del menu
    elif [ $opcion -eq 3 ]; then
        cat << EOF
==================================================
 Escribe el nombre del paquete
==================================================
EOF
    read -p "- " paquete
    f_paquete_disponible "$paquete"
# Opción 4 del menu
    elif [ $opcion -eq 4 ]; then

    f_eres_root
# Opción 5 del menu
    elif [ $opcion -eq 5 ]; then

    f_hay_conexion
# Opción 6 del menu
    elif [ $opcion -eq 6 ]; then
        cat << EOF
==================================================
 Escribe el nombre del binario
==================================================
EOF
    read -p "- " binario
        f_bin_instalado "$binario"
# Opción 7 del menu
    elif [ $opcion -eq 7 ]; then
        cat << EOF
==================================================
 Escribe los parámetros (separados por espacios)
==================================================
EOF
        read -p "- " mis_parametros
        f_parametros $mis_parametros
# Opción 8 del menu
    elif [ $opcion -eq 8 ]; then
    f_ayuda

# Opción 9 del menu
    elif [ $opcion -eq 9 ]; then
    f_uid
# Opción 10 del menu
    elif [ $opcion -eq 10 ]; then
    f_ranking_comandos
# Ninguna opcion
    else
        clear
        echo "Opción no válida"
        sleep 2
        clear
        f_menu "$1"
    fi

    echo "=================================================="
    read -p "Pulsa Enter para volver al menú principal..."
    f_menu "$1"
}

f_buscar_paquetes () {

    paquete=$(pacman -Qo /usr/bin/$1 2>/dev/null | awk '{print $5}')

    if [ -n "$paquete" ]; then
        echo "=================================================="
        echo "El paquete es: $paquete"
    else
        echo "=================================================="
        echo "Binario no disponible "
    fi
}


f_paquete_instalado () {
    if pacman -Qi $1 > /dev/null 2>&1; then
        echo "=================================================="
        echo "Instalado"
        return 0
    else
        echo "=================================================="
        echo "No instalado"
        return 1
    fi
}

f_paquete_disponible () {
    if pacman -Si $1 > /dev/null 2>&1; then
        echo "=================================================="
        echo "Disponible"
        return 0
    else
        echo "=================================================="
        echo "No Disponible"
        return 1
    fi
}

f_eres_root () {
    if [ $UID -eq 0 ]; then
        echo "=================================================="
        echo "Eres root"
        return 0
    else
        echo "=================================================="
        echo "No eres root"
        return 1
    fi
}

f_hay_conexion () {

    if ping -c 5 8.8.8.8 > /dev/null 2>&1; then
        echo "=================================================="
        echo "Hay conexion"
        return 0
    else
        echo "=================================================="
        echo "No hay conexion"
        return 1
    fi
}

f_bin_instalado () {
    if command -v $1 > /dev/null 2>&1; then
        echo "=================================================="
        echo "Existe"
        return 0
    else
        echo "=================================================="
        echo "No existe"
        return 1
    fi
}

f_parametros () {
    if [ $# -eq 0 ]; then
        echo "=================================================="
        echo "Error: No se ha introducido ningún parámetro."
        return 1
    else
        echo "=================================================="
        echo "Se han introducido $# parámetros correctamente."
        return 0
    fi
}

f_ayuda () {
    cat << "EOF"
==================================================
 AYUDA DEL SCRIPT - ADMINISTRACIÓN ARCH LINUX
==================================================
 Descripción:
 Herramienta modular interactiva diseñada para
 la gestión y el análisis del sistema en Arch Linux.

 Modo de uso:
 Ejecuta el script directamente para abrir el menú:
 $ ./fuciones_basicas.sh

 Resumen de opciones del menú:
  0. Salir de la aplicación.
  1. Buscar el paquete propietario de un binario (-Qo).
  2. Verificar si un paquete está instalado (-Qi).
  3. Consultar disponibilidad en repositorios (-Si).
  4. Comprobar privilegios de superusuario (root).
  5. Testear la conectividad a internet (ping).
  6. Comprobar la existencia de binarios en el PATH.
  7. Contar parámetros introducidos dinámicamente.
  8. Mostrar este panel de ayuda.
  9. Mostrar el UID del usuario actual.
 10. Generar el Top 10 de comandos más usados.
EOF
}

f_uid () {
    echo "=================================================="
    echo "El UID del usuario actual es: $UID"
}

f_ranking_comandos () {
    echo "=================================================="
    echo "Los comandos más utilizados son: "
    sort $HOME/.bash_history | uniq -c | sort -nr | head --lines 10
}

f_inicio_script () {
    echo "=================================================="
    echo  "Iniciando ejecución del script"
    echo "=================================================="
    f_banner
    f_menu "$1"
}

f_banner () {
    clear
    # 1. Guardamos el banner en un array (matriz) línea por línea
    local banner=(
        "███████╗██╗     ██╗     ██╗   ██╗ ██████╗ █████╗ ███╗   ███╗██╗  ██╗"
        "██╔════╝██║     ██║     ██║   ██║██╔════╝██╔══██╗████╗ ████║╚██╗██╔╝"
        "█████╗  ██║     ██║     ██║   ██║██║     ███████║██╔████╔██║ ╚███╔╝"
        "██╔══╝  ██║     ██║     ██║   ██║██║     ██╔══██║██║╚██╔╝██║ ██╔██╗"
        "███████╗███████╗███████╗╚██████╔╝╚██████╗██║  ██║██║ ╚═╝ ██║██╔╝ ██╗"
        "╚══════╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝"
    )

    local ancho_banner=76
    local alto_banner=6

    # 2. Obtenemos las dimensiones actuales de la terminal
    local cols=$(tput cols)
    local filas=$(tput lines)

    # 3. Calculamos la coordenada exacta para centrarlo
    local pos_x=$(( (cols - ancho_banner) / 2 ))
    local pos_y=$(( (filas - alto_banner) / 2 ))

    tput civis # Oculta el cursor temporalmente para evitar parpadeos sucios

    # 4. Bucle que avanza columna a columna (de izquierda a derecha)
    for (( c=0; c<ancho_banner; c++ )); do
        for (( r=0; r<alto_banner; r++ )); do
            # Extrae un único carácter en la posición exacta [fila, columna]
            local char="${banner[r]:c:1}"

            # Mueve el cursor a esa coordenada y pinta la pieza
            tput cup $((pos_y + r)) $((pos_x + c))
            echo -ne "${AZUL_BRILLANTE}${char}${RESET}"
        done
        # Pequeña pausa para generar la animación
        sleep 0.02
    done

    tput cnorm # Devuelve la visibilidad al cursor
    tput cup $filas 0 # Mueve el cursor al fondo del todo
    sleep 1
    clear
}

# =========
# Zona de ejecución
# =========
f_inicio_script

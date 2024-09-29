#!/bin/bash

# Colores para el menú
ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[0;33m'
AZUL='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BLANCO='\033[0;37m'
RESET='\033[0m'

# Función para mostrar el menú
mostrar_menu() {
  clear
  echo -e "${AMARILLO}------------------------------------${RESET}"
  echo -e "${AMARILLO}  ${CYAN}services-menu.sh${AMARILLO}  ${RESET}"
  echo -e "${AMARILLO}------------------------------------${RESET}"
  echo -e "${VERDE}1.${RESET} Listar contenido de un fichero (carpeta)"
  echo -e "${VERDE}2.${RESET} Crear un archivo de texto"
  echo -e "${VERDE}3.${RESET} Comparar dos archivos de texto"
  echo -e "${VERDE}4.${RESET} Ejemplo de uso de awk"
  echo -e "${VERDE}5.${RESET} Ejemplo de uso de grep"
  echo -e "${VERDE}0.${RESET} Salir"
  echo -e "${AMARILLO}------------------------------------${RESET}"
  echo -e "${AZUL}Ingrese una opción:${RESET}"
}

# Función para listar el contenido de un fichero
listar_contenido() {
  read -p "Ingrese la ruta absoluta al fichero (carpeta): " ruta
  if [[ -d "$ruta" ]]; then
    ls -l "$ruta"
  elif [[ -f "$ruta" ]]; then
    echo -e "${ROJO}Error: La ruta especificada es un archivo, no una carpeta.${RESET}"
  else
    echo -e "${ROJO}Error: La ruta especificada no existe.${RESET}"
  fi
}

# Función para crear un archivo de texto
crear_archivo() {
  read -p "Ingrese la cadena de texto: " texto
  echo -e "${MAGENTA}---El nombre puede incluir la ruta absoluta, o relativa ---${RESET}"
  read -p "Ingrese el nombre del archivo: " nombre_archivo
  if echo "$texto" > "$nombre_archivo"; then
    echo -e "${VERDE}Archivo creado exitosamente.${RESET}"
  else
    echo -e "${ROJO}Error al crear el archivo.${RESET}"
  fi
}

# Función para comparar dos archivos de texto
comparar_archivos() {
  read -p "Ingrese la ruta al primer archivo: " archivo1
  read -p "Ingrese la ruta al segundo archivo: " archivo2
  if [[ -f "$archivo1" && -f "$archivo2" ]]; then
    diff "$archivo1" "$archivo2"
    if [[ $? -eq 0 ]]; then
      echo -e "${CYAN}Los archivos son iguales.${RESET}"
    else
      echo -e "${ROJO}Los archivos son diferentes.${RESET}"
    fi
  else
    echo -e "${ROJO}Error: Uno o ambos archivos no existen.${RESET}"
  fi
}

# Función para ejecutar un comando directamente
ejecutar_comando() {
  comando="$1"
  echo -e "${AZUL}Ejecutando comando: $comando${RESET}"
  echo -e "${AMARILLO}-----------------------------------${RESET}"
  eval "$comando"
  echo -e "${AMARILLO}-----------------------------------${RESET}"
}

# Función para mostrar el uso de awk
ejemplo_awk() {
  echo -e "${MAGENTA}Ejemplo de uso de awk:${RESET}"
  read -p "Ingrese la ruta al archivo: " archivo
  if [[ -f "$archivo" ]]; then
    ejecutar_comando "awk '{print \$1}' $archivo"
    echo "  # Imprime la primera columna del archivo"
    ejecutar_comando "awk '{sum += \$2} END {print sum}' $archivo"
    echo "  # Suma los valores de la segunda columna del archivo"
  else
    echo -e "${ROJO}Error: El archivo no existe.${RESET}"
  fi
}


# Función para mostrar el uso de grep con opción de búsqueda recursiva
ejemplo_grep() {
  echo -e "${MAGENTA}Ejemplo de uso de grep:${RESET}"
  read -p "Ingrese la ruta al archivo o directorio: " ruta
  if [[ -e "$ruta" ]]; then
    read -p "Ingrese la palabra a buscar: " palabra
    read -p "¿Desea realizar una búsqueda recursiva? (s/n): " recursiva
    if [[ "$recursiva" == "s" ]]; then
      ejecutar_comando "grep -r '$palabra' $ruta"
    else
      ejecutar_comando "grep '$palabra' $ruta"
    fi
    echo -e "${ROJO} ^ ${RESET}"
    echo " | Busca la palabra '$palabra' en el archivo o directorio"
  else
    echo -e "${ROJO}Error: El archivo o directorio no existe.${RESET}"
  fi
}

# Bucle principal del menú con validación de opción
while true; do
  mostrar_menu
  read opcion
  if [[ "$opcion" =~ ^[0-5]$ ]]; then
    case $opcion in
      1) listar_contenido ;;
      2) crear_archivo ;;
      3) comparar_archivos ;;
      4) ejemplo_awk ;;
      5) ejemplo_grep ;;
      0) echo -e "${CYAN}Saliendo...${RESET}"; break ;;
    esac
  else
    echo -e "${ROJO}Opción inválida.${RESET}"
  fi
  read -p "Presione Enter para continuar..."
done


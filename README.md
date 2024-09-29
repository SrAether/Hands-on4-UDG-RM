# 🛠️ **Services Menu Script** #

#![Bash](https://img.shields.io/badge/Bash-Script-blue.svg) ![License](https://img.shields.io/badge/License-MIT-green.svg)#

Este proyecto es un script de Bash interactivo que proporciona una serie de herramientas útiles para gestionar ficheros y realizar operaciones como listar archivos, crear archivos de texto, comparar archivos, y ejemplos prácticos de comandos como `awk` y `grep`.

---

# 🚀 **Características** #

- 📂 **Listar Contenido**: Visualiza el contenido de una carpeta.
- 📝 **Crear Archivo**: Crea un archivo de texto desde la terminal.
- 🗂️ **Comparar Archivos**: Compara dos archivos de texto usando `diff`.
- 📊 **Ejemplo de `awk`**: Muestra ejemplos del comando `awk`, como imprimir columnas y sumar valores.
- 🔎 **Ejemplo de `grep`**: Realiza búsquedas de palabras en archivos o directorios, con opción de búsqueda recursiva.

---

# 📋 **Uso** #

1. Clona este repositorio:

   ```bash
   git clone https://github.com/SrAether/Hands-on4-UDG-RM.git
   ```

2. Navega al directorio del script:

   ```bash
   cd Hands-on4-UDG-RM
   ```

3. Asigna permisos de ejecución al script:

   ```bash
   chmod +x services-menu.sh
   ```

4. Ejecuta el script:

   ```bash
   ./services-menu.sh
   ```

---

# 📂 **Estructura del Menú** #

El menú principal ofrece las siguientes opciones:

```bash
1. Listar contenido de un fichero (carpeta)
2. Crear un archivo de texto
3. Comparar dos archivos de texto
4. Ejemplo de uso de awk
5. Ejemplo de uso de grep
0. Salir
```

---

# ⚡ **Requisitos** #

- [Bash](https://www.gnu.org/software/bash/) (versión 4.0 o superior)
- Sistema Operativo Linux (Probado en distribuciones basadas en Arch)

---

# 📚 **Ejemplos de Uso** #

### 🔎 **Buscar con `grep`**

Puedes buscar una palabra en un archivo o directorio con la opción de realizar una búsqueda recursiva:

```bash
Ingrese la palabra a buscar: example
¿Desea realizar una búsqueda recursiva? (s/n): s
```

### 📊 **Usar `awk`**

Muestra la primera columna de un archivo o suma los valores de la segunda columna:

```bash
awk '{print $1}' archivo.txt
awk '{sum += $2} END {print sum}' archivo.txt
```


---

### 📧 **Contacto**

Si tienes alguna duda o sugerencia, puedes contactarme en: sraether@proton.me

---

¡Gracias por utilizar este script! 😊

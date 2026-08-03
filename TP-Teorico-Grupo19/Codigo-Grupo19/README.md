# Guía de Compilación y Ejecución Optimizada

Este proyecto contiene implementaciones de algoritmos de ordenamiento en **Haskell** y **F#**. 

Aquí se explica cómo compilar y ejecutar cada uno de ellos con las máximas optimizaciones de rendimiento, para que la diferencia de rendimiento se deba lo mas posible al lenguaje en si.

---

## Archivos del Proyecto
* **Haskell:**
  * [quicksort.hs](quicksort.hs) - Implementación de Quicksort con pruebas de rendimiento.
  * [bubblesort.hs](bubblesort.hs) - Implementación de Bubble Sort con pruebas de rendimiento.
* **F#:**
  * [script.fsx](script.fsx) - Script interactivo de Quicksort (in-place) con pruebas de rendimiento.
  * [bubblesort.fsx](bubblesort.fsx) - Script interactivo de Bubble Sort (in-place) con pruebas de rendimiento.

---

## Requisitos Previos

1. **GHC (Glasgow Haskell Compiler):** Necesario para compilar los archivos de Haskell (`.hs`).
   * Comprueba tu instalación ejecutando: `ghc --version`
2. **.NET SDK:** Necesario para ejecutar y compilar los archivos de F# (`.fsx` y proyectos `.fsproj`).
   * Comprueba tu instalación ejecutando: `dotnet --version`

---

## 1. Haskell (`quicksort.hs` y `bubblesort.hs`)

Para compilar archivos de Haskell de forma optimizada y generar un ejecutable nativo compilado, utilizamos GHC con el flag de optimización `-O2`.

### Compilación Optimizada
Ejecuta los siguientes comandos en tu terminal:

```bash
# Compilar Quicksort con optimizaciones -O2
ghc -O2 quicksort.hs -o quicksort_hs

# Compilar Bubble Sort con optimizaciones -O2
ghc -O2 bubblesort.hs -o bubblesort_hs
```

* **`-O2`**: Aplica optimizaciones agresivas del compilador (fusión de bucles, especialización, inlining, etc.) para maximizar la velocidad de ejecución.
* **`-o <nombre>`**: Especifica el nombre del archivo ejecutable de salida (en Windows se agregará automáticamente la extensión `.exe`).

### Ejecución
Una vez compilados, ejecuta los binarios directamente:
* En **Windows**:
  ```powershell
  .\quicksort_hs.exe
  .\bubblesort_hs.exe
  ```
  
---

## 2. F# (`script.fsx` y `bubblesort.fsx`)

Los archivos `.fsx` son scripts interactivos de F#. Se pueden ejecutar de forma directa con F# Interactive o compilarse a binarios optimizados creando un proyecto de consola de .NET.

### Opción B: Compilación a un Ejecutable de Consola (Recomendado)
Para compilar el código F# en un binario de producción altamente optimizado (modo `Release`), la práctica estándar en .NET es crear un proyecto de consola.

Sigue estos pasos para compilar cada archivo de forma independiente:

#### Para Quicksort (`script.fsx`):
1. Crea un nuevo proyecto de consola de F#:
   ```bash
   dotnet new console -lang "F#" -o fsharp_quicksort
   ```
2. Copia el contenido de `script.fsx` reemplazando el archivo `Program.fs` generado en el proyecto:
   ```powershell
   copy script.fsx fsharp_quicksort\Program.fs
   ```
3. Compila y ejecuta en modo **Release** (que activa optimizaciones completas y remueve símbolos de depuración innecesarios):
   ```bash
   cd fsharp_quicksort
   dotnet run -c Release
   ```

#### Para Bubble Sort (`bubblesort.fsx`):
1. Crea un nuevo proyecto de consola de F#:
   ```bash
   dotnet new console -lang "F#" -o fsharp_bubblesort
   ```
2. Copia el contenido de `bubblesort.fsx` reemplazando el archivo `Program.fs` generado en el proyecto:
   ```powershell
   copy bubblesort.fsx fsharp_bubblesort\Program.fs
   ```
3. Compila y ejecuta en modo **Release**:
   ```bash
   cd fsharp_bubblesort
   dotnet run -c Release
   ```

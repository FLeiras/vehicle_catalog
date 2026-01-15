# Vehicle Catalog – Flutter Challenge

Mini aplicación mobile desarrollada en Flutter como parte de un challenge técnico.
El objetivo es demostrar arquitectura clara, buenas prácticas, manejo de estados,
errores y testing, dentro de un tiempo acotado.

---

## 🧩 Contexto

La aplicación representa un módulo simplificado de un DMS (Dealer Management System),
permitiendo visualizar un catálogo de vehículos con un flujo Lista → Detalle.

La solución está pensada para ser escalable y alineada a aplicaciones empresariales,
priorizando claridad, mantenibilidad y experiencia de usuario.

---

## 🏗️ Arquitectura

Se implementa una **Clean Architecture simplificada**, separando responsabilidades
en tres capas principales:

### Presentation

- UI (pages y widgets)
- Manejo de estado mediante `ChangeNotifier` + `Provider`
- Renderizado de estados: loading / error / success

### Domain

- Entidades de negocio (`Vehicle`)
- Contrato del repositorio (`VehicleRepository`)
- Caso de uso (`GetVehicles`)

### Data

- Fuente de datos local simulando una API (`VehicleLocalDataSource`)
- Implementación concreta del repositorio (`VehicleRepositoryImpl`)
- Modelos y parseo de JSON

Esta separación permite que la UI no dependa de detalles de implementación
ni de la fuente de datos.

---

## 🔁 Inversión de dependencias

Las dependencias se resuelven en el punto más alto de la aplicación (`main.dart`),
inyectando el repositorio dentro del provider.

Esto permite:

- Cambiar la fuente de datos sin afectar la UI
- Facilitar testing
- Mantener bajo acoplamiento

---

## 📡 Fuente de datos (Mock API)

Los datos se obtienen desde un archivo JSON local (`assets/vehicles.json`),
simulando una API REST (`GET /vehicles`).

Se agrega una latencia artificial para representar un escenario real de red.
Esto permite trabajar estados de carga y error sin depender de internet.

---

## 📱 Funcionalidades implementadas

### 📋 Listado de vehículos

- Imagen
- Marca
- Modelo
- Año
- Precio

### 🔍 Búsqueda / filtrado

- Filtrado en memoria por **marca o modelo**
- Actualización en tiempo real
- Solución simple, suficiente para el volumen esperado en el challenge

### 📄 Detalle de vehículo

- Imagen destacada
- Información expandida:
  - Color
  - Transmisión
  - Kilometraje
  - Año
  - Precio

---

## ⏳ Manejo de estados

La aplicación contempla los siguientes estados:

- **Loading**: indicador visual mientras se obtienen los datos
- **Success**: renderizado del listado o detalle
- **Error**: mensaje visible al usuario con opción de reintento

Esto garantiza feedback constante y una experiencia de usuario clara.

---

## 🖼️ Manejo de imágenes

Las URLs de imágenes incluidas en el JSON son de ejemplo (mock).

Por este motivo:

- Se intenta cargar la imagen remota
- Si falla, se utiliza un **fallback a imágenes locales**
- En última instancia, se muestra un ícono representativo

Esto evita errores visuales y asegura consistencia en la UI sin depender de red.

---

## 🧪 Tests

Se incluye un **test unitario** sobre una pieza crítica del sistema:

- Parseo del modelo `VehicleModel` desde JSON
- Validación de tipos y valores esperados

Este test asegura la correcta transformación de datos y demuestra
criterio de testing dentro del tiempo disponible.

Ejecutar tests:

```bash
flutter test
```

Cómo ejecutar:

```bash
flutter pub get
flutter run
```

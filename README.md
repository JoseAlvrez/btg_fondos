# BTG Fondos - Gestión de Fondos FPV/FIC

Aplicación web interactiva y responsiva para la gestión de fondos de inversión (FPV/FIC) desarrollada con Flutter. La aplicación permite a los usuarios visualizar, suscribirse y gestionar sus fondos de inversión.

##  Características

-  Visualización de fondos de inversión disponibles
-  Suscripción a fondos
-  Cancelación de suscripciones
-  Historial de transacciones
-  Interfaz responsiva (móvil, tablet, web)

##  Tecnologías

### Framework Principal

- **Flutter** `^3.11.3` - Framework de UI multiplataforma
- **Dart** - Lenguaje de programación

### Gestión de Estado

- **flutter_riverpod** `^3.3.1` - Gestión reactiva de estado y dependency injection
  - Providers para inyección de dependencias
  - Notifiers para lógica de estado compleja

### UI/Diseño

- **Material Design** - Diseño siguiendo guías de Material
- **google_fonts** `^8.0.2` - Tipografía personalizada de Google Fonts

### Internacionalización y Localización

- **intl** `^0.20.2` - Soporte para múltiples idiomas y formatos de fecha/hora
- Configuración de localización para español colombiano (es_CO)

### Utilidades

- **uuid** `^4.5.3` - Generación de identificadores únicos
- **equatable** `^2.0.8` - Simplificación de comparación de objetos Dart

##  Metodologías y Arquitectura

### Arquitectura: Clean Architecture

El proyecto implementa **Clean Architecture** dividido en tres capas:

#### 1. **Presentation Layer** (Capa de Presentación)

```
presentation/
├── atoms/           # Componentes UI básicos
├── molecules/       # Componentes compuestos
├── organisms/       # Componentes complejos
├── pages/          # Páginas completas
├── providers/      # Riverpod providers
├── notifiers/      # Notifiers para state management
└── state/          # Modelos de estado
```

- Gestiona la UI y la interacción del usuario
- Utiliza Riverpod para state management
- Componentes reutilizables y modulares

#### 2. **Domain Layer** (Capa de Dominio)

```
domain/
├── entities/       # Modelos de dominio (entidades)
├── enums/         # Enumeraciones
├── exceptions/    # Excepciones personalizadas
├── repositories/  # Interfaces/Contracts
└── usecases/      # Casos de uso
```

- Contiene la lógica de negocio central
- Independiente de frameworks y detalles de implementación
- Define contratos mediante interfaces

#### 3. **Data Layer** (Capa de Datos)

```
data/
├── datasources/   # Fuentes de datos (local, remota)
├── models/        # Modelos de datos (DTOs)
└── repositories/  # Implementación de repositorios
```

- Implementa acceso a datos
- Conversión de modelos entre capas
- Inyección de dependencias

### Principios SOLID

- **S**ingle Responsibility: Cada clase tiene una única responsabilidad
- **O**pen/Closed: Abierto para extensión, cerrado para modificación
- **L**iskov Substitution: Interfaces bien definidas
- **I**nterface Segregation: Interfaces pequeñas y específicas
- **D**ependency Inversion: Inyección de dependencias con Riverpod

### Patrones Implementados

- **Repository Pattern**: Abstracción del acceso a datos
- **Provider Pattern**: Inyección de dependencias con Riverpod
- **Use Case Pattern**: Encapsulación de la lógica de negocio
- **State Management**: Riverpod Notifiers para estado reactivo

##  Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

- **Flutter SDK**: `^3.11.3`
  - Descarga desde: https://flutter.dev/docs/get-started/install
- **Dart SDK**: Incluido con Flutter

- **Git** - Para control de versiones

### Verificar instalación de Flutter

```bash
flutter doctor
```

Este comando verifica que Flutter esté correctamente instalado y configurado.

##  Instalación

### Paso 1: Clonar el repositorio

```bash
git clone <url-del-repositorio>
cd btg_fondos
```

### Paso 2: Descargar dependencias

```bash
flutter pub get
```

Este comando instala todas las dependencias declaradas en `pubspec.yaml`.

```
## 🚀 Ejecución

### Ejecutar en modo Debug

```bash
flutter run
```

Para seleccionar dispositivo específico:

```bash
flutter run -d <device-id>
```

Listar dispositivos disponibles:

```bash
flutter devices
```

### Ejecutar en dispositivos específicos

#### Web

```bash
flutter run -d chrome
# o
flutter run -d web-server
```

### Compilar para Producción

#### Web

```bash
flutter build web --release
```

##  Estructura del Proyecto

```
btg_fondos/
├── lib/
│   ├── main.dart                    # Entrada de la aplicación
│   ├── core/                        # Carpeta de configuración general
│   │   ├── constants/               # Constantes de la app
│   │   ├── theme/                   # Temas, colores y tipografía
│   │   ├── utils/                   # Utilidades generales
│   │   └── widgets/                 # Widgets reutilizables
│   ├── data/                        # Capa de datos
│   │   ├── datasources/             # Fuentes de datos
│   │   ├── models/                  # Modelos DTOs
│   │   └── repositories/            # Implementación de repositorios
│   ├── domain/                      # Capa de dominio
│   │   ├── entities/                # Entidades del negocio
│   │   ├── enums/                   # Enumeraciones
│   │   ├── exceptions/              # Excepciones personalizadas
│   │   ├── repositories/            # Interfaces de repositorios
│   │   └── usecases/                # Casos de uso
│   └── presentation/                # Capa de presentación
│       ├── atoms/                   # Componentes UI básicos
│       ├── molecules/               # Componentes compuestos
│       ├── organisms/               # Componentes complejos
│       ├── pages/                   # Páginas de la app
│       ├── providers/               # Riverpod providers
│       ├── notifiers/               # State notifiers
│       ├── state/                   # Modelos de estado
│       └── utils/                   # Utilidades de presentación
├── test/                            # Pruebas unitarias
├── android/                         # Código nativo Android
├── ios/                            # Código nativo iOS
├── web/                            # Configuración para web
├── windows/                        # Configuración para Windows
├── linux/                          # Configuración para Linux
├── macos/                          # Configuración para macOS
├── pubspec.yaml                    # Dependencias y configuración
└── analysis_options.yaml           # Reglas de análisis estático
```

### Limpieza

```bash
# Limpiar caché y archivos generados
flutter clean

### Actualizar dependencias

```bash
# Obtener versiones más recientes de dependencias
flutter pub upgrade

# Actualizar a versiones principales más nuevas
flutter pub upgrade --major-versions
```

## Plataformas Soportadas

-  **Web** - Chrome, Firefox, Safari

##  Recursos Útiles

- [Documentación de Flutter](https://flutter.dev/docs)
- [Documentación de Riverpod](https://riverpod.dev)
- [Clean Architecture en Dart/Flutter](https://resocoder.com/flutter-clean-architecture)
- [Dart Lints Recommendations](https://dart.dev/guides/language/analysis-options)

## 📝 Notas Importantes

- La aplicación está configurada para español colombiano (es_CO)
- Se utiliza Clean Architecture para separación de responsabilidades
- Riverpod maneja todo el state management y dependency injection
- Los componentes UI están organizados siguiendo el patrón Atomic Design

##  Solución de Problemas

### Problema: `flutter doctor` falla

```bash
# Solución:
flutter doctor -v
# Sigue las instrucciones para resolver problemas
```

### Problema: Dependencias sin descargar

```bash
# Solución:
flutter clean
flutter pub get
```

**Versión del Proyecto**: 1.0.0  
**SDK de Flutter Requerido**: ^3.11.3  

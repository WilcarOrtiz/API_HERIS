# HERIS - API de Gestión de Ventas y Facturas

Una API RESTful moderna desarrollada con **Node.js** y **Express** para gestionar sistemas de facturación, control de inventario, usuarios y ventas. Incluye autenticación basada en roles, gestión de productos y categorías, así como un historial detallado de transacciones.

---

## 📋 Tabla de Contenidos

- [Características](#características)
- [Stack Tecnológico](#stack-tecnológico)
- [Requisitos Previos](#requisitos-previos)
- [Instalación](#instalación)
- [Configuración](#configuración)
- [Uso de la API](#uso-de-la-api)
- [Estructura de la Base de Datos](#estructura-de-la-base-de-datos)
- [Autenticación](#autenticación)
- [Endpoints Principales](#endpoints-principales)
- [Ejemplo de Uso](#ejemplo-de-uso)
- [Solución de Problemas](#solución-de-problemas)
- [Contribuciones](#contribuciones)

---

## ✨ Características

- **Gestión de Usuarios**: Registro, login y control de acceso basado en roles
- **Sistema de Roles**: Admin, Usuario estándar, Supervisor
- **Gestión de Productos**: CRUD completo con categorías
- **Control de Inventario**: Seguimiento de stock en tiempo real
- **Facturación**: Generación y registro de facturas con detalles de venta
- **Historial de Ventas**: Registro completo de transacciones
- **Seguridad**: Contraseñas encriptadas con bcrypt
- **Menús Dinámicos**: Permisos de menú basados en roles
- **API RESTful**: Endpoints bien documentados y escalables

---

## 🛠️ Stack Tecnológico

| Tecnología | Versión | Propósito |
|-----------|---------|----------|
| **Node.js** | 14+ | Runtime de JavaScript |
| **Express** | ^4.17.0 | Framework web/API |
| **MySQL** | 5.7+ | Base de datos relacional |
| **MariaDB** | 10.4+ | Motor alternativo de BD |
| **bcryptjs** | ^2.4.3 | Encriptación de contraseñas |
| **dotenv** | ^10.0.0 | Gestión de variables de entorno |
| **cors** | ^2.8.5 | Control de origen cruzado |

---

## 📦 Requisitos Previos

Antes de instalar, asegúrate de tener instalado:

- **Node.js** versión 14 o superior ([Descargar](https://nodejs.org/))
- **npm** o **yarn** (incluido con Node.js)
- **MySQL Server** 5.7+ o **MariaDB** 10.4+ ([Descargar](https://www.mysql.com/downloads/))
- **Git** para clonar el repositorio

---

## 🚀 Instalación

### 1. Clonar el Repositorio

\`\`\`bash
git clone https://github.com/WilcarOrtiz/API_HERIS.git
cd API_HERIS
\`\`\`

### 2. Instalar Dependencias

\`\`\`bash
npm install
\`\`\`

### 3. Crear la Base de Datos

Abre tu cliente MySQL (phpMyAdmin, MySQL Workbench, etc.) y ejecuta:

\`\`\`sql
-- Crear la base de datos
CREATE DATABASE heris;

-- Usar la base de datos
USE heris;

-- Importar el esquema
-- Copia y pega el contenido del archivo heris.sql
\`\`\`

O desde la línea de comandos:

\`\`\`bash
mysql -u root -p heris < heris.sql
\`\`\`

### 4. Verificar Estructura de Carpetas

\`\`\`
API_HERIS/
├── API/
│   ├── routes/          # Rutas de la API
│   ├── controllers/      # Lógica de negocios
│   ├── middlewares/      # Middlewares de autenticación
│   ├── models/           # Modelos de datos
│   └── server.js         # Punto de entrada
├── heris.sql             # Script de base de datos
├── package.json
├── .env
└── README.md
\`\`\`

---

## ⚙️ Configuración

### 1. Crear archivo `.env`

En la raíz del proyecto, crea un archivo `.env` con la siguiente configuración:

\`\`\`env
# Configuración del Servidor
PORT=3000
NODE_ENV=development

# Configuración de Base de Datos
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=tu_contraseña
DB_NAME=heris
DB_PORT=3306

# Configuración de Seguridad
JWT_SECRET=tu_clave_secreta_muy_segura
BCRYPT_ROUNDS=10

# Configuración de CORS
CORS_ORIGIN=http://localhost:3000

# Configuración de Logs
LOG_LEVEL=debug
\`\`\`

### 2. Reemplazar Valores

- `DB_USER`: Tu usuario de MySQL
- `DB_PASSWORD`: Tu contraseña de MySQL
- `DB_HOST`: Host donde está MySQL (generalmente `localhost`)
- `JWT_SECRET`: Una clave secreta fuerte para tokens

---

## 📡 Uso de la API

### Iniciar el Servidor

\`\`\`bash
npm start
\`\`\`

O en modo desarrollo con auto-recarga:

\`\`\`bash
npm run dev
\`\`\`

El servidor estará disponible en: `http://localhost:3000`

---

## 🗄️ Estructura de la Base de Datos

### Tablas Principales

#### **usuarios**
Gestión de usuarios del sistema
\`\`\`sql
- idUsuario (PK)
- nombre (VARCHAR)
- email (VARCHAR, UNIQUE)
- password (VARCHAR, encriptado)
- esActivo (BOOLEAN)
- fechaRegistro (VARCHAR)
- idRol (FK)
\`\`\`

#### **rols**
Definición de roles disponibles
\`\`\`sql
- idRol (PK)
- descripcion (VARCHAR)
- esActivo (BOOLEAN)
- fechaRegistro (VARCHAR)
\`\`\`

#### **productos**
Catálogo de productos
\`\`\`sql
- idProducto (PK)
- nombre (VARCHAR)
- descripcion (VARCHAR)
- stock (INT)
- precio (FLOAT)
- esActivo (BOOLEAN)
- fechaRegistro (VARCHAR)
- idCategoria (FK)
\`\`\`

#### **categoria**
Categorías de productos
\`\`\`sql
- idCategoria (PK)
- descripcion (VARCHAR)
- esActivo (BOOLEAN)
- fechaRegistro (VARCHAR)
\`\`\`

#### **venta**
Registros de ventas
\`\`\`sql
- idVenta (PK)
- documentoCliente (VARCHAR)
- nombreCliente (VARCHAR)
- tipoPago (VARCHAR)
- total (FLOAT)
- fechaRegistro (VARCHAR)
\`\`\`

#### **detalleventa**
Líneas de detalle de ventas
\`\`\`sql
- idDetalleVenta (PK)
- cantidad (INT)
- precio (FLOAT)
- total (FLOAT)
- idVenta (FK)
- producto (VARCHAR)
- idProducto (FK)
\`\`\`

#### **menus**
Opciones del menú del sistema
\`\`\`sql
- idMenu (PK)
- nombre (VARCHAR)
- icono (VARCHAR)
- url (VARCHAR)
\`\`\`

#### **menurols**
Relación entre menús y roles
\`\`\`sql
- idMenuRol (PK)
- idMenu (FK)
- idRol (FK)
\`\`\`

---

## 🔐 Autenticación

### Sistema de Roles

La API implementa un sistema de autenticación basado en roles:

| Rol | Descripción | Permisos |
|-----|-------------|----------|
| **admin** | Administrador del sistema | Acceso total a todas las funciones |
| **user** | Usuario estándar | Acceso limitado a funciones básicas |
| **supervisor** | Supervisor de ventas | Acceso a reportes y historial |

### Flujo de Autenticación

1. **Registro**: El usuario se registra con email y contraseña
2. **Login**: El usuario inicia sesión y recibe un token JWT
3. **Token**: El token se incluye en el header de cada solicitud
4. **Validación**: El servidor verifica el token y los permisos del rol

---

## 📚 Endpoints Principales

### Autenticación

#### Registrar Usuario
\`\`\`http
POST /api/usuarios/registro
Content-Type: application/json

{
  "nombre": "John Doe",
  "email": "john@example.com",
  "password": "contraseña123",
  "idRol": 2
}
\`\`\`

#### Login
\`\`\`http
POST /api/usuarios/login
Content-Type: application/json

{
  "email": "john@example.com",
  "password": "contraseña123"
}

# Respuesta
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "usuario": {
    "idUsuario": 1,
    "nombre": "John Doe",
    "email": "john@example.com",
    "idRol": 2
  }
}
\`\`\`

### Gestión de Productos

#### Obtener Todos los Productos
\`\`\`http
GET /api/productos
Authorization: Bearer {token}
\`\`\`

#### Crear Producto
\`\`\`http
POST /api/productos
Authorization: Bearer {token}
Content-Type: application/json

{
  "nombre": "Laptop HP",
  "descripcion": "Laptop modelo XYZ",
  "stock": 15,
  "precio": 799.99,
  "idCategoria": 1
}
\`\`\`

#### Actualizar Producto
\`\`\`http
PUT /api/productos/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
  "nombre": "Laptop HP actualizada",
  "stock": 20
}
\`\`\`

#### Eliminar Producto
\`\`\`http
DELETE /api/productos/{id}
Authorization: Bearer {token}
\`\`\`

### Gestión de Ventas

#### Crear Venta
\`\`\`http
POST /api/ventas
Authorization: Bearer {token}
Content-Type: application/json

{
  "documentoCliente": "1066865142",
  "nombreCliente": "Carlos García",
  "tipoPago": "Tarjeta",
  "total": 2599.97,
  "detalles": [
    {
      "idProducto": 1,
      "cantidad": 2,
      "precio": 799.99,
      "total": 1599.98
    }
  ]
}
\`\`\`

#### Obtener Historial de Ventas
\`\`\`http
GET /api/ventas/historial
Authorization: Bearer {token}
\`\`\`

#### Obtener Detalles de Venta
\`\`\`http
GET /api/ventas/{id}/detalles
Authorization: Bearer {token}
\`\`\`

### Reportes

#### Obtener Reporte de Ventas
\`\`\`http
GET /api/reportes/ventas
Authorization: Bearer {token}
\`\`\`

#### Obtener Reporte por Rango de Fechas
\`\`\`http
GET /api/reportes/ventas?fechaInicio=2023-06-01&fechaFin=2023-06-30
Authorization: Bearer {token}
\`\`\`

---

## 💡 Ejemplo de Uso

### Flujo Completo de Venta con JavaScript

\`\`\`javascript
// 1. Importar módulos necesarios
import fetch from 'node-fetch';

const API_URL = 'http://localhost:3000/api';
let token = '';

// 2. Registrar usuario
async function registrarUsuario() {
  const response = await fetch(`${API_URL}/usuarios/registro`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      nombre: 'Juan Pérez',
      email: 'juan@example.com',
      password: 'seguro123',
      idRol: 2
    })
  });
  
  const data = await response.json();
  console.log('Usuario registrado:', data);
}

// 3. Iniciar sesión
async function login() {
  const response = await fetch(`${API_URL}/usuarios/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      email: 'juan@example.com',
      password: 'seguro123'
    })
  });
  
  const data = await response.json();
  token = data.token;
  console.log('Token obtenido:', token);
  
  return token;
}

// 4. Obtener productos
async function obtenerProductos() {
  const response = await fetch(`${API_URL}/productos`, {
    headers: { 'Authorization': `Bearer ${token}` }
  });
  
  const productos = await response.json();
  console.log('Productos disponibles:', productos);
  return productos;
}

// 5. Crear una venta
async function crearVenta() {
  const response = await fetch(`${API_URL}/ventas`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      documentoCliente: '1066865142',
      nombreCliente: 'María López',
      tipoPago: 'Efectivo',
      total: 2599.95,
      detalles: [
        {
          idProducto: 1,
          cantidad: 1,
          precio: 1000000,
          total: 1000000
        }
      ]
    })
  });
  
  const venta = await response.json();
  console.log('Venta registrada:', venta);
  return venta;
}

// 6. Ejecutar flujo completo
async function ejecutarFlujoPrincipal() {
  try {
    await registrarUsuario();
    await login();
    await obtenerProductos();
    await crearVenta();
    console.log('Flujo completado exitosamente');
  } catch (error) {
    console.error('Error:', error);
  }
}

ejecutarFlujoPrincipal();
\`\`\`

---

## 🐛 Solución de Problemas

| Problema | Causa Probable | Solución |
|----------|----------------|----------|
| **Error: "Cannot find module"** | Dependencias no instaladas | Ejecutar `npm install` |
| **Error de conexión BD** | MySQL no está corriendo | Verificar que MySQL está corriendo |
| **Error: "ECONNREFUSED 127.0.0.1:3306"** | BD no accesible | Revisar credenciales en `.env` |
| **Error: "Access denied for user"** | Credenciales incorrectas | Verificar usuario/contraseña en `.env` |
| **Error 401: Unauthorized** | Token inválido o expirado | Volver a hacer login |
| **Error 403: Forbidden** | Rol sin permisos | Verificar permisos del rol en `menurols` |
| **Puerto 3000 en uso** | Otro servicio está usando el puerto | Cambiar `PORT` en `.env` o cerrar el otro servicio |

---

## 📝 Desarrollo

### Scripts Disponibles

\`\`\`bash
# Iniciar servidor
npm start

# Iniciar en modo desarrollo con nodemon
npm run dev

# Ver logs del servidor
npm run logs

# Reiniciar servidor
npm restart
\`\`\`

### Agregar Nuevos Endpoints

1. Crear archivo en `routes/` (ejemplo: `routes/clientes.js`)
2. Crear controlador en `controllers/` (ejemplo: `controllers/clienteController.js`)
3. Registrar ruta en `server.js`
4. Crear validaciones en `middlewares/` si es necesario

---

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Para cambios significativos:

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

---

## 📄 Licencia

Este proyecto es de uso educativo. Contacta al autor para más información sobre licencias comerciales.

---

## 👤 Autor

**Wilcar Ortiz**
- GitHub: [@WilcarOrtiz](https://github.com/WilcarOrtiz)
- Repositorio: [API_HERIS](https://github.com/WilcarOrtiz/API_HERIS)

---

## 📞 Contacto y Soporte

Para reportar bugs, sugerir mejoras o hacer preguntas:
- Abre un **Issue** en el repositorio
- Contacta al autor directamente

---

## 📚 Referencias Útiles

- [Documentación Node.js](https://nodejs.org/docs/)
- [Express.js Guide](https://expressjs.com/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [JWT (JSON Web Tokens)](https://jwt.io/)
- [bcryptjs](https://www.npmjs.com/package/bcryptjs)
- [CORS Documentation](https://developer.mozilla.org/es/docs/Web/HTTP/CORS)

---

## 🔄 Historial de Cambios

### Versión 0.1 (Junio 2023)
- Versión inicial del API
- Implementación de autenticación con roles
- CRUD de productos, categorías y ventas
- Sistema de menús dinámicos

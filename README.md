# 🏥 API HERIS

<div align="center">

[![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org/)
[![Express](https://img.shields.io/badge/Express-000000?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com/)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)](https://developer.mozilla.org/es/docs/Web/JavaScript)

API RESTful para gestión de facturación, inventario y ventas de medicinas

[Características](#características) • [Instalación](#instalación) • [Endpoints](#endpoints) • [BD](#base-de-datos)

</div>

---

## 📋 Sobre el Proyecto

**API HERIS** es una API RESTful desarrollada con Node.js y Express para gestionar:
- Historial médico de pacientes
- Inventario de medicinas y productos
- Sistema de ventas y facturación
- Gestión de usuarios con roles (Admin, Vendedor, Paciente)

---

## ✨ Características

- ✅ Autenticación JWT con roles
- ✅ CRUD completo de productos y pacientes
- ✅ Control de inventario en tiempo real
- ✅ Sistema de facturación integrado
- ✅ Encriptación de contraseñas con bcrypt
- ✅ Validación de datos centralizada
- ✅ Manejo de errores robusto

---

## 🛠️ Stack Tecnológico

| Tecnología | Versión |
|-----------|---------|
| Node.js | 14+ |
| Express | 4.x |
| MySQL | 5.7+ |
| JWT | - |
| Bcrypt | - |

---

## 📦 Instalación Rápida

\`\`\`bash
# Clonar repositorio
git clone https://github.com/WilcarOrtiz/API_HERIS.git
cd API_HERIS

# Instalar dependencias
npm install

# Crear base de datos
mysql -u root -p < heris.sql

# Configurar .env
cp .env.example .env
\`\`\`

---

## ⚙️ Configuración (.env)

\`\`\`env
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=tu_contraseña
DB_NAME=heris
JWT_SECRET=tu_clave_secreta_aqui
NODE_ENV=development
\`\`\`

---

## 🚀 Iniciar API

\`\`\`bash
npm start        # Producción
npm run dev      # Desarrollo con nodemon
\`\`\`

La API estará en: `http://localhost:3000`

---

## 📡 Endpoints Principales

### Autenticación
\`\`\`http
POST   /api/auth/login       # Iniciar sesión
POST   /api/auth/register    # Registrar usuario
\`\`\`

### Pacientes
\`\`\`http
GET    /api/pacientes        # Obtener todos
GET    /api/pacientes/:id    # Obtener uno
POST   /api/pacientes        # Crear
PUT    /api/pacientes/:id    # Actualizar
DELETE /api/pacientes/:id    # Eliminar
\`\`\`

### Medicinas
\`\`\`http
GET    /api/medicinas        # Listar medicinas
POST   /api/medicinas        # Crear medicina
PUT    /api/medicinas/:id    # Actualizar
DELETE /api/medicinas/:id    # Eliminar
\`\`\`

### Ventas
\`\`\`http
POST   /api/ventas           # Crear venta
GET    /api/ventas           # Listar ventas
GET    /api/ventas/:id       # Detalles venta
\`\`\`

---

## 💻 Ejemplo de Uso

### Login
\`\`\`bash
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "usuario@example.com",
    "password": "contraseña123"
  }'
\`\`\`

### Crear Venta
\`\`\`bash
curl -X POST http://localhost:3000/api/ventas \
  -H "Authorization: Bearer tu_token" \
  -H "Content-Type: application/json" \
  -d '{
    "paciente_id": 1,
    "detalles": [{"medicina_id": 5, "cantidad": 2, "precio": 50000}]
  }'
\`\`\`

---

## 🗄️ Base de Datos

\`\`\`
PACIENTES (id, nombre, cedula, email, telefono, direccion)
MEDICINAS (id, nombre, descripcion, precio, stock, categoria)
VENTAS (id, paciente_id, fecha, total, vendedor_id)
VENTA_DETALLES (id, venta_id, medicina_id, cantidad, subtotal)
\`\`\`

---

## 🔐 Autenticación

Todos los endpoints protegidos requieren:

\`\`\`http
Authorization: Bearer tu_token_jwt_aqui
\`\`\`

### Roles disponibles
- **Admin**: Acceso total
- **Vendedor**: Gestión de ventas e inventario
- **Paciente**: Consulta de historial

---

## 💡 Flujo Completo en JavaScript

\`\`\`javascript
const API = 'http://localhost:3000/api';
let token = '';

// 1. Login
const login = async () => {
  const res = await fetch(`${API}/auth/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      email: 'usuario@example.com',
      password: 'contraseña123'
    })
  });
  const data = await res.json();
  token = data.token;
};

// 2. Obtener medicinas
const getMedicinas = async () => {
  const res = await fetch(`${API}/medicinas`, {
    headers: { 'Authorization': `Bearer ${token}` }
  });
  return res.json();
};

// 3. Crear venta
const crearVenta = async () => {
  const res = await fetch(`${API}/ventas`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      paciente_id: 1,
      detalles: [{ medicina_id: 5, cantidad: 2, precio: 50000 }]
    })
  });
  return res.json();
};

// Ejecutar
await login();
await getMedicinas();
await crearVenta();
\`\`\`

---

## 🐛 Solución de Problemas

| Error | Solución |
|-------|----------|
| **Error de conexión MySQL** | Verificar que MySQL está corriendo y credenciales en `.env` |
| **Puerto 3000 en uso** | Cambiar `PORT` en `.env` a otro disponible |
| **Token inválido** | Generar nuevo con `/api/auth/login` |
| **CORS error** | Verificar configuración CORS en Express |
| **Tabla no encontrada** | Ejecutar `mysql -u root -p < heris.sql` |

---

## 📚 Recursos

- [Node.js Docs](https://nodejs.org/docs/)
- [Express Guide](https://expressjs.com/)
- [JWT.io](https://jwt.io/)
- [MySQL Docs](https://dev.mysql.com/doc/)

---

## 👤 Autor

**Wilcar Ortiz** - [@WilcarOrtiz](https://github.com/WilcarOrtiz)

---

**Última actualización:** Noviembre 2025

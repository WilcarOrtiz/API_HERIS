# 🏥 API HERIS

<div align="center">

[![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org/)
[![Express](https://img.shields.io/badge/Express-000000?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com/)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)](https://developer.mozilla.org/es/docs/Web/JavaScript)

API RESTful para gestión de facturación, inventario y ventas de medicinas

[Características](#características) • [Instalación](#instalación) • [Endpoints](#endpoints) • [BD](#base-de-datos)

</div>


## 📋 Sobre el Proyecto

**API HERIS** es una API RESTful desarrollada con Node.js y Express para gestionar:
- Historial médico de pacientes
- Inventario de medicinas y productos
- Sistema de ventas y facturación
- Gestión de usuarios con roles (Admin, Vendedor, Paciente)


## ✨ Características

- ✅ Autenticación JWT con roles
- ✅ CRUD completo de productos y pacientes
- ✅ Control de inventario en tiempo real
- ✅ Sistema de facturación integrado
- ✅ Encriptación de contraseñas con bcrypt
- ✅ Validación de datos centralizada
- ✅ Manejo de errores robusto


## 🛠️ Stack Tecnológico

| Tecnología | Versión |
|-----------|---------|
| Node.js | 14+ |
| Express | 4.x |
| MySQL | 5.7+ |
| JWT | - |
| Bcrypt | - |


## 📦 Instalación Rápida

1. Clonar repositorio
git clone https://github.com/WilcarOrtiz/API_HERIS.git
cd API_HERIS

2. Instalar dependencias
npm install

3. Crear base de datos
mysql -u root -p < heris.sql

4.  Configurar .env
cp .env.example .env
---

Variables de entorno necesarias para ejecutar el proyecto:

## ⚙️ Configuración (.env)

```env
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=tu_contraseña
DB_NAME=heris
JWT_SECRET=tu_clave_secreta
NODE_ENV=development
```
---

## 🚀 Iniciar la API
Comandos disponibles:

```bash
# Ejecutar en producción
npm start

# Ejecutar en desarrollo con nodemon
npm run dev
```

La API estará en: `http://localhost:3000`
---
## 🔐 Autenticación

Todos los endpoints protegidos requieren: **Authorization: Bearer tu_token_jwt_aqui**
### Roles disponibles
- **Admin**: Acceso total
- **Vendedor**: Gestión de ventas e inventario
- **Paciente**: Consulta de historial

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

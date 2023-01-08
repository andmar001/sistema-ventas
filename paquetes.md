# Creacion de la solucion
- Solucion en blanco -- otros

capas de la aplicacion
- SistemaVenta.API   -- ASP.NET Core Web API

bibliotecas de clases
- SistemaVenta.DAL -- Clases de biblioteca de .NET Standard
- SistemaVenta.BLL -- Clases de biblioteca de .NET Standard
- SistemaVenta.Model -- Clases de biblioteca de .NET Standard
- SistemaVenta.IOC -- Clases de biblioteca de .NET Standard (Inyeccion de dependencias)
- SistemaVenta.Utility -- Clases de biblioteca de .NET Standard

# Paquetes nugets instalados
- Microsoft.EntityFrameworkCore.SqlServer
- Microsoft.EntityFrameworkCore.Tools

# Obtener la referencia de la conexión a la base de datos
Scaffold-DbContext "Server=(local); DataBase=dbventa; Trusted_Connection=True; TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer
- no olvidar poner como proyecto predeterminado el proyecto de modelo - SistemaVenta.Model

referencias de la proyecto
DAL --> Model
BLL --> DAL .. Model .. DTO .. Utility
IOC --> BLL .. DAL .. Utility
Utility --> DTO .. Model
API --> BLL .. DTO .. IOC
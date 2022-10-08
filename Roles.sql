/*Crear un nuevo rol llamado Vendedores, los miembros de este rol deberán poseer los permisos de lectura y escritura (actualización y borrado) 
sobre el schema Sales y permisos de lectura sobre las tablas Production. ProductCategory y Production.Product*/

CREATE ROLE Vendedores AUTHORIZATION [dbo]
GO

GRANT INSERT ON SCHEMA::Sales TO Vendedores
GO

GRANT SELECT ON SCHEMA::Sales TO Vendedores
GO

GRANT UPDATE ON SCHEMA::Sales TO Vendedores
GO

GRANT SELECT ON TABLE::Production.Product TO Vendedores
GO
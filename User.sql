/*Crear un usuario con las iniciales de tus dos nombres + tu primer apellido. Si tu nombre es Felix Ruben García tu login y usuario deberían ser frgarcia.
Hacer al usuario miembro del rol Vendedores*/

CREATE USER bjvallejos FOR LOGIN bjvallejos WITH DEFAULT_SCHEMA = dbo;
GO

CREATE LOGIN bjvallejos WITH PASSWORD = 'pa$$w0rD'
GO

ALTER ROLE Vendedores ADD MEMBER bjvallejos
GO

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<html>
<head>
    <title>Formulario Empleado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-4">
    <h2>
        <c:choose>
            <c:when test="${not empty empleado}">Editar Empleado</c:when>
            <c:otherwise>Nuevo Empleado</c:otherwise>
        </c:choose>
    </h2>

    <form action="EmpleadoServlet?action=guardar" method="post">
        <input type="hidden" name="idEmpleado" value="${empleado.idEmpleado}"/>

        <div class="mb-3">
            <label>DUI</label>
            <input type="text" class="form-control" name="numeroDui" value="${empleado.numeroDui}" required/>
        </div>
        <div class="mb-3">
            <label>Nombre</label>
            <input type="text" class="form-control" name="nombrePersona" value="${empleado.nombrePersona}" required/>
        </div>
        <div class="mb-3">
            <label>Usuario</label>
            <input type="text" class="form-control" name="usuario" value="${empleado.usuario}" required/>
        </div>
        <div class="mb-3">
            <label>Telefono</label>
            <input type="text" class="form-control" name="numeroTelefono" value="${empleado.numeroTelefono}"/>
        </div>
        <div class="mb-3">
            <label>Correo</label>
            <input type="email" class="form-control" name="correoInstitucional" value="${empleado.correoInstitucional}"/>
        </div>
        <div class="mb-3">
            <label>Fecha Nacimiento</label>
            <input type="date" class="form-control" name="fechaNacimiento" value="${empleado.fechaNacimiento}"/>
        </div>

        <button type="submit" class="btn btn-success">Guardar</button>
        <a href="EmpleadoServlet?action=listar" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
</body>
</html>

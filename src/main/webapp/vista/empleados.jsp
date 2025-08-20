<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<html>
<head>
    <title>Lista de Empleados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-4">
    <h2>Empleados</h2>
    <div class="mb-3 d-flex justify-content-between">
        <a href="EmpleadoServlet?action=nuevo" class="btn btn-success">Nuevo Empleado</a>
        <a href="ContratacionesServlet" class="btn btn-secondary">Regresar</a>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>DUI</th>
            <th>Nombre</th>
            <th>Usuario</th>
            <th>Telefono</th>
            <th>Correo</th>
            <th>Fecha Nacimiento</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="emp" items="${empleados}">
            <tr>
                <td>${emp.idEmpleado}</td>
                <td>${emp.numeroDui}</td>
                <td>${emp.nombrePersona}</td>
                <td>${emp.usuario}</td>
                <td>${emp.numeroTelefono}</td>
                <td>${emp.correoInstitucional}</td>
                <td>${emp.fechaNacimiento}</td>
                <td>
                    <a href="EmpleadoServlet?action=editar&id=${emp.idEmpleado}" class="btn btn-primary btn-sm">Editar</a>
                    <a href="EmpleadoServlet?action=eliminar&id=${emp.idEmpleado}" class="btn btn-danger btn-sm"
                       onclick="return confirm('¿Seguro de eliminar este empleado?')">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Contrataciones</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h1 class="text-center mb-4 text-primary">Lista de Contrataciones</h1>

    <!-- Botones -->
    <div class="mb-4 text-center">
        <a href="agregarContratacion.jsp" class="btn btn-success me-2">Agregar Contratacion</a>
        <a href="EmpleadoServlet?action=listar" class="btn btn-primary">Agregar Empleado</a>

    </div>

    <!-- Tabla responsive -->
    <div class="table-responsive">
        <table class="table table-striped table-hover table-bordered bg-white">
            <thead class="table-dark">
            <tr>
                <th>Departamento</th>
                <th>Empleado</th>
                <th>Cargo</th>
                <th>Tipo Contratacion</th>
                <th>Fecha Contratación</th>
                <th>Salario</th>
                <th>Estado</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="contrataciones" items="${listaContrataciones}">
                <tr>
                    <td>${contrataciones.departamento}</td>
                    <td>${contrataciones.empleado}</td>
                    <td>${contrataciones.cargo}</td>
                    <td>${contrataciones.tipoContratacion}</td>
                    <td>${contrataciones.fechaContratacion}</td>
                    <td>${contrataciones.salario}</td>
                    <td>${contrataciones.estado}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS (opcional, para componentes interactivos) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
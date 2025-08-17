<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lista de Contrataciones</title>
</head>
<body>
<h1>Contrataciones</h1>
<a href="agregarContratacion.jsp">Agregar Contratacion</a>
<a href="empleados.jsp"> Agregar Empleado</a>

<table border="1">
    <tr>
        <th>Departamento</th>
        <th>Empleado</th>
        <th>Cargo</th>
        <th>Tipo Contratacion</th>
        <th>Fecha Contratacion</th>
        <th>Salario</th>
        <th>Estado</th>
    </tr>
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
</table>
</body>
</html>

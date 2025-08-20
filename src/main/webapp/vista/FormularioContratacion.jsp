<%--
  Created by IntelliJ IDEA.
  User: sandra
  Date: 8/18/2025
  Time: 8:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Contratación</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg rounded-3">
        <div class="card-header bg-primary text-white text-center">
            <h4>Registrar Nueva Contratación</h4>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/FormularioContratacionServlet" method="post">
                <input type="hidden" name="accion" value="insertar"/>

                <!-- Departamento -->
                <div class="mb-3">
                    <label for="idDepartamento" class="form-label">Departamento</label>
                    <select id="idDepartamento" name="idDepartamento" class="form-select" required>
                        <c:forEach var="d" items="${departamentos}">
                            <option value="${d.idDepartamento}">${d.nombreDepartamento}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Empleado -->
                <div class="mb-3">
                    <label for="idEmpleado" class="form-label">Empleado</label>
                    <select id="idEmpleado" name="idEmpleado" class="form-select" required>
                        <c:forEach var="e" items="${empleados}">
                            <option value="${e.idEmpleado}">${e.nombrePersona}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Cargo -->
                <div class="mb-3">
                    <label for="idCargo" class="form-label">Cargo</label>
                    <select id="idCargo" name="idCargo" class="form-select" required>
                        <c:forEach var="c" items="${cargos}">
                            <option value="${c.idCargo}">${c.cargo}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Tipo de Contratación -->
                <div class="mb-3">
                    <label for="idTipoContratacion" class="form-label">Tipo de Contratación</label>
                    <select id="idTipoContratacion" name="idTipoContratacion" class="form-select" required>
                        <c:forEach var="t" items="${tipos}">
                            <option value="${t.idTipoContratacion}">${t.tipoContratacion}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Fecha de Contratación -->
                <div class="mb-3">
                    <label for="fechaContratacion" class="form-label">Fecha de Contratación</label>
                    <input type="date" id="fechaContratacion" name="fechaContratacion" class="form-control" required>
                </div>

                <!-- Salario -->
                <div class="mb-3">
                    <label for="salario" class="form-label">Salario</label>
                    <input type="number" step="0.01" id="salario" name="salario" class="form-control" placeholder="Ingrese salario" required>
                </div>

                <!-- Estado -->
                <div class="mb-3">
                    <label for="estado" class="form-label">Estado</label>
                    <select id="estado" name="estado" class="form-select">
                        <option value="true">Activo</option>
                        <option value="false">Inactivo</option>
                    </select>
                </div>

                <!-- Botones -->
                <div class="d-flex justify-content-between">
                    <a href="ContratacionesServlet" class="btn btn-secondary">Cancelar</a>
                    <button type="submit" class="btn btn-success">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
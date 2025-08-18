<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Inicio de sesión</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
  <style>
    body {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: #f8f9fa;
    }
    .card { width: 100%; max-width: 420px; }
  </style>
</head>
<body>
<main class="container">
  <div class="card shadow-sm">
    <div class="card-body p-4">
      <h1 class="h4 mb-3 text-center">Iniciar sesión</h1>

      <!-- Mostrar error -->
      <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">${error}</div>
      </c:if>

      <!-- Formulario login -->
      <form action="${pageContext.request.contextPath}/auth/login" method="post">
        <div class="mb-3">
          <label for="username" class="form-label">Usuario</label>
          <input
                  id="username"
                  name="username"
                  type="text"
                  class="form-control"
                  required
                  value="${param.username != null ? param.username : ''}" />
        </div>

        <div class="mb-3">
          <label for="password" class="form-label">Contraseña</label>
          <input
                  id="password"
                  name="password"
                  type="password"
                  class="form-control"
                  required />
        </div>

        <div class="d-grid">
          <button type="submit" class="btn btn-primary">Iniciar sesión</button>
        </div>
      </form>
    </div>
  </div>
</main>
</body>
</html>
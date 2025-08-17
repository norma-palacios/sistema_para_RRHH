
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Inicio de sesión</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
  <style>
    body { min-height: 100vh; display:flex; align-items:center; justify-content:center; }
    .card { width: 100%; max-width: 420px; }
  </style>
</head>
 <main class="container">
    <div class="card shadow-sm">
      <div class="card-body p-4">
        <h1 class="h4 mb-3 text-center">Iniciar sesión</h1>

    //mensajes exito/error

        <c:if test="${not empty flash_success}">
                  <div class="alert alert-success" role="alert">${flash_success}</div>
                </c:if>
                <c:if test="${not empty flash_error}">
                  <div class="alert alert-danger" role="alert">${flash_error}</div>
                </c:if>

 //Lista de errores de validación

        <c:if test="${not empty errors}">
          <div class="alert alert-danger" role="alert">
            <ul class="mb-0">
              <c:forEach var="e" items="${errors}">
                <li>${e}</li>
              </c:forEach>
            </ul>
          </div>
        </c:if>

 // Formulario login

        <form action="${pageContext.request.contextPath}/auth/login" method="post" novalidate>
          <!-- CSRF token: el servlet que muestra esta vista debe ponerlo en sesión y request -->
          <input type="hidden" name="csrfToken" value="${csrfToken}"/>


          <div class="mb-3">
            <label for="username" class="form-label">Usuario</label>
            <input
              id="username"
              name="username"
              type="text"
              class="form-control <c:if test='${fieldErrors.username}'>is-invalid</c:if>"
              autocomplete="username"
              required
              value="${param.username != null ? param.username : (prefillUsername != null ? prefillUsername : '')}"
              aria-describedby="usernameHelp"/>
            <div id="usernameHelp" class="form-text">Ingrese su usuario.</div>
            <c:if test="${fieldErrors.username}">
              <div class="invalid-feedback">Usuario requerido.</div>
            </c:if>
          </div>

  //contraseña
          <div class="mb-3">
            <label for="password" class="form-label">Contraseña</label>
            <div class="input-group">
              <input
                id="password"
                name="password"
                type="password"
                class="form-control <c:if test='${fieldErrors.password}'>is-invalid</c:if>"
                autocomplete="current-password"
                required />
              <button class="btn btn-outline-secondary" type="button" id="togglePwd" aria-label="Mostrar u ocultar contraseña">
                👁
              </button>
              <c:if test="${fieldErrors.password}">
                <div class="invalid-feedback d-block">Contraseña requerida.</div>
              </c:if>
            </div>
          </div>
<script>
    // Mostrar/ocultar contraseña
    document.getElementById('togglePwd')?.addEventListener('click', function(){
      const pwd = document.getElementById('password');
      pwd.type = (pwd.type === 'password') ? 'text' : 'password';
      this.setAttribute('aria-pressed', pwd.type === 'text');
    });
  </script>
</body>
</html>

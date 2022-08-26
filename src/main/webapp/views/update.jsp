
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <form action="save-user" method="post">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="${persona.nombre}">
                    <input type="hidden" name="id" value="${persona.id}">
                </div>
                <div class="mb-3">
                    <label for="apellidos" class="form-label">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos" name="apellidos" value="${persona.apellidos}">
                </div>
                <div class="mb-3">
                    <label for="curp" class="form-label">Curp</label>
                    <input type="text" class="form-control" id="curp" name="curp" value="${persona.curp}">
                </div>
                <div class="mb-3">
                    <label for="birthday" class="form-label">Birthday</label>
                    <input type="text" class="form-control" id="birthday" name="birthday" placeholder="DD/MM/YYYYY" value="${persona.birthday}">
                </div>
                <button type="button" onclick="location.href = 'get-usuarios'" class="btn btn-danger btn-sm">Cancelar</button>
                <button type="submit" class="btn btn-primary">actualizar</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>

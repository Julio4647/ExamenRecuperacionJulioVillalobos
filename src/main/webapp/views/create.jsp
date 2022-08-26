//julio Alberto Ocampo Villalobos
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Registrar</title>
</head>
<body style="background-color: darkgray">
<jsp:include page="../templates/navbar.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-12">
            <br>
            <div class="card">
                <div class="card-body">
                    <form action="add-user" method="post">

                        <div class="form-group mb-3">
                            <div class="row">
                                <div class="col-4">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre">
                                </div>
                                <div class="col-4">
                                    <label for="apellidos" class="form-label">Apellidos</label>
                                    <input type="text" class="form-control" name="apellidos" id="apellidos">
                                </div>
                                <div class="col-4">
                                    <label for="birthday" class="form-label">Birthday</label>
                                    <input type="date" class="form-control" name="birthday" id="birthday" placeholder="DD/MM/YYYYY">
                                </div>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <div class="row">
                                <div class="col-4">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" name="email" id="email">
                                </div>
                                <div class="col-4">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="text" class="form-control" name="phone" id="phone">
                                </div>
                                <div class="col-4">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" class="form-control" name="username" id="username">
                                </div>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <div class="row">
                                <div class="col">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" name="password" id="password">
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <button type="button" onclick="location.href = 'get-usuarios'" class="btn btn-danger btn-sm">Cancelar</button>
                            <button type="submit" class="btn btn-success">REGISTRAR</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>

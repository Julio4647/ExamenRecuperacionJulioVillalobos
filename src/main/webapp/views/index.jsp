//julio Alberto Ocampo Villalobos
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Persona</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body style="background-color: darkgray">
<jsp:include page="../templates/navbar.jsp"/>
<div class="container" >
    <div class="row">
        <div class="col-12">
            <c:if test="${param['result']}">
                <p style="color: black"><c:out value="${param['message']}"></c:out> </p>
            </c:if>
            <br>
            <div class="card" >
                <div class="card-header"  style="background-color: dodgerblue">
                    <div class="row">
                        <div class="col-9">
                            <h2>PERSONAS</h2>
                        </div>
                        <div class="col-3 text-end">
                            <a href="create-user" class="btn btn-outline-success">Registrar persona</a>
                        </div>
                    </div>
                </div>
                <div class="card-body" style="background-color: #e8d0ac">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Birthday</th>
                            <th>Email</th>
                            <th>Username</th>
                            <th>option</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="persona" items="${personas}" varStatus="status">
                            <tr>
                                <td>
                                    <c:out value="${status.count}"></c:out>
                                </td>
                                <td>
                                    <c:out value="${persona.nombre}"></c:out>
                                </td>
                                <td>
                                    <c:out value="${persona.apellidos}"></c:out>
                                </td>
                                <td>
                                    <c:out value="${persona.birthday}"></c:out>
                                </td>
                                <td>
                                    <c:out value="${persona.email}"></c:out>
                                </td>
                                <td>
                                    <c:out value="${persona.username}"></c:out>
                                </td>
                                <td>
                                    <a href="get-user?id=${persona.id}" class="btn btn-warning btn-sm">editar</a>
                                    <form action="delete-user" method="post">
                                        <input type="hidden" value="${persona.id}" name="id"/>
                                        <button type="submit" class="btn btn-danger btn-sm">eliminar</button>
                                    </form>
                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>

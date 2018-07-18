<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Terapias 2</title>
    </head>

    <body>
        <h1>Web Terapias 2</h1>
        <div>
            <button type="reset">
                <a href="${pageContext.request.contextPath}/medico/list.htm" style="text-decoration: none; color: black">Listado de M&eacute;dicos</a>
            </button>
            <br><br>
            <button type="reset">
                <a href="${pageContext.request.contextPath}/paciente/list.htm" style="text-decoration: none; color: black">Listado de Pacientes</a>
            </button>
            <br><br>
            <button type="reset">
                <a href="${pageContext.request.contextPath}/terapia/list.htm" style="text-decoration: none; color: black">Listado de Terapias</a>
            </button>
        </div>
    </body>
</html>

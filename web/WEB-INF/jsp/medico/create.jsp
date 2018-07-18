<%-- 
    Document   : create
    Created on : 20/06/2018, 10:59:18
    Author     : labctr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar M&eacute;dico</title>
    </head>
    <body>
        <h1>Registrar M&eacute;dico</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/medico/create.htm" method="POST" commandName="medico">
            <fieldset>
                <label>C&eacute;dula: </label>
                <frm:input path="cedula" placeholder="Ingrese la cédula del médico"></frm:input>
                    <br>
                    <label>Nombre: </label>
                <frm:input path="nombre" placeholder="Ingrese el nombre del médico"></frm:input>
                    <br>
                    <label>Correo electr&oacute;nico: </label>
                <frm:input path="correo" placeholder="Ingrese el correo del médico"></frm:input>
                    <br>
                    <label>C&oacute;digo: </label>
                <frm:input path="codigo" placeholder="Ingrese el código del médico"></frm:input>
                    <div>
                        <button type="reset">
                            <a href="${pageContext.request.contextPath}/medico/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                    </button>
                    <button type="submit">Guardar</button>
                </div>
            </fieldset>
        </frm:form>
    </body>
</html>

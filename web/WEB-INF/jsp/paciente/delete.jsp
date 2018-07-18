<%-- 
    Document   : delete
    Created on : 20/06/2018, 10:59:18
    Author     : labctr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Paciente</title>
    </head>
    <body>
        <h1>Desea Eliminar al paciente ${paciente.getNombre()}</h1>
        <hr>
        <fieldset>
            <label>C&eacute;dula: </label>
            <span>${paciente.getCedula()}</span>
            <br>
            <label>Fecha de nacimiento: </label>
            <span>${paciente.getFechaMostrar()}</span>
            <br>
            <label>Estatura: </label>
            <span>${paciente.getEstatura()}</span>
            <br>
            <label>Peso: </label>
            <span>${paciente.getPeso()}</span>
        </fieldset>
        <frm:form action="${pageContext.request.contextPath}/paciente/delete.htm" method="POST" commandName="paciente">
            <frm:hidden path="pacienteId"/>
            <div>
                <button type="reset">
                    <a href="${pageContext.request.contextPath}/paciente/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                </button>
                <button type="submit">Eliminar</button>
            </div>
        </frm:form>
</body>
</html>

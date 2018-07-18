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
        <title>Eliminar M&eacute;dico</title>
    </head>
    <body>
        <h1>Desea Eliminar al m&eacute;dico ${medico.getNombre()}</h1>
        <hr>
            <fieldset>
                <label>C&eacute;dula: </label>
                <span>${medico.getCedula()}</span>
                    <br>
                    <label>Correo electr&oacute;nico: </label>
                <span>${medico.getCorreo()}</span>
                    <br>
                    <label>C&oacute;digo: </label>
                <span>${medico.getCodigo()}</span>
            </fieldset>
        <frm:form action="${pageContext.request.contextPath}/medico/delete.htm" method="POST" commandName="medico">
                <frm:hidden path="medicoId"/>
                    <div>
                        <button type="reset">
                            <a href="${pageContext.request.contextPath}/medico/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                    </button>
                    <button type="submit">Eliminar</button>
                </div>
        </frm:form>
    </body>
</html>

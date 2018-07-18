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
        <title>Editar M&eacute;dico</title>
    </head>
    <body>
        <h1>Editar M&eacute;dico</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/medico/update.htm" method="POST" commandName="medico">
            <fieldset>
                <label>C&eacute;dula: </label>
                <frm:input path="cedula" 
                           value="${medico.getCedula()}"
                           placeholder="Ingrese la cédula del médico"></frm:input>
                    <br>
                    <label>Nombre: </label>
                <frm:input path="nombre" 
                           value="${medico.getNombre()}"
                           placeholder="Ingrese el nombre del médico"></frm:input>
                    <br>
                    <label>Correo electr&oacute;nico: </label>
                <frm:input path="correo" 
                           placeholder="Ingrese el correo del médico"></frm:input>
                    <br>
                    <label>C&oacute;digo: </label>
                <frm:input path="codigo" 
                           value="${medico.getCodigo()}"
                           placeholder="Ingrese el código del médico"></frm:input>
                <frm:hidden path="medicoId" 
                           value="${medico.getMedicoId()}"></frm:hidden>
                    <div>
                        <button type="reset">
                            <a href="${pageContext.request.contextPath}/medico/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                    </button>
                    <button type="submit">Actualizar</button>
                </div>
            </fieldset>
        </frm:form>
    </body>
</html>

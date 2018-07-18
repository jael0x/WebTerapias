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
        <title>Editar Paciente</title>
    </head>
    <body>
        <h1>Editar Paciente</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/paciente/update.htm" method="POST" commandName="paciente">
            <fieldset>
                <label>C&eacute;dula: </label>
                <frm:input path="cedula" 
                           value="${paciente.getCedula()}"
                           placeholder="Ingrese la cédula del paciente"></frm:input>
                    <br>
                    <label>Nombre: </label>
                <frm:input path="nombre" 
                           value="${paciente.getNombre()}"
                           placeholder="Ingrese el nombre del paciente"></frm:input>
                    <br>
                    <label>Fecha de Nacimiento: </label>
                <frm:input type="date" path="strFecha" 
                           value="${paciente.getFechaMostrar()}"></frm:input>
                    <br>
                    <label>Estatura: </label>
                <frm:input path="estatura" 
                           value="${paciente.getEstatura()}"
                           placeholder="Ingrese la estatura del paciente" min="100" max="230"></frm:input>
                    <br>
                    <label>Peso: </label>
                <frm:input path="peso" 
                           value="${paciente.getPeso()}"
                           placeholder="Ingrese el peso del paciente" min="30" max="330"></frm:input>
                <frm:hidden path="pacienteId" 
                            value="${paciente.getPacienteId()}"></frm:hidden>
                    <div>
                        <button type="reset">
                            <a href="${pageContext.request.contextPath}/paciente/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                    </button>
                    <button type="submit">Actualizar</button>
                </div>
            </fieldset>
        </frm:form>
    </body>
</html>

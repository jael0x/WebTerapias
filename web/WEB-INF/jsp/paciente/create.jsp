<%-- 
    Document   : create
    Created on : 25-jun-2018, 10:22:23
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Paciente</title>
    </head>
    <body>
        <h1>Registrar Paciente</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/paciente/create.htm" method="POST" commandName="paciente">
            <fieldset>
                <label>C&eacute;dula: </label>
                <frm:input path="cedula" placeholder="Ingrese la cédula del paciente"></frm:input>
                <frm:errors path="cedula"/>
                <br>
                <label>Nombre: </label>
                <frm:input path="nombre" placeholder="Ingrese el nombre del paciente"></frm:input>
                <frm:errors path="nombre"/>    
                <br>
                <label>Fecha de Nacimiento: </label>
                <frm:input type="date" path="strFecha" placeholder="yyyy/MM/dd"></frm:input>
                <frm:errors path="strFecha"/>
                <br>
                <label>Estatura: </label>
                <frm:input path="estatura" placeholder="Ingrese la estatura del paciente" min="100" max="230"></frm:input>
                <frm:errors path="estatura"/>
                <br>
                <label>Peso: </label>
                <frm:input path="peso" placeholder="Ingrese el peso del paciente" min="30" max="330"></frm:input>
                <frm:errors path="peso"/>
                <div>
                    <button type="reset">
                        <a href="${pageContext.request.contextPath}/paciente/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                    </button>
                    <button type="submit">Guardar</button>
                </div>
            </fieldset>
        </frm:form>
    </body>
</html>

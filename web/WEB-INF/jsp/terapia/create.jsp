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
        <title>Registrar Terapia</title>
    </head>
    <body>
        <h1>Registrar Terapia</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/terapia/create.htm" method="POST" commandName="terapia">
            <fieldset>
                <label>Fecha: </label>
                <frm:input type="date" path="strFecha"></frm:input>
                    <br>
                    <label>Paciente: </label>
                <frm:select path="idpaciente"> <%--Terapia--%>
                    <frm:option value="0" label="--Seleccione--"/>
                    <frm:options items="${listPaciente}"
                                 itemLabel="nombre"
                                 itemValue="pacienteId"/> <%--Paciente--%>
                </frm:select>
                <br>
                <label>M&eacute;dico: </label>
                <frm:select path="idmedico"> <%--Terapia--%>
                    <frm:option value="0" label="--Seleccione--"/>
                    <frm:options items="${listMedico}"
                                 itemLabel="nombre"
                                 itemValue="medicoId"/> <%--Paciente--%>
                </frm:select>
                <br>
                <button type="reset">
                    <a href="${pageContext.request.contextPath}/terapia/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                </button>
                <button type="submit">Guardar</button>
            </div>
        </fieldset>
    </frm:form>
</body>
</html>

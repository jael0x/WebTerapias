<%-- 
    Document   : create
    Created on : 25-jun-2018, 10:22:23
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Terapia</title>
    </head>
    <body>
        <h1>Desea Eliminar esta Terapia</h1>
        <hr>
        <fieldset>
            <label>Fecha: </label>
            <span>${terapia.getFechaDesc()}</span>
            <br>
            <label>Paciente: </label>
            <span>${terapia.getPacienteId().getNombre()}</span>
            <br>
            <label>Realizada</label>
            <c:choose>
                <c:when test="${terapia.getRealizada()}">
                    <input type="checkbox" disabled checked>
                </c:when>    
                <c:otherwise>
                    <input type="checkbox" disabled>
                </c:otherwise>
            </c:choose>
            <br>
            <label>Duraci&oacute;n</label>
            <span>${terapia.getDuracion()}</span>
            <br>
            <label>Observaci&oacute;n: </label>
            <span>${terapia.getObservacion()}</span>
            <br>
        </fieldset>
        <frm:form action="${pageContext.request.contextPath}/terapia/delete.htm" method="POST" commandName="terapia">
            <frm:hidden path="terapiaId"></frm:hidden>
                <div>
                    <button type="reset">
                        <a onclick="history.back()" style="text-decoration: none; color: black">Atr&aacute;s</a>
                    </button>
                    <button type="submit">Eliminar</button>
                </div>
        </frm:form>
    </body>
</html>

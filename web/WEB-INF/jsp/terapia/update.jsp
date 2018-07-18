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
        <title>Actualizar Terapia</title>
    </head>
    <body>
        <h1>Actualizar Terapia</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/terapia/update.htm" method="POST" commandName="terapia">
            <fieldset>
                <label>Fecha: </label>
                <span>${terapia.getFechaDesc()}</span>
                <br>
                <label>Paciente: </label>
                <span>${terapia.getPacienteId().getNombre()}</span>
                <br>
                <label>Realizada</label>
                <frm:checkbox path="realizada"></frm:checkbox>
                    <br>
                    <label>Duraci&oacute;n</label>
                <frm:input path="duracion" type="number" min="5"></frm:input>
                    <br>
                    <label>Observaci&oacute;n: </label>
                <frm:textarea path="observacion"></frm:textarea>
                    <br>
                <frm:hidden path="terapiaId"></frm:hidden>
                    <button type="reset">
                        <a onclick="history.back()" style="text-decoration: none; color: black"/>Atr&aacute;s</a>
                </button>
                <button type="submit">Guardar</button>
            </div>
        </fieldset>
    </frm:form>
</body>
</html>

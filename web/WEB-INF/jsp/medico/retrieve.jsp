<%-- 
    Document   : create
    Created on : 20/06/2018, 10:59:18
    Author     : labctr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver M&eacute;dico</title>
    </head>
    <body>
        <h1>Datos del M&eacute;dico ${medico.getNombre()}</h1>
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
        <hr>
        <h2>Terapias</h2>
        <table>
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Paciente</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${medico.getTerapiaList()}" var="terapia">
                <tr>
                    <td>${terapia.getFechaDesc()}</td>
                    <td>${terapia.getPacienteId().getNombre()}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/terapia/update/${terapia.getTerapiaId()}.htm">
                            Actualizar
                        </a> | 
                        <a href="${pageContext.request.contextPath}/terapia/delete/${terapia.getTerapiaId()}.htm">
                            Eliminar
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <button type="reset">
            <a href="${pageContext.request.contextPath}/medico/list.htm" style="text-decoration: none; color: black"/>Atr&aacute;s</a>
    </button>
</body>
</html>

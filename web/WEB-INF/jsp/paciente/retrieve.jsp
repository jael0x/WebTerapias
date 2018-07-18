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
        <title>Ver Paciente</title>
    </head>
    <body>
        <h1>Datos del paciente ${paciente.getNombre()}</h1>
        </hr>
        <fieldset>
            <label>C&eacute;dula: </label>
            <span>${paciente.getCedula()}</span>
            </br>
            <label>Fecha de nacimiento: </label>
            <span>${paciente.getFechaMostrar()}</span>
            </br>
            <label>Estatura: </label>
            <span>${paciente.getEstatura()}</span>
            </br>
            <label>Peso: </label>
            <span>${paciente.getPeso()}</span>
        </fieldset>
        <hr>
        <h2>Terapias</h2>
        <table>
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>M&eacute;dico</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.terapias}" var="terapia">
                <tr>
                    <td>${terapia.getFechaDesc()}</td>
                    <td>${terapia.getMedicoId().getNombre()}</td>
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
            <a href="${pageContext.request.contextPath}/paciente/list.htm" style="text-decoration: none; color: black">Atr&aacute;s</a>
        </button>
    </body>
</html>

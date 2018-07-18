<%-- 
    Document   : list
    Created on : 25-jun-2018, 9:48:51
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Terapias</title>
    </head>
    <body>
        <h1>Listado de Terapias</h1>
        <hr>
        <table>
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Paciente</th>
                    <th>Medico</th>
                    <th>Realizada</th>
                    <th>
                        <a href="${pageContext.request.contextPath}/terapia/create.htm">Crear</a>
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.terapias}" var="t">
                    <tr>
                        <td>
                            ${t.getFechaDesc()}
                        </td>
                        <td>
                            ${t.getPacienteId().getNombre()}
                        </td>
                        <td>
                            ${t.getMedicoId().getNombre()}
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${t.getRealizada()}">
                                    <input type="checkbox" disabled checked>
                                </c:when>    
                                <c:otherwise>
                                    <input type="checkbox" disabled>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/terapia/update/${t.getTerapiaId()}.htm">Ver</a> |
                            <a href="${pageContext.request.contextPath}/terapia/delete/${t.getTerapiaId()}.htm">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button type="reset">
            <a href="${pageContext.request.contextPath}/index.htm" style="text-decoration: none; color: black">Atr&aacute;s</a>
        </button>
    </body>
</html>

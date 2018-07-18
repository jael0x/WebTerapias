<%-- 
    Document   : list
    Created on : 25-jun-2018, 9:49:08
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>M&eacute;dicos</title>
    </head>
    <body>
        <h1>Listado de M&eacute;dicos</h1>
        <hr>
        <table>
            <thead>
                <tr>
                    <th>C&eacute;dula</th>
                    <th>Nombre</th>
                    <th>Correo</th>
                    <th>C&oacute;digo</th>
                    <th>
                        <a href="${pageContext.request.contextPath}/medico/create.htm">Crear</a>
                    </th>
                    <!--Completar resto de datos-->
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.medicos}" var="m">
                    <tr>
                        <td>
                            ${m.getCedula()}
                        </td>
                        <td>
                            ${m.getNombre()}
                        </td>
                        <td>
                            ${m.getCorreo()}
                        </td>
                        <td>
                            ${m.getCodigo()}
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/medico/retrieve/${m.getMedicoId()}.htm">Ver</a> |
                            <a href="${pageContext.request.contextPath}/medico/update/${m.getMedicoId()}.htm">Editar</a> |
                            <a href="${pageContext.request.contextPath}/medico/delete/${m.getMedicoId()}.htm">Eliminar</a>
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

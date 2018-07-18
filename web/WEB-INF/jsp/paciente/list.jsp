<%-- 
    Document   : list
    Created on : 25-jun-2018, 9:48:51
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pacientes</title>
    </head>
    <body>
        <h1>Listado de Pacientes</h1>
        <hr>
        <table>
            <thead>
                <tr>
                    <th>C&eacute;dula</th>
                    <th>Nombre</th>
                    <th>Fecha de Nacimiento</th>
                    <th>Estatura</th>
                    <th>Peso</th>
                    <th>
                        <a href="${pageContext.request.contextPath}/paciente/create.htm">Crear</a>
                    </th>
                    <!--completar con otros datos-->
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.pacientes}" var="p">
                    <tr>
                        <td>
                            ${p.getCedula()}
                        </td>
                        <td>
                            ${p.getNombre()}
                        </td>
                        <td>
                            ${p.getFechaMostrar()}
                        </td>
                        <td>
                            ${p.getEstatura()}
                        </td>
                        <td>
                            ${p.getPeso()}
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/paciente/retrieve/${p.getPacienteId()}.htm">Ver</a> |
                            <a href="${pageContext.request.contextPath}/paciente/update/${p.getPacienteId()}.htm">Editar</a> |
                            <a href="${pageContext.request.contextPath}/paciente/delete/${p.getPacienteId()}.htm">Eliminar</a>
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

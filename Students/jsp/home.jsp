<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.baibalaeva.javaEE.Student" %><%--
  Created by IntelliJ IDEA.
  User: sultanbekkenzhakhimov
  Date: 12.11.2022
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HOME</title>
</head>
<body>
<table border="1">
    <%
        ArrayList<Student> list = (ArrayList<Student>) request.getAttribute("list");
        if(list != null){
            for(Student student : list){
    %>
    <tr>

        <td><%=student.getName()%></td>
        <td><%=student.getSurname()%></td>
        <td><%=student.getBirthdate()%></td>
        <td><%=student.getCity()%></td>
        <td><a href="/details?id=<%=student.getId()%>">DETAILS</a></td>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>


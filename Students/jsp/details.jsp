<%@ page import="kz.baibalaeva.javaEE.Student" %><%--
  Created by IntelliJ IDEA.
  User: sultanbekkenzhakhimov
  Date: 12.11.2022
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>DETAILS</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<%
  Student student = (Student) request.getSession().getAttribute("student");
  if(student != null){
%>
<label>NAME</label>
<div><%=student.getName()%></div>
<label>SURNAME</label>
<div><%=student.getSurname()%></div>
<label>BIRTHDATE</label>
<div><%=student.getBirthdate()%></div>
<label>CITY</label>
<div><%=student.getCity()%></div>

<%
  }
%>
<form action="/edit" method="get">
<input type="hidden" value="<%=student.getId()%>" name="id">
  <button class="btn btn-primary"> EDIT</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>


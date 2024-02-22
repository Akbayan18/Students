<%@ page import="kz.baibalaeva.javaEE.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>

<div class="mainDiv">
    <%
        Student student = (Student) request.getSession().getAttribute("student");

    %>
    <form action="/edit" method="post">
        <div class="mb-3">
            <label for="exampleInputId" class="form-label"></label>
            <input type="hidden" class="form-control" id="exampleInputId" aria-describedby="emailHelp" value="<%=student.getId()%>" name="id">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">NAME</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=student.getName()%>" name="name">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">SURNAME</label>
            <input type="text" class="form-control" id="exampleInputPassword1" value="<%=student.getSurname()%>" name="surname">
        </div>
        <div class="mb-3">
            <label for="exampleInputAA" class="form-label">BIRTHDATE</label>
            <input type="date" class="form-control" id="exampleInputAA" value="<%=student.getBirthdate()%>" name="birthdate">
        </div>
        <div class="mb-3">
            <label for="exampleInputAAA" class="form-label">CITY</label>
            <input type="text" class="form-control" id="exampleInputAAA" value="<%=student.getCity()%>" name="city">
        </div>
        <button type="submit" class="btn btn-primary">Save</button>

    </form>

    <form action="/delete" method="post">
        <div class="mb-3">
            <label for="exampleInputId2" class="form-label">ID</label>
            <input type="hidden" class="form-control" id="exampleInputId2" aria-describedby="emailHelp" value="<%=car.getId()%>" name="id">
        </div>
        <button type="submit" class="btn btn-primary">Delete</button>
    </form>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>


<%@ page import="dto.FacultyDto" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.DepartmentDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>
    <link rel="stylesheet" type="text/css" href="../Css/admin.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="./checkUser.jsp"/>
<form action="/login" method="get">
    <input type="submit" value="Logout">
</form>
<%
    FacultyDto facultyDto = (FacultyDto) session.getAttribute("faculty");
    List<DepartmentDto> list = (List<DepartmentDto>) session.getAttribute("departments");
%>
<div class="container">
    <h2>Dynamic Tabs</h2>
    <p>To make the tabs toggleable, add the data-toggle="tab" attribute to each link. Then add a .tab-pane class with a
        unique ID for every tab and wrap them inside a div element with class .tab-content.</p>

    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
        <li><a data-toggle="tab" href="#menu1">Departments</a></li>
        <li><a data-toggle="tab" href="#menu2">Professors</a></li>
        <li><a data-toggle="tab" href="#menu3">Students</a></li>
        <li><a data-toggle="tab" href="#menu4">Faculty Info</a></li>
    </ul>
    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <h3>HOME</h3>
            <p>${message}</p>
        </div>
        <div id="menu1" class="tab-pane fade">
            <h3>Departments</h3>
            <div class="div2">
                <form action="/departments" method="post">
                    <div class="wrapper">
                        <label>Name</label> <input type="text" name="name">
                    </div>
                    <input type="hidden" name=hiddenIdFaculty
                           value=<%=facultyDto == null ? "" : facultyDto.getId()%>>
                    <button type="submit">Submit</button>
                </form>
                <div align="center">
                    <table  class="table">
                        <caption>
                            <h2>List of departmens</h2>
                        </caption>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Faculty</th>
                            <th scope="col">Action</th>
                        </tr>
                        <%
                            for (DepartmentDto departmentDto : list) {
                        %>
                        <tr>
                            <td><%=departmentDto.getId()%>
                            </td>
                            <td><%=departmentDto.getName()%>
                            </td>
                            <td><%=facultyDto.getName()%>
                            </td>
                            <td>
                                <form action="/departments" method="get">
                                    <button class="btn btn-danger" type="submit">Delete</button>
                                    <input type="hidden" value="<%=departmentDto.getId()%>" name="idDepartment">
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <div id="menu2" class="tab-pane fade">
            <h3>Menu 2</h3>
            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam
                rem aperiam.</p>
        </div>
        <div id="menu3" class="tab-pane fade">
            <h3>Menu 3</h3>
            <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
        </div>
        <div id="menu4" class="tab-pane fade">
            <div>
                <h1>Faculty Info</h1>
                <label>Faculty name:<span class="spanName"><%=facultyDto.getName()%></span></label>
                <label>Faculty address:<span class="spanName"><%=facultyDto.getAddress()%></span></label>
                <form action="/faculty" method="post">
                    <div class="wrapper">
                        <label>Name of faculty</label> <input type="text" name="name"
                                                              value=<%=facultyDto == null ? "" : facultyDto.getName()%>>
                    </div>
                    <div class="wrapper">
                        <label>Address</label> <input type="text" name="address"
                                                      value=<%=facultyDto == null ? "" : facultyDto.getAddress()%>>
                    </div>
                    <input type="hidden" name="hiddenId"
                           value=<%=facultyDto == null ? "" : facultyDto.getId()%>>
                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
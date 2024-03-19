<%@page import="org.jsp.todo_app.dto.Task"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
 <body>
    <h1 align="center">Home Page</h1>
    <% 
    List<Task> tasks = (List<Task>) request.getAttribute("tasks"); 
    %>
    <%
    if(!tasks.isEmpty()) {
    %>
    <div>
        <table>
            <thead>
                <tr>
                    <th>Task Image</th>
                    <th>Task Name</th>
                    <th>Task Description</th>
                    <th>Created Time</th>
                    <th>Status</th>
                    <th>Delete</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <%
            for(Task task : tasks) {
            %>
            <tbody>
                   <tr>
                    <td><img alt="image" src="data:image/png;base64,<%=task.getEncodeImage()%>"></td>
                    <td><%=task.getName() %></td>
                    <td><%=task.getDescription() %></td>
                    <td><%=task.getAddTime() %></td>
                    <td><%if(task.isStatus()) {%>
                    Completed<%}else{ %><a href="complete-task?id=<%=task.getId() %>"><button>Complete</button></a><%} %>
                    </td>
                    <td><a href="delete"><button>Delete</button></a></td>
                    <td><a href="edit"><button>Edit</button></a></td>
                </tr>
            </tbody>
            <%
            }
            %>
        </table>
    </div>
    <%
    }
    %>
    <div class="button">
        <a href="add-task.html"><button>ADD TASK</button></a>
        <form method="post" action="logout">
            <button type="submit">LOGOUT</button>
            <button>Edit</button>
            <button>Edit</button>
        </form>
    </div>
</body>
</html>
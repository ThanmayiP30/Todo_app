
<%@page import="org.jsp.todo_app.dto.Task"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
background-color: aliceblue;
}
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }

    th {
      background-color: #f2f2f2;
    }

    tr:hover {
      background-color: lightblue;
    }
    .id{
    display: flex;
    justify-content: space-around;
    align-items: center;
    }
    img{
    height: 80px;
    width: 80px;
    }
    .button{
     display: flex;
    justify-content: space-around;
    align-items: center;
    }
  </style>
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
                    <td><a href="delete?id=<%=task.getId()%>"><button>Delete</button></a></td>
                  
                    <td><a href="edit_task.jsp?id=<%=task.getId()%>" ><button>Edit</button></a></td>
                </tr>
            </tbody>
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
        <a href="add-task.html"><button  style="border: outset darkcyan;background-color: darkcyan;color: snow; margin-left: 60px; ">ADD TASK</button></a>
        <form method="post" action="logout">
            <button style="border: outset  red; margin-left: 160px; background-color:red; color: snow;" type="submit">LOGOUT</button>
        </form>
    </div>
</body>
</html>
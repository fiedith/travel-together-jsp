<%@ page import="java.util.List" %>
<%@ page import="hangout.user.User" %>
<%@ page import="hangout.user.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
</head>
<body>
    <h2>User List</h2>
    <table border="1">
        <tr>
            <th>User ID</th>
            <th>User Name</th>
            <th>User Gender</th>
            <th>User Age</th>
        </tr>
        <% 
            UserDao userDao = new UserDao();
            List<User> userList = userDao.getAllUsers(); // Assuming you have a method in UserDao to retrieve all users

            for (User user : userList) {
        %>
        <tr>
            <td><%= user.getUserId() %></td>
            <td><%= user.getUserName() %></td>
            <td><%= user.getUserGender() %></td>
            <td><%= user.getUserAge() %></td>
        </tr>
        <%
            }
            userDao.close(); // Close the connection when done
        %>
    </table>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Filter Demo</title>
  </head>
  <style>
    body {
      padding: 2rem;
    }

    .card {
      padding: 1rem;
      font-size: 1.4rem;
      background-color: lightblue;
      box-shadow: 1px 1px 2px gray;
      border-radius: 0.4rem;
    }

    .actions {
      padding: 2rem 0;
    }

    .demo {
      display: flex;
    }

    .demo form {
      width: 360px;
      margin-right: 1rem;
    }

    form div {
      display: flex;
      flex-direction: column;
      margin-bottom: 0.6rem;
    }

    form label {
      margin-bottom: 0.2rem;
    }

    input,
    select,
    button {
      padding: 0.4rem;
      border: 1px solid gray;
      outline: none;
      border-radius: 0.4rem;
    }

    button {
        color: black;
        background-color: transparent;
    }

    button:hover {
    	color: white;
      	background-color: darkgray;
    }
  </style>
  <body>
    <h1>Hello Filter</h1>

    <div class="actions">
      <% String hello = getServletContext().getContextPath().concat("/hello");
      %>
      <a href="<%=hello%>">Hello Servlet</a>
    </div>
    <% if (request.getAttribute("message") != null) { %>
    <div class="card"><%=request.getAttribute("message")%></div>
    <% } %>

    <h3>Using Filter</h3>

    <div class="demo">
         <% String loginUrl = getServletContext().getContextPath().concat("/login");
      %>
      <form action="<%=loginUrl %>" method="post" class="card">
        <h3>Employee Home</h3>
        <input type="hidden" name="home" value="employee" />
        <div>
          <label>Name</label>
          <input type="text" name="name" placeholder="Enter Name" />
        </div>
        <div>
          <label>Role</label>
          <select name="role">
            <option value="">Select One</option>
            <option value="Employee">Employee</option>
            <option value="Manager">Manager</option>
          </select>
        </div>
        <div>
          <button type="submit">Login</button>
        </div>
      </form>
      <form action="<%=loginUrl %>" method="post" class="card">
        <h3>Manger Home</h3>
        <input type="hidden" name="home" value="manager" />
        <div>
          <label>Name</label>
          <input type="text" name="name" placeholder="Enter Name" />
        </div>
        <div>
          <label>Role</label>
          <select name="role">
            <option value="">Select One</option>
            <option value="Employee">Employee</option>
            <option value="Manager">Manager</option>
          </select>
        </div>
        <div>
          <button type="submit">Login</button>
        </div>
      </form>
    </div>
  </body>
</html>

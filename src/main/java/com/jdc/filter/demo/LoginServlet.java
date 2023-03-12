package com.jdc.filter.demo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({
	"/login",
	"/logout"
})
public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var session = req.getSession(true);
		session.invalidate();
		resp.sendRedirect(getServletContext().getContextPath().concat(String.format("/index.jsp")));
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.logout();
		
		var name = req.getParameter("name");
		var role = req.getParameter("role");
		
		if(null != role && !role.isEmpty()) {
			var session = req.getSession(true);
			session.setAttribute("user", name);
			session.setAttribute("role", role);
		}
		var home = req.getParameter("home");
		resp.sendRedirect(getServletContext().getContextPath().concat(String.format("/%s/home", home)));
	}
}

package com.jdc.filter.demo;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

@WebFilter("/manager/*")
public class ManagerFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		var session = req.getSession(true);
		
		var user = (String)session.getAttribute("user");
		var role = (String)session.getAttribute("role");
		
		if(null != user && null != role && "Manager".equals(role)) {
			chain.doFilter(request, response);
		} else {
			req.setAttribute("message", "This page is manager only page");
			req.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

}

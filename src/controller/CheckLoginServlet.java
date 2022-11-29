package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BEAN.User;
import model.BO.LoginBO;

@WebServlet("/checklogin")
public class CheckLoginServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		LoginBO loginBO = new LoginBO();
		
		if(loginBO.isCorrectLoginInfo(userName, password)) {
			HttpSession session = request.getSession();
			User user = loginBO.getUserInfo(userName);
			session.setAttribute("username", user.getUserName());
			session.setAttribute("position", user.getPosition());
			session.setAttribute("name", user.getName());
			response.sendRedirect("lietkedethi");
			//getServletContext().getRequestDispatcher(destination).forward(request, response);
		}
		else {
			response.sendRedirect("login.jsp?err=1");
		}
	}
}

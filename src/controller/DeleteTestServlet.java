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
import model.BO.TestBO;

@WebServlet("/deletetest")
public class DeleteTestServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String pos = (String)request.getSession().getAttribute("position");
		if(pos.equals("admin")) {
			int testID = Integer.valueOf((String)request.getParameter("testid"));
			new TestBO().deleteTest(testID);
		}
		response.sendRedirect("lietkedethi");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doGet(request, response);
	}
}

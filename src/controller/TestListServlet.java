package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BEAN.Test;
import model.BO.TestBO;

@WebServlet("/lietkedethi")
public class TestListServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ArrayList<Test> testList = new TestBO().getAllTest();
		//sinh viên làm bài thi, giáo viên xem bài thi
		request.setAttribute("useraction", request.getSession().getAttribute("position").equals("student") ? "Làm bài" : "Xem chi tiết");
		request.setAttribute("testlist", testList);
		getServletContext().getRequestDispatcher("/lietkedethi.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		
		
	}
}

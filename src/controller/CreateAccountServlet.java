package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BEAN.Login;
import model.BEAN.User;
import model.BO.PersonalInfoBO;

@WebServlet("/taotaikhoan")
public class CreateAccountServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(request.getParameter("err") != null) {
			String msg = request.getParameter("err").equals("1") ? "Tên tài khoản đã tồn tại" : "Mã số sinh viên đã tồn tại";
			request.setAttribute("err", msg);
		}
		else if (request.getParameter("success") != null) {
			String msg = "Tạo tài khoản thành công";
			request.setAttribute("success", msg);
		}
		
		getServletContext().getRequestDispatcher("/taotaikhoan.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String code = request.getParameter("mssv");
		String position = request.getParameter("position");
		
		User user = new User();
		Login login = new Login();
		user.setUserName(userName);
		user.setCode(code);
		user.setPosition(position);
		login.setUserName(userName);
		login.setPassword(password);
		PersonalInfoBO personalInfoBO = new PersonalInfoBO();
		
		if(personalInfoBO.isExistingUsername(userName)) {
			response.sendRedirect("taotaikhoan?err=1");
		}
		else if(personalInfoBO.isExistingMSSV(code)) {
			response.sendRedirect("taotaikhoan?err=2");
		} else {
			personalInfoBO.createAccount(user, login);
			response.sendRedirect("taotaikhoan?success=1");
		}
		
		
	}
}

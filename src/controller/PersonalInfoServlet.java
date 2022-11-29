package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BEAN.User;
import model.BO.LoginBO;
import model.BO.PersonalInfoBO;

@WebServlet("/thongtincanhan")
public class PersonalInfoServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		User userInfo = null;
		if(username != null) {
			userInfo = new PersonalInfoBO().getPersonalInfo(username);
		}
		if (userInfo != null) {
			request.setAttribute("name", userInfo.getName());
			request.setAttribute("code", userInfo.getCode());
			request.setAttribute("class", userInfo.getClassName());
			request.setAttribute("faculty", userInfo.getFaculty());
			request.setAttribute("gender", userInfo.isGender());
		}
		if(request.getParameter("err") != null) {
			String msg;
			msg = request.getParameter("err").equals("1") ? "Xác nhận mật khẩu không khớp" : "Mật khẩu không chính xác";
			request.setAttribute("err", msg);
		}
		else if(request.getParameter("success") != null) {
			String msg;
			msg = request.getParameter("success").equals("1") ? "Lưu thông tin thành công" : "Đổi mật khẩu thành công";
			request.setAttribute("success", msg);
		}
		getServletContext().getRequestDispatcher("/thongtincanhan.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("change-info-submit-btn") != null) {
			User userInfo = new User();
			userInfo.setUserName((String)request.getSession().getAttribute("username"));
			userInfo.setName((String)request.getParameter("name"));
			userInfo.setClassName((String)request.getParameter("class"));
			userInfo.setFaculty((String)request.getParameter("faculty"));
			userInfo.setGender(((String)request.getParameter("gender")).equals("male") ? true : false);
			new PersonalInfoBO().updatePersonalInfo(userInfo);
			response.sendRedirect("thongtincanhan?success=1");
		}
		else if (request.getParameter("change-password-submit-btn") != null) {
			String password = request.getParameter("current-password");
			String newPassword = request.getParameter("new-password");
			String newPassword2 = request.getParameter("new-password2");
			if(!newPassword.equals(newPassword2)) 
				response.sendRedirect("thongtincanhan?err=1");
			else if(!new LoginBO().isCorrectLoginInfo((String)request.getSession().getAttribute("username"), password)) 
				response.sendRedirect("thongtincanhan?err=2");
			else {
				new PersonalInfoBO().changePassword((String)request.getSession().getAttribute("username"), newPassword);
				response.sendRedirect("thongtincanhan?success=2");
			}
		}
	}

}

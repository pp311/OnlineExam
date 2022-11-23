package model.BO;

import model.BEAN.User;
import model.DAO.LoginDAO;

public class LoginBO {
	public boolean isCorrectLoginInfo(String username, String password) {
		LoginDAO loginDAO = new LoginDAO();	
		return loginDAO.isCorrectLoginInfo(username, password);
	}
	public User getUserInfo(String username) {
		LoginDAO loginDAO = new LoginDAO();	
		return loginDAO.getUserInfo(username);
	}
	
}

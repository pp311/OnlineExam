package model.BO;

import model.BEAN.User;
import model.DAO.PersonalInfoDAO;

public class PersonalInfoBO {
	public User getPersonalInfo(String username) {
		return new PersonalInfoDAO().getUserInfo(username);
	}
	
	public void updatePersonalInfo(User userInfo) {
		new PersonalInfoDAO().updateUserInfo(userInfo);
	}
	
	public void changePassword(String username, String password) {
		new PersonalInfoDAO().changePassword(username, password);
	}
}

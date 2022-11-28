package model.BEAN;

public class Login {
	private int idLogin;
	private String userName, password;
	public Login() {}
	public Login(int idLogin, String userName, String password) {
		super();
		this.idLogin = idLogin;
		this.userName = userName;
		this.password = password;
	}
	public int getIdLogin() {
		return idLogin;
	}
	public void setIdLogin(int idLogin) {
		this.idLogin = idLogin;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}

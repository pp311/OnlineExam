package model.BEAN;

public class User_Test {
	private int  idTest;
	private String userName;
	public User_Test() {}

	public User_Test(int idTest, String userName) {
		super();
		this.idTest = idTest;
		this.userName = userName;
	}

	public int getIdTest() {
		return idTest;
	}

	public void setIdTest(int idTest) {
		this.idTest = idTest;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String username) {
		this.userName = username;
	}
	
}

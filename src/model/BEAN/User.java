package model.BEAN;

public class User {
	private String userName, name, code, className, faculty, position;
	private boolean gender;
	public User() {}
	public User(String userName, String name, String code, String className, String faculty, String position,
			boolean gender) {
		super();
		this.userName = userName;
		this.name = name;
		this.code = code;
		this.className = className;
		this.faculty = faculty;
		this.position = position;
		this.gender = gender;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getFaculty() {
		return faculty;
	}
	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	
}

package model.BEAN;

import java.sql.Timestamp;

public class Result {
	private int idResult, idTest;
	private double grade;
	private Timestamp submitTime;
	private String userName;
	public Result() {}
	public Result(int idResult, int idTest, double grade, Timestamp submitTime, String userName) {
		super();
		this.idResult = idResult;
		this.idTest = idTest;
		this.grade = grade;
		this.submitTime = submitTime;
		this.userName = userName;
	}
	public int getIdResult() {
		return idResult;
	}
	public void setIdResult(int idResult) {
		this.idResult = idResult;
	}
	public int getIdTest() {
		return idTest;
	}
	public void setIdTest(int idTest) {
		this.idTest = idTest;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public Timestamp getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(Timestamp submitTime) {
		this.submitTime = submitTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}

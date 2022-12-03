package model.BEAN;

import java.sql.Timestamp;

public class LichSuLamBai {
	private int idResult;
	private String userName;
	private double grade;
	private Timestamp submitTime;
	private String testName;
	
	public LichSuLamBai() {}
	public LichSuLamBai(int idrs,String us,double grade,Timestamp submit,String testName) {
		this.setIdResult(idrs);
		this.setUserName(us);
		this.setGrade(grade);
		this.submitTime = submit;
		this.testName = testName;
	}
	public int getIdResult() {
		return idResult;
	}
	public void setIdResult(int idResult) {
		this.idResult = idResult;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	
}
 

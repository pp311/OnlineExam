package model.BEAN;

import java.sql.Timestamp;

public class ViewTest {
		private String userName, name;
		private double grade;
		private Timestamp submitTime;
		private int IDResult;
		public ViewTest() {}
		public ViewTest(String userName, String name,double grade, Timestamp submitTime, int idResult) {
			super();
			this.userName = userName;
			this.name = name;
			this.grade = grade;
			this.submitTime = submitTime;
			this.IDResult = idResult;
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
		public int getIDResult() {
			return IDResult;
		}
		public void setIDResult(int iDResult) {
			IDResult = iDResult;
		}
		
}

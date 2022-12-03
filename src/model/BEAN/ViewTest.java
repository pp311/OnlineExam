package model.BEAN;

import java.sql.Timestamp;

public class ViewTest {
		private String userName, name;
		private double grade;
		private Timestamp submitTime;
		public ViewTest() {}
		public ViewTest(String userName, String name,double grade, Timestamp submitTime) {
			super();
			this.userName = userName;
			this.name = name;
			this.grade = grade;
			this.submitTime = submitTime;
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
		
}

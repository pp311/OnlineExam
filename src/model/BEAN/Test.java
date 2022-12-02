package model.BEAN;
import java.sql.Timestamp;

public class Test {
	private int idTest, numberQuestion;
	private int time;
	private Timestamp dateTest;
	private String testName, subject;
	public Test() {}
	public Test(int idTest, int numberQuestion, int time, Timestamp dateTest, String testName) {
		super();
		this.idTest = idTest;
		this.numberQuestion = numberQuestion;
		this.time = time;
		this.dateTest = dateTest;
		this.testName = testName;
	}
	public int getIdTest() {
		return idTest;
	}
	public void setIdTest(int idTest) {
		this.idTest = idTest;
	}
	public int getNumberQuestion() {
		return numberQuestion;
	}
	public void setNumberQuestion(int numberQuestion) {
		this.numberQuestion = numberQuestion;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public Timestamp getDateTest() {
		return dateTest;
	}
	public void setDateTest(Timestamp dateTest) {
		this.dateTest = dateTest;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	
	public String toString() {
		return "" + idTest + ", " + numberQuestion + ", " + time + ", " + dateTest.toString() + ", " + testName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
}

package model.BEAN;
import java.sql.Timestamp;

public class Test {
	private int idTest, numberQuestion, timeInMinutes;
	private Timestamp dateTest;
	private String testName;
	
	public Test() {
		
	}
	public Test(int idTest, int numberQuestion, int timeInMinutes, Timestamp dateTest, String testName) {
		this.idTest = idTest;
		this.numberQuestion = numberQuestion;
		this.timeInMinutes = timeInMinutes;
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
	public int getTimeInMinutes() {
		return timeInMinutes;
	}
	public void setTimeInMinutes(int timeInMinutes) {
		this.timeInMinutes = timeInMinutes;
	}
	
	public String toString() {
		return "" + idTest + ", " + numberQuestion + ", " + timeInMinutes + ", " + dateTest.toString() + ", " + testName;
	}
}

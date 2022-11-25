package model.BEAN;
import java.sql.Time;
import java.sql.Timestamp;

public class Test {
	private int idTest, numberQuestion, timeInMinutes;
	private Time time;
	private Timestamp dateTest;
	private String testName;
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
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
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
	public int getTimeInMinutes() {
		return timeInMinutes;
	}
	public void setTimeInMinutes(int timeInMinutes) {
		this.timeInMinutes = timeInMinutes;
	}
	
	
}

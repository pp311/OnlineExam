package model.BEAN;

public class Question {
	private int idQuestion, idTest;
	private String content;
	private boolean multiChoice;
	public int getIdQuestion() {
		return idQuestion;
	}
	public void setIdQuestion(int idQuestion) {
		this.idQuestion = idQuestion;
	}
	public int getIdTest() {
		return idTest;
	}
	public void setIdTest(int idTest) {
		this.idTest = idTest;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isMultiChoice() {
		return multiChoice;
	}
	public void setMultiChoice(boolean multiChoice) {
		this.multiChoice = multiChoice;
	}
	
	
	

}

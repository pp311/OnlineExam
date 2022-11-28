package model.BEAN;

public class Answer {
	private int idAnswer, idQuestion;
	private String content;
	private boolean isCorrectAnswer;
	public Answer() {
		
	}
	public Answer(int idAnswer, int idQuestion, String content, boolean isCorrectAnswer) {
		super();
		this.idAnswer = idAnswer;
		this.idQuestion = idQuestion;
		this.content = content;
		this.isCorrectAnswer = isCorrectAnswer;
	}
	public int getIdAnswer() {
		return idAnswer;
	}
	public void setIdAnswer(int idAnswer) {
		this.idAnswer = idAnswer;
	}
	public int getIdQuestion() {
		return idQuestion;
	}
	public void setIdQuestion(int idQuestion) {
		this.idQuestion = idQuestion;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isCorrectAnswer() {
		return isCorrectAnswer;
	}
	public void setCorrectAnswer(boolean isCorrectAnswer) {
		this.isCorrectAnswer = isCorrectAnswer;
	}
	
	
}

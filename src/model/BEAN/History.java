package model.BEAN;

public class History {
	private int idResult, idAnswer;
	public History() {}

	public History(int idResult, int idAnswer) {
		super();
		this.idResult = idResult;
		this.idAnswer = idAnswer;
	}

	public int getIdResult() {
		return idResult;
	}

	public void setIdResult(int idResult) {
		this.idResult = idResult;
	}

	public int getIdAnswer() {
		return idAnswer;
	}

	public void setIdAnswer(int idAnswer) {
		this.idAnswer = idAnswer;
	}
	
}

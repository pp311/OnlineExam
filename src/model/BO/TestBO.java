package model.BO;

import java.util.ArrayList;
import java.util.List;

import model.BEAN.Answer;
import model.BEAN.History;
import model.BEAN.Question;
import model.BEAN.Result;
import model.BEAN.Test;
import model.DAO.TestDAO;

public class TestBO {
	public ArrayList<Test> getAllTest() {
		return new TestDAO().getAllTest();
		
	}
	public Test getTest(int TestID) {
		return new TestDAO().getTest(TestID);
	}
	public List<Question> getQuestions(int TestID) {
		return new TestDAO().getQuestions(TestID);
	}
	public List<Answer> getAnswers(List<Question> listQ) {
		return new TestDAO().getAnswers(listQ);
	}
	public boolean AddTest(Test test, List<Question> questions, List<Answer> answers) {
		TestDAO td = new TestDAO();
		return td.AddTest(test, questions, answers);
	}
	public boolean AddResult(Result rs, List<History> listH) {
		TestDAO td = new TestDAO();
		return td.AddResult(rs, listH);
	}
}

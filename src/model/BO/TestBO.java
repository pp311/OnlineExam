package model.BO;

import java.util.ArrayList;
import java.util.List;

import model.BEAN.Answer;
import model.BEAN.Question;
import model.BEAN.Test;
import model.DAO.TestDAO;

public class TestBO {
	public ArrayList<Test> getAllTest() {
		return new TestDAO().getAllTest();
		
	}
	public boolean AddTest(Test test, List<Question> questions, List<Answer> answers) {
		TestDAO td = new TestDAO();
		return td.AddTest(test, questions, answers);
	}
}

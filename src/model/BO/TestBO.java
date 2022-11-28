package model.BO;

import java.util.ArrayList;

import model.BEAN.Test;
import model.DAO.TestDAO;

public class TestBO {
	public ArrayList<Test> getAllTest() {
		return new TestDAO().getAllTest();
		
	}
}

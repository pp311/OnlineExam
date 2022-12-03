package model.BO;

import java.util.ArrayList;

import model.BEAN.ViewTest;
import model.DAO.ViewTestDAO;

public class ViewTestBO {
	ViewTestDAO dao = new ViewTestDAO();
	public ArrayList<ViewTest> getAllSVByID(int IDTest) {
		return dao.getAllSVByID(IDTest);
	}
}

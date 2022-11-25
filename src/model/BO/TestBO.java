package model.BO;

import java.util.ArrayList;

import model.BEAN.Test;
import model.DAO.TestDAO;

public class TestBO {
	public ArrayList<Test> getAllTest() {
		ArrayList<Test> list = new TestDAO().getAllTest();
		for(int i = 0; i < list.size(); i++) {
			String[] hourMin = list.get(i).getTime().toString().split(":");
			int hour = Integer.parseInt(hourMin[0]);
		    int mins = Integer.parseInt(hourMin[1]);
		    list.get(i).setTimeInMinutes(hour * 60 + mins);
		}
		return list;
	}
}

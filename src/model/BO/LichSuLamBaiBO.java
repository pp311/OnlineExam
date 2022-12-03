package model.BO;

import java.util.ArrayList;

import model.BEAN.LichSuLamBai;
import model.DAO.LichSuLamBaiDAO;

public class LichSuLamBaiBO {
	LichSuLamBaiDAO dao = new LichSuLamBaiDAO();
	public ArrayList<LichSuLamBai> getAllKq(String userName){
		return dao.getAllKq(userName);
	}
	
}

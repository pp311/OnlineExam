package model.DAO;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.BEAN.LichSuLamBai;
import model.BEAN.Result;
import model.BEAN.Test;

public class LichSuLamBaiDAO {
	
	private PreparedStatement ps;
	private PreparedStatement ps1;
	public ArrayList<LichSuLamBai> getAllKq(String userName) {
		ArrayList<LichSuLamBai> kq = new ArrayList<LichSuLamBai>();

		try {
			String sql = "SELECT IDResult,Username,Grade,SummitTime,TestName FROM result INNER JOIN test ON result.IDTest = test.IDTest WHERE Username = ?";
			String sql1 = "SELECT Name FROM user WHERE Username = ?";
			Connection db = DBConnection.getInstance().getConection();
			ps = db.prepareStatement(sql);
			ps.setString(1,userName);
			ps1 = db.prepareStatement(sql1);
			ps1.setString(1,userName);
			ResultSet rs = ps.executeQuery();
			ResultSet rs1 = ps1.executeQuery();
			while(rs.next()&&rs1.next()) {
				kq.add(new LichSuLamBai(rs.getInt(1),rs.getString(2),rs.getDouble(3),rs.getTimestamp(4),rs.getString(5),rs1.getString(1)));
				}
		} catch (SQLException e) {
			System.out.println("Co loi xay ra lay thong tin tu database (TestDAO)");
			System.out.println(e);
			return null;
		}
		return kq;
	}
	public static void main(String[] args) {
		LichSuLamBaiDAO dao = new LichSuLamBaiDAO();
		System.out.println(dao.getAllKq("admin1").size());
	}
}

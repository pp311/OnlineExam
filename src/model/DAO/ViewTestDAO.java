package model.DAO;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.BEAN.ViewTest;
import model.BEAN.Result;
import model.BEAN.Test;

public class ViewTestDAO {
	
	private PreparedStatement ps;
	public ArrayList<ViewTest> getAllSVByID(int IDTest) {
		ArrayList<ViewTest> kq = new ArrayList<ViewTest>();

		try {
			String sql = "SELECT result.Username,Name,Grade,SummitTime,IDResult FROM result INNER JOIN user ON result.Username = user.Username WHERE IDTest = ?";
			Connection db = DBConnection.getInstance().getConection();
			ps = db.prepareStatement(sql);
			ps.setInt(1,IDTest);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				kq.add(new ViewTest(rs.getString(1),rs.getString(2),rs.getDouble(3),rs.getTimestamp(4),rs.getInt(5)));
				}
		} catch (SQLException e) {
			System.out.println("Co loi xay ra lay thong tin tu database (ViewTestDAO)");
			System.out.println(e);
			return null;
		}
		return kq;
	}
	
}

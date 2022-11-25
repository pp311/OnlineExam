package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.BEAN.Test;

public class TestDAO {
	private PreparedStatement ps;
	public ArrayList<Test> getAllTest() {
		ArrayList<Test> result = new ArrayList<Test>();
		try {
			String sql = "select * from test";
			Connection db = DBConnection.getInstance().getConection();
			ps = db.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Test t = new Test();
				t.setIdTest(rs.getInt("IDTest"));
				t.setTestName(rs.getString("TestName"));
				t.setNumberQuestion(rs.getInt("NumberQuestion"));
				t.setTime(rs.getTime("Time"));
				t.setDateTest(rs.getTimestamp("DateTest"));
				result.add(t);
			}
		} catch (SQLException e) {
			System.out.println("Co loi xay ra lay thong tin tu database (TestDAO)");
			System.out.println(e);
			return null;
		}
		return result;
	}
}

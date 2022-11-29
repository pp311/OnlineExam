package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.BEAN.Answer;
import model.BEAN.Question;
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
	public void AddTest(Test test, List<Question> questions, List<Answer> answers) {
		try {
			Connection db = DBConnection.getInstance().getConection();
			String sql = "INSERT INTO `test`(`DateTest`, `NumberQuestion`, `Time`, `TestName`) "
			+ "VALUES ('" + test.getDateTest().toString() + "','" +
					test.getNumberQuestion() + "','" + test.getTimeInMinutes() + "','" + test.getTestName() + "')";
			System.out.println(sql);
			ps = db.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			int rs = ps.executeUpdate();
			ps.next();
			int TestID = ps.getGeneratedKeys().getInt(1);
			
			System.out.println(TestID);
		}
		catch (SQLException e) {
			System.out.println("Co loi xay ra khi them de!");
			System.out.println(e);
		}
	}
}

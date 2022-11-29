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
				t.setTime(rs.getInt("Time"));
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
	public boolean AddTest(Test test, List<Question> questions, List<Answer> answers) {
		try {
			Connection db = DBConnection.getInstance().getConection();
			String sql = "INSERT INTO `test`(`DateTest`, `NumberQuestion`, `Time`, `TestName`) "
			+ "VALUES (?,?,?,?)";
			
			ps = db.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setTimestamp(1, test.getDateTest());
			ps.setInt(2, test.getNumberQuestion());
			ps.setInt(3, test.getTime());
			ps.setString(4, test.getTestName());
			
			int add = ps.executeUpdate();
			if(add == 0) return false;

			ResultSet rs = ps.getGeneratedKeys();	//return set row (first row contain generate keys)
			rs.next();								//jump to first row
			int TestID = rs.getInt(1);				//get column 1 is column id
			
			int count = 0;
			for(int i = 0; i < questions.size(); i++) {
				sql = "INSERT INTO `question`(`Content`, `MultiChoice`, `IDTest`) VALUES (?,?,?)";
				ps = db.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, questions.get(i).getContent());
				ps.setBoolean(2, questions.get(i).isMultiChoice());
				ps.setInt(3, TestID);

				add = ps.executeUpdate();
				if(add == 0) return false;
				
				rs = ps.getGeneratedKeys();	
				rs.next();								
				int QuestionID = rs.getInt(1);
				System.out.println(QuestionID);
				
				Answer ans = answers.get(count++);
				sql = "INSERT INTO `answer`(`Content`, `IsCorrectAnswer`, `IDQuestion`) VALUES ";
				while(ans.getIdQuestion() == i+1) {
					sql += "('" + ans.getContent() + "'," +
							ans.isCorrectAnswer() + "," +
							QuestionID +"),";
					if(count >= answers.size()) break;
					ans = answers.get(count++);
				};
				count--;
				
				sql = sql.substring(0, sql.length()-1);

				System.out.println(sql);
				ps = db.prepareStatement(sql);
				add = ps.executeUpdate();
				if(add == 0) return false;
			}	
						
			System.out.println(TestID);
			return true;
		}
		catch (SQLException e) {
			System.out.println("Co loi xay ra khi them de!");
			System.out.println(e);
			return false;
		}
	}
}

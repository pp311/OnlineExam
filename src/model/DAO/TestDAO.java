package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.BEAN.Answer;
import model.BEAN.History;
import model.BEAN.Question;
import model.BEAN.Result;
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
	
	public Test getTest(int TestID) {
		try {
			Connection db = DBConnection.getInstance().getConection();
			String sql = "SELECT * FROM `test` WHERE `IDTest` = ?";
			
			ps = db.prepareStatement(sql);
			ps.setInt(1, TestID);
			
			ResultSet result = ps.executeQuery();
			if(result.next()) return new Test(result.getInt("IDTest"), result.getInt("NumberQuestion"),
					result.getInt("Time"), result.getTimestamp("DateTest"), result.getString("TestName"));

			return null;
		}
		catch (SQLException e) {
			System.out.println("Co loi xay ra khi lay de!");
			System.out.println(e);
			return null;
		}
	}
	
	public List<Question> getQuestions(int TestID) {
		try {
			List<Question> listQ = new ArrayList<Question>();
			
			Connection db = DBConnection.getInstance().getConection();
			String sql = "SELECT * FROM `question` WHERE `IDTest` = ?";
			
			ps = db.prepareStatement(sql);
			ps.setInt(1, TestID);
			
			ResultSet result = ps.executeQuery();
			
			while(result.next()) {
				listQ.add(new Question(result.getInt("IDQuestion"), result.getInt("IDTest"),
						result.getString("Content"), result.getBoolean("MultiChoice")));
			}
			
			return listQ;
		}
		catch (SQLException e) {
			System.out.println("Co loi xay ra khi lay cau hoi!");
			System.out.println(e);
			return null;
		}
	}
	
	public List<Answer> getAnswers(List<Question> listQ) {
		try {
			List<Answer> listA = new ArrayList<Answer>();
			
			Connection db = DBConnection.getInstance().getConection();
			
			for(int i = 0; i < listQ.size(); i++) {
				String sql = "SELECT * FROM `answer` WHERE `IDQuestion` = ?";
				
				ps = db.prepareStatement(sql);
				ps.setInt(1, listQ.get(i).getIdQuestion());
				
				ResultSet result = ps.executeQuery();
				
				while(result.next()) {
					listA.add(new Answer(result.getInt("IDAnswer"), result.getInt("IDQuestion"),
							result.getString("Content"), result.getBoolean("IsCorrectAnswer")));
				}				
				
			}
			
			return listA;
		}
		catch (SQLException e) {
			System.out.println("Co loi xay ra khi lay dap an!");
			System.out.println(e);
			return null;
		}
	}
	
	public Result getResult(int ResultID) {
		try {			
			Connection db = DBConnection.getInstance().getConection();
			String sql = "SELECT * FROM `result` WHERE `IDResult` = ?";
			
			ps = db.prepareStatement(sql);
			ps.setInt(1, ResultID);

			ResultSet result = ps.executeQuery();

			if(result.next()) {
				return new Result(result.getInt("IDResult"), result.getInt("IDTest"),
				result.getDouble("Grade"), result.getTimestamp("submitTime"), result.getString("userName"));
			}
			
			return null;
		}
		catch (SQLException e) {
			System.out.println("Co loi xay ra khi lay ket qua!");
			System.out.println(e);
			return null;
		}
	}
	
	public List<History> getHistories(int ResultID) {
		try {
			List<History> listH = new ArrayList<History>();
			
			Connection db = DBConnection.getInstance().getConection();
			
			String sql = "SELECT * FROM `history` WHERE `IDResult` = ?";
			
			ps = db.prepareStatement(sql);
			ps.setInt(1, ResultID);
			
			ResultSet result = ps.executeQuery();
			
			while(result.next()) {
				listH.add(new History(result.getInt("IDResult"), result.getInt("IDAnswer")));
			}	
			
			return listH;
		}
		catch (SQLException e) {
			System.out.println("Co loi xay ra khi lay lich su!");
			System.out.println(e);
			return null;
		}
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
	
	public boolean AddResult(Result rs, List<History> listH) {
		try {
			Connection db = DBConnection.getInstance().getConection();
			String sql = "INSERT INTO `result`(`Username`, `Grade`, `SummitTime`, `IDTest`) "
					+ "VALUES (?,?,?,?) ";
			
			ps = db.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, rs.getUserName());
			ps.setDouble(2, rs.getGrade());
			ps.setTimestamp(3, rs.getSubmitTime());
			ps.setInt(4, rs.getIdTest());
			
			int add = ps.executeUpdate();
			if(add == 0) return false;

			ResultSet resultSet = ps.getGeneratedKeys();	//return set row (first row contain generate keys)
			resultSet.next();								//jump to first row
			int ResultID = resultSet.getInt(1);				//get column 1 is column id
			
			for(int i = 0; i < listH.size(); i++) {
				sql = "INSERT INTO `history`(`IDResult`, `IDAnswer`) "
						+ "VALUES (?,?)";
				
				ps = db.prepareStatement(sql);
				ps.setInt(1, listH.get(i).getIdResult());
				ps.setInt(2, listH.get(i).getIdAnswer());

				add = ps.executeUpdate();
				if(add == 0) return false;
			}	
						
			System.out.println(ResultID);
			return true;
		}
		catch (SQLException e) {
			System.out.println("Co loi xay ra khi them ket qua!");
			System.out.println(e);
			return false;
		}
	}
}

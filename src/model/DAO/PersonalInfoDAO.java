package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.BEAN.Login;
import model.BEAN.User;

public class PersonalInfoDAO {
	private PreparedStatement ps;
	public User getUserInfo(String username) {
		try {
			String sql = "select * from user where Username = ? ";
			Connection db = DBConnection.getInstance().getConection();
			ps = db.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			User user = new User();
			user.setUserName(username);
			if(rs.next()) {
				user.setPosition(rs.getString("Position"));
				user.setClassName(rs.getString("Class") != null ? rs.getString("Class") : "");
				user.setCode(rs.getString("Code") != null ? rs.getString("Code") : "");
				user.setFaculty(rs.getString("Faculty") != null ? rs.getString("Faculty") : "");
				user.setGender(rs.getBoolean("Gender"));
				user.setName(rs.getString("Name") != null ? rs.getString("Name") : "");
				return user;
			}
		} catch (SQLException e) {
			System.out.println("Co loi xay ra lay thong tin tu database (PersonalInfoDAO)");
			System.out.println(e);
			return null;
		}
		return null;
	}
	
	public void updateUserInfo(User userInfo) {
		try {
		String sql = "update user set Name = ?, Class = ?, Faculty = ?, Gender = ? where Username = ?";
		Connection db = DBConnection.getInstance().getConection();
		ps = db.prepareStatement(sql);
		ps.setString(1, userInfo.getName());
		ps.setString(2, userInfo.getClassName());
		ps.setString(3, userInfo.getFaculty());
		ps.setInt(4, userInfo.isGender() ? 1 : 0);
		ps.setString(5, userInfo.getUserName());
		ps.execute();
		
	} catch (SQLException e) {
		System.out.println("Co loi xay ra cap nhat thong tin tu database (PersonalInfoDAO)");
		System.out.println(e);
	}
	
	}
	
	public void changePassword(String username, String password) {
		try {
			String sql = "update login set Password = ? where Username = ?";
			Connection db = DBConnection.getInstance().getConection();
			ps = db.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, username);
			ps.execute();
			
		} catch (SQLException e) {
			System.out.println("Co loi xay ra cap nhat thong tin tu database (PersonalInfoDAO)");
			System.out.println(e);
		}
	}
	
	public boolean isExistingAccount(String username) {
		try {
			String sql = "select * from user where Username = ?";
			Connection db = DBConnection.getInstance().getConection();
			ps = db.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		} catch (SQLException e) {
			System.out.println("Co loi xay ra cap nhat thong tin tu database (PersonalInfoDAO)");
			System.out.println(e);
			return false;
		}
		return false;
	}
	
	public boolean isExistingMSSV(String mssv) {
		try {
			String sql = "select * from user where Code = ?";
			Connection db = DBConnection.getInstance().getConection();
			ps = db.prepareStatement(sql);
			ps.setString(1, mssv);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		} catch (SQLException e) {
			System.out.println("Co loi xay ra cap nhat thong tin tu database (PersonalInfoDAO)");
			System.out.println(e);
			return false;
		}
		return false;
	}
	
	public void createAccount(User user, Login login) {
		try {
			String sql = "insert into user(Username, Code, Position) values(?,?,?)";
			Connection db = DBConnection.getInstance().getConection();
			ps = db.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getCode());
			ps.setString(3, user.getPosition());
			ps.execute();
			
			sql = "insert into login(Username, Password) values (?, ?)";
			ps = db.prepareStatement(sql);
			ps.setString(1, login.getUserName());
			ps.setString(2, login.getPassword());
			ps.execute();
		} catch (SQLException e) {
			System.out.println("Co loi xay ra cap nhat thong tin tu database (PersonalInfoDAO)");
			System.out.println(e);
		}
	}

}

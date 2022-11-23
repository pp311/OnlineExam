package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.BEAN.*;


public class LoginDAO {
	private PreparedStatement ps;
	public boolean isCorrectLoginInfo(String username, String password) {
		try {
			String sql = "select * from login where UserName = ? and Password = ?";
			Connection db = DBConnection.getInstance().getConection();
			ps = db.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Co loi xay ra khi dang nhap");
			return false;
		}
		return false;
	}
	
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
				user.setClassName(rs.getString("Class"));
				return user;
			}
		} catch (SQLException e) {
			System.out.println("Co loi xay ra khi dang nhap");
			return null;
		}
		return null;
	}
}

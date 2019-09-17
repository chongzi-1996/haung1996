package dao;

import java.sql.ResultSet;

public interface UserDao {
	ResultSet selectUserInfo(String username);
	int addUser(String username,String password,String age,String birthday,String phone);
	int updatePassword(String username,String password);
	int updateAddress(String username,String address);
	int updateInfo(String username,String age,String birthday,String phone,String email);
	int deleteUser(String username);
	boolean canAdd(String username);
}

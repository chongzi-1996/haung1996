package daoImpl;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.*;

public class User implements UserDao{
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	String username;
	String password;
	int age;
	String birthday;
	String phone;
	String email;

	public ResultSet selectUserInfo(String username) {
		dbUtil db=new dbUtil();
		String sql="select * from users where username='"+username+"'";
		ResultSet result=db.doQuery(sql);
		return result;
	}

	public int addUser(String username, String password, String age,String birthday, String phone) {
		dbUtil db=new dbUtil();
		String sql="insert into users (username,password,age,birthday,phone) values('"+username+"','"+password+"',"+age+",'"+birthday+"','"+phone+"')";
		System.out.println(sql);
		int result= db.doUpdate(sql);
		return result;
	}

	public int updatePassword(String username, String password) {
		dbUtil db=new dbUtil();
		String sql="update users set password='"+password+"' where username='"+username+"'";
		int result= db.doUpdate(sql);
		return result;
	}
	public int deleteUser(String username) {
		dbUtil db=new dbUtil();
		String sql="delete from users where username='"+username+"'";
		System.out.println(sql);
		int result= db.doUpdate(sql);
		return result;
		}

	public boolean canAdd(String username) {
		dbUtil db=new dbUtil();
		String sql="select username from users where username='"+username+"'";
		ResultSet result=db.doQuery(sql);
		boolean retval = true;
		try {
			while (result.next()) {
			retval=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(retval);
		return retval;
	}

	public int updateInfo(String username, String age, String birthday,String phone, String email) {
		dbUtil db=new dbUtil();
		String sql="update users set age="+age+",birthday='"+birthday+"',phone='"+phone+"',email='"+email+"' where username='"+username+"'";
		int result= db.doUpdate(sql);
		return result;
	}

	public int updateAddress(String username, String address) {
		dbUtil db=new dbUtil();
		String sql="update users set address='"+address+"' where username='"+username+"'";
		int result= db.doUpdate(sql);
		return result;
	}

}

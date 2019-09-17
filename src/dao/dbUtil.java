package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class dbUtil {
public static	Connection connection=null;
public static	Statement statement=null;
public static	ResultSet resultset=null;
static String driver="com.mysql.cj.jdbc.Driver";
static String url="jdbc:mysql://127.0.0.1:3306/shop?serverTimezone=UTC&amp&useSSL=false";
static String user="root";
static String password="123456";
public dbUtil(){
	getConnection();
}
public static void getConnection(){
	try {
			Class.forName(driver);
			connection=(Connection) DriverManager.getConnection(url,user,password);
			System.out.println("�������ݿ�ɹ�");
		} catch (ClassNotFoundException e) {
		System.out.println("��������ʧ��");
	}catch (Exception e) {
	}
}
public ResultSet doQuery(String sql){
	try {
		statement=(Statement) connection.createStatement();
		resultset=statement.executeQuery(sql);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return resultset;
}
public int doUpdate(String sql){
	int result = 0;
	try {
		statement=(Statement) connection.createStatement();
		result=statement.executeUpdate(sql);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return result;
}
public void close(){
	try {
		resultset.close();
		statement.close();
		connection.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}

}
}

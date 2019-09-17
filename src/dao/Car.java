package dao;


public class Car {
int Gid;
String date;
String username;
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public Car(String username,int gid,String date) {
	this.username=username;
	this.date=date;
	this.Gid=gid;
}
public int getGid() {
	return Gid;
}
public void setGid(int gid) {
	Gid = gid;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}

}

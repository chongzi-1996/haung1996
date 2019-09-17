package dao;
public class Good{
int Gid;
String Gname;
double Gprice;
String Gcontent;
String Gimg;
String Gdate;
int Gamount;
int Glook;
String Gkind;
public Good(int id,String name,double price,String content,String img,String date,int amount,int look,String kind){
	Gid=id;
	Gname=name;
	Gprice=price;
	Gcontent=content;
	Gimg=img;
	Gdate=date;
	Gamount=amount;
	Glook=look;
	Gkind=kind;
}
public Good(){
	
}
public int getGid() {
	return Gid;
}
public void setGid(int gid) {
	Gid = gid;
}
public String getGname() {
	return Gname;
}
public void setGname(String gname) {
	Gname = gname;
}
public double getGprice() {
	return Gprice;
}
public void setGprice(double gprice) {
	Gprice = gprice;
}
public String getGcontent() {
	return Gcontent;
}
public void setGcontent(String gcontent) {
	Gcontent = gcontent;
}

public String getGdate() {
	return Gdate;
}
public void setGdate(String gdate) {
	Gdate = gdate;
}
public int getGamount() {
	return Gamount;
}
public void setGamount(int gamount) {
	Gamount = gamount;
}
public int getGlook() {
	return Glook;
}
public void setGlook(int glook) {
	Glook = glook;
}
public String getGkind() {
	return Gkind;
}
public void setGkind(String gkind) {
	Gkind = gkind;
}
public String getGimg() {
	return Gimg;
}
public void setGimg(String gimg) {
	Gimg = gimg;
}
}

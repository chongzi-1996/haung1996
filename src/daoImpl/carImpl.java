package daoImpl;

import dao.Car;
import dao.CarDao;
import dao.dbUtil;

public class carImpl implements CarDao{

	@Override
	public int addCar(Car car) {
		String name=car.getUsername();
		int gid=car.getGid();
		String date=car.getDate();
		dbUtil db=new dbUtil();
		int row =db.doUpdate("insert into car values('"+name+"',"+gid+",'"+date+"')");
		return row;
	}

	@Override
	public int deleteCar(Car car) {
		String date=car.getDate();
		dbUtil db=new dbUtil();
		int row=db.doUpdate("delete from car where date='"+date+"'");
		return row;
	}

}

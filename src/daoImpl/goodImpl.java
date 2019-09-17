package daoImpl;

import dao.Good;
import dao.GoodDao;
import dao.dbUtil;

public class goodImpl implements GoodDao {
	public int addGood(Good good) {
		int result=0;
		int id=good.getGid();
		String name=good.getGname();
		double price=good.getGprice();
		String content=good.getGcontent();
		String img=good.getGimg();
		String date=good.getGdate();
		int amount=good.getGamount();
		int look=good.getGlook();
		String kind=good.getGkind();
		dbUtil db=new dbUtil();
		String sql="insert into goods (Gname,Gprice,Gcontent,Gimg,Gdate,Gamount,Gkind) values('"+name+"',"+price+",'"+content+"','"+img+"',now(),"+amount+",'"+kind+"')";
		result=	db.doUpdate(sql);
		System.out.println(sql);
		return result;
	}

	@Override
	public Good findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getId() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateGood(Good good) {
		int id=good.getGid();
		String name=good.getGname();
		double price=good.getGprice();
		String content=good.getGcontent();
		String img=good.getGimg();
		String date=good.getGdate();
		int amount=good.getGamount();
		int look=good.getGlook();
		String kind=good.getGkind();
		dbUtil db=new dbUtil();
		String sql="update goods set Gname='"+name+"',Gprice="+price+",Gcontent='"+content+"',Gimg='"+img+"',Gkind='"+kind+"' where Gid="+id;
		System.out.println(sql);
		int res=db.doUpdate(sql);
		return res;	
	}

	@Override
	public int deleteGood(Good good) {
		int id=good.getGid();
		String sql="delete from goods where Gid="+id;
		dbUtil db=new dbUtil();
		int row=db.doUpdate(sql);
		return row;
	}

}

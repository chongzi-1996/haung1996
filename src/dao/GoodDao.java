package dao;
public interface GoodDao {
public int addGood(Good good);
public Good findById(int id);
public int getId();
public int updateGood(Good good);
public int deleteGood(Good good);
}

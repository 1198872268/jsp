/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyBean;

import MyServlet.DB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Order {

    public static ProductBean getOrder(int gid, int cid) {
        ProductBean bean = null;
        try {
            PreparedStatement ps = DB.dbCon().prepareStatement("select * from cart where gid = ? and cid=?");
            ps.setInt(1, gid);
            ps.setInt(2, cid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String gname = rs.getString(5);
                float price = rs.getFloat(4);
                String image = rs.getString(6);
                int number = rs.getInt(3);
                float sum = number * price;
                bean = new ProductBean(gname, price, image, number, gid, sum,cid);;
            }
        } catch (Exception e) {
        }
        return bean;
    }
    public static void insert(ProductBean bean){
        try {
             PreparedStatement ps = DB.dbCon().prepareStatement("insert into order1(gid,cid,number,gname,price,image) values(?,?,?,?,?,?)");
                ps.setInt(1, bean.gid);
                ps.setInt(2, bean.cid);
                ps.setDouble(5, bean.price);
                ps.setString(4, bean.gname);
                ps.setString(6, bean.image);
                ps.setInt(3, bean.number);
                ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}

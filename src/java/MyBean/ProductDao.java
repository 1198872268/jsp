
package MyBean;

import MyServlet.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDao {
    public static ArrayList getProductList(int cid){
        ArrayList<ProductBean> list = new ArrayList<>();
        
        try {
            Connection con = DB.dbCon();
            PreparedStatement ps = con.prepareStatement("select * from cart where cid=?");
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String gname = rs.getString("gname");
                float price = rs.getFloat("price");
                String image = rs.getString("image");
                int number = rs.getInt("number");
                int gid = rs.getInt("gid");
                float sum = number * price;
                ProductBean bean = new ProductBean( gname,  price, image,number,gid,sum,cid);
                list.add(bean);
            }
            
        } catch (Exception e) {
        }
        
        return list;
    }

}

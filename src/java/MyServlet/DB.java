/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author 11988
 */
public class DB {
    public static Connection dbCon(){
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/work?characterEncoding=gb2312", "root","root"); //解决汉字乱码需要
        }
        catch(Exception e){
            System.out.printf("err");
        };
        return con;
    }
}

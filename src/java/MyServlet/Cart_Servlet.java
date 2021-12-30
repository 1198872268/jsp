package MyServlet;

import MyBean.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Cart_Servlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");   //必须的
        HttpSession s = request.getSession();
        String cid = String.valueOf(s.getAttribute("cid"));
        String gid = String.valueOf(s.getAttribute("gid"));
        String price = String.valueOf(s.getAttribute("price"));
        String image = String.valueOf(s.getAttribute("image"));
        String gname = String.valueOf(s.getAttribute("gname"));
        String flag;
        try {
            PreparedStatement ps = DB.dbCon().prepareStatement("select * from cart where gid = ? and cid=?");
            ps.setInt(1, Integer.parseInt(gid));
            ps.setInt(2, Integer.parseInt(cid));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                flag = "已加入购物车";
                s.setAttribute("flag", flag);
            } else {
                PreparedStatement ps1 = DB.dbCon().prepareStatement("insert into cart(gid,cid,price,gname,image,number) values(?,?,?,?,?,?)");
                ps1.setInt(1, Integer.parseInt(gid));
                ps1.setInt(2, Integer.parseInt(cid));
                ps1.setDouble(3, Double.parseDouble(price));
                ps1.setString(4, gname);
                ps1.setString(5, image);
                ps1.setInt(6, 1);
                ps1.executeUpdate();
                flag = "加入购物车成功";
                s.setAttribute("flag", flag);
            }
        } catch (Exception e) {
            flag = "sql wrong ";
            s.setAttribute("flag", flag);
        }

        RequestDispatcher dis = request.getRequestDispatcher("Goodsshow.jsp");
        dis.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

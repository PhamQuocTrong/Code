/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kuminhdey
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps, ps1, ps2, ps3, ps4;

    public ProductDAO() {
        try {
            conn = new ConnectDB().getConnect();
            ps1 = conn.prepareStatement("select namecategory FROM category");
            ps2 = conn.prepareStatement("SELECT * FROM product INNER JOIN category ON product.idcategory = category.idcategory ORDER BY product.productid DESC");
            ps4 = conn.prepareStatement("DELETE FROM `product` WHERE `product`.`productid` = ?");
            ps3 = conn.prepareStatement("UPDATE `product` SET `idcategory` = ?, `productname` = ?, `productprice` = ?, `productimage` = ?, `productdetail` = ? WHERE `product`.`productid` = ?;");
            ps = conn.prepareStatement("INSERT INTO `product` (`productid`, `idcategory`, `productname`, `productprice`, `productimage`, `productdetail`) VALUES (NULL, ?, ?, ?, ?, ?);");
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int addProduct(Product pro) throws SQLException {
        try {
            ps.setString(1, pro.getCategory().getCategoryid());
            ps.setString(2, pro.getProductname());
            ps.setString(3, pro.getProductprice());
            ps.setString(4, pro.getProductimage());
            ps.setString(5, pro.getProductdetail());
            if (ps.executeUpdate() == 1) {
                return 1;
            }
        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
            return -1;
        }
        return -1;
    }

    public Vector getAlllist() {
        Vector kq = new Vector();
        try {
            ResultSet rs = ps2.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                Vector t = new Vector();
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    t.add(rs.getString(i));
                }
                kq.add(t);
            }
        } catch (SQLException ex) {
        }
        return kq;
    }

    public int del(String id) {
        int kq = 0;
        try {
            ps4.setString(1, id);
            kq = ps4.executeUpdate();
            return 1;
        } catch (SQLException ex) {

        }
        return kq;
    }

    public Product findProductByID(String id) {
        ProductDAO proDAO = new ProductDAO();
        for (int i = 0; i < proDAO.getAlllist().size(); i++) {
            Product pro = new Product();
            Vector vt = (Vector) proDAO.getAlllist().get(i);
            if (vt.get(0).equals(id)) {
                pro.setProductid((String) vt.get(0));
                pro.setCategory(new Category((String) vt.get(6), (String) vt.get(7)));
                pro.setProductname((String) vt.get(2));
                pro.setProductprice((String) vt.get(3));
                pro.setProductimage((String) vt.get(4));
                pro.setProductdetail((String) vt.get(5));
                return pro;
            }
        }
        return null;
    }

    public int update(String categoryid, String productname, String productprice, String productimage, String productdetail, String productid) {
        int kq = 0;
        try {
            ps3.setString(1, categoryid);
            ps3.setString(2, productname);
            ps3.setString(3, productprice);
            ps3.setString(4, productimage);
            ps3.setString(5, productdetail);
            ps3.setString(6, productid);
            kq = ps3.executeUpdate();
        } catch (SQLException ex) {

        }
        return kq;
    }

    public static void main(String[] args) {
        ProductDAO pro = new ProductDAO();
        System.out.println(pro.update("13", "minh minh", "100", "4564564", "5655", "31"));
    }
}

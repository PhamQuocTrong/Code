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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author kuminhdey
 */
public class UserDAO {
    Connection conn = null;
    PreparedStatement ps, ps1, ps2,ps3;

    public UserDAO() {
        try {
            conn = new ConnectDB().getConnect();
            ps1 = conn.prepareStatement("select * from user ORDER BY ID DESC");
            ps2 = conn.prepareStatement("delete from user where ID = ?");
             ps3 = conn.prepareStatement("UPDATE `user` SET `PassWord` = ? WHERE `user`.`ID` = ?;");
            ps = conn.prepareStatement("INSERT INTO `user` (`ID`, `UserName`, `Email`, `PassWord`) VALUES (NULL, ?, ?, ?);");
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int addUser(User user) throws SQLException {
        try {
           ps.setString(1, user.getUserName());
           ps.setString(2, user.getUserEmail());
           ps.setString(3, user.getUserPass());
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
            ResultSet rs = ps1.executeQuery();
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
            ps2.setString(1, id);
            kq = ps2.executeUpdate();
            return 1;
        } catch (SQLException ex) {

        }
        return kq;
    }

    public User findCategoryByID(String id) {
        UserDAO ctd = new UserDAO();
        for (int i = 0; i < ctd.getAlllist().size(); i++) {
            User ct = new User();
            Vector vt = (Vector) ctd.getAlllist().get(i);
            if(vt.get(0).equals(id)){
               ct.setId(id);
               ct.setUserName((String) vt.get(1));
                ct.setUserEmail((String) vt.get(2));
                 ct.setUserPass((String) vt.get(3));
               return ct;
            } 
        }
        return null;
    }
     public int update(String pass, String id){
int kq = 0;
        try {
            ps3.setString(2, id);
            ps3.setString(1, pass);
            kq = ps3.executeUpdate();
        } catch (SQLException ex) {
            
        }
        return kq;
    }
    public static void main(String[] args) {
        UserDAO us = new UserDAO();
        System.out.println(us.update("123", "2"));
    }
   
}

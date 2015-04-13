/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DAO.MYSQLDbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * @author Swarnendu
 */
public class Bookbidserv {

    MYSQLDbConnection mysql = new MYSQLDbConnection();
    Connection con = mysql.makeConection();

    public int makebid(int i, float mony, String uid) {
        String sql1 = "update  bid_table set  mony = ? where no=?; ";
        String sql2 = "select mony from bid_table where no=?";
        String SQL = "insert into tkt_tab (uid,no,rs,date)values( ?,?,?,?)";
        String miniSql = "select * from temp_usr";
        int k = 0;
        int j = 0;
        float m = 0;
        try {
            java.util.Date date = new java.util.Date();

            long time = date.getTime();
            java.sql.Date sqlDate = new java.sql.Date(time);
            PreparedStatement prMaster = con.prepareStatement(SQL);
            PreparedStatement pr1 = con.prepareStatement(sql2);
            PreparedStatement pr = con.prepareStatement(sql1);
            pr1.setInt(1, i);
            ResultSet rs = pr1.executeQuery();
            while (rs.next()) {
                m = rs.getFloat(1);
            }
            m = m + mony;
            pr.setFloat(1, m);
            pr.setInt(2, i);
            k = pr.executeUpdate();
            prMaster.setString(1, uid);
            prMaster.setInt(2, i);
            prMaster.setFloat(3, mony);
            prMaster.setDate(4, sqlDate);
            j = prMaster.executeUpdate();
            if (j > 0) {
                System.out.println("INSERT IN TKT: " + j);
            }
            rs = null;
            PreparedStatement prMini = con.prepareStatement(miniSql);
            rs = prMini.executeQuery();
            String masterSql = null;
            PreparedStatement prM = null;

            if (rs == null) {
                System.out.println("ON CALL : " + rs);
                masterSql = "insert into temp_usr (uid,no,mony) values (?,?,?)";
                prM = con.prepareStatement(masterSql);
                prM.setFloat(3, mony);
                prM.setString(1, uid);
                prM.setInt(2, i);
            } else {
                while (rs.next()) {
                    System.out.println("CALL  WHILE IN TEMP : " + uid + " NO: " + i + "DB VALUE :" + " " + rs.getInt("no"));
                    if (uid.equals(rs.getString("uid")) && Integer.toString(i).equals(rs.getString("no"))) {
                        System.out.println("CALL FORM IF IN TEMP : " + uid + " NO: " + i + "DB VALUE :" + rs.getString("uid") + " SELECT NO: " + rs.getInt("no"));
                        masterSql = "update temp_usr set mony=mony+? where uid=? and no=?; ";
                          System.out.println("SQL"+ masterSql);
                        prM = con.prepareStatement(masterSql);
                        prM.setFloat(1, mony);
                        prM.setString(2, uid);
                        prM.setInt(3, i);

                    } else {
                        System.out.println("CALL FORM ELSE IN TEMP : " + uid + " NO: " + i);
                        masterSql = "insert into temp_usr (uid,no,mony) values (?,?,?)";
                        System.out.println("SQL"+ masterSql);
                        prM = con.prepareStatement(masterSql);
                        prM.setFloat(3, mony);
                        prM.setString(1, uid);
                        prM.setInt(2, i);
                    }

                }
            }

            int h = prM.executeUpdate();
            if (h > 0) {
                System.out.println("INSERT IN temp: " + j);
            }

        } catch (Exception E) {
            System.out.println("EXCEPTION Bookbidserv " + E);
        } finally {
            return k;
        }
    }
}

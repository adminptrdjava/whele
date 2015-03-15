/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DAO.MYSQLDbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Swarnendu
 */
public class Bookbidserv {
    MYSQLDbConnection mysql = new MYSQLDbConnection();
        Connection con = mysql.makeConection();
    public int makebid(int i){
        String sql = "insert into bid_table (value) value(?); ";
        int k = 0;
        try{
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, i);
           k= pr.executeUpdate();
        }catch(Exception E){
            System.err.println("EXCEPTION Bookbidserv " +E);
    }finally{
            return k;
        }
    }   
}

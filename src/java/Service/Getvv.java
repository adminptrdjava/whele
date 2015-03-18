/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import DAO.MYSQLDbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Swarnendu
 */
public class Getvv {
    public int getMaxval() throws SQLException{
        int i =0;
        MYSQLDbConnection mysql = new MYSQLDbConnection();
        Connection con = mysql.makeConection();
        String SQL = "select distinct  num from valview where countval =(select max(countval) from valview );";
        PreparedStatement ps = con.prepareCall(SQL);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            i=Integer.parseInt(rs.getString(1));
            System.out.println("MAX BID: "+i);
        }
        
        return i;
    }
}

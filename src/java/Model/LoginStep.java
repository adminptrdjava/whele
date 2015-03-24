/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DAO.MYSQLDbConnection;
import Model.Bean.User;
import com.sun.xml.ws.tx.at.v10.types.PrepareResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Swarnendu
 */
public class LoginStep {
    
    public User performLogin(String u , String p) {
        boolean flag = false;
        MYSQLDbConnection mysql = new MYSQLDbConnection();
        Connection con = mysql.makeConection();
        User usr = new User();
        usr.setFlag(false);
         ResultSet rs = null;       
        /*STATUS A FOR ACTIVE 
        IA FOR INACTIVE
        */
        try{
            String SQL = " SELECT * FROM user WHERE uid=? and pass=? and status='A'";
            PreparedStatement pr = con.prepareStatement(SQL);
            pr.setString(1, u);
            pr.setString(2, p);
             rs = pr.executeQuery();
            if(  rs.next()){
            usr.setUid(u);
            usr.setLevel(rs.getString(3));
            usr.setFlag(true);
        }
            
        }catch(Exception E){
            
        }finally{
          return usr;
        }
        
    }
}

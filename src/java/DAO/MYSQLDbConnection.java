/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Swarnendu
 */
public class MYSQLDbConnection {
    
    public Connection makeConection(){
         Connection conn = null;
         String JDBC_DRIVER = "com.mysql.jdbc.Driver"; 
         
         
         
      /*=======================L O C A L - S  R V  E  R  S T A R T  ============================*/
        String DB_URL = "jdbc:mysql://localhost/wheel";
        String USER = "root";
        String pass="1234";
        
        /*=======================L O C A L - S  R V  E  R  E N D S  ============================*/ 
        
        
    /*=======================S  R V  E  R  START  ============================*/
//          String DB_URL ="jdbc:mysql://localhost/playdimo_whele";
//          String USER="playdimo_ptrd";
//          String pass="zciBpVDPNeGs";
//          
          
     /*=======================S  R V  E  R  END  ============================*/
         try{
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(DB_URL, USER,pass);
             System.out.println("HI CONNECTION"+conn);
         }catch(Exception E){
             System.out.println("EROR EXCEPTION: "+E);
         }finally{
              return conn;
         }
    }
}

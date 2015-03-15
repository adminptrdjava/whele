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
         String DB_URL = "jdbc:mysql://localhost/wheel";
         String USER = "root";
         try{
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(DB_URL, USER,"1234");
             System.out.println("HI CONNECTION"+conn);
         }catch(Exception E){
             System.out.println("EROR EXCEPTION: "+E);
         }finally{
              return conn;
         }
    }
}

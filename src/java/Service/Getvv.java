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
    MYSQLDbConnection mysql = new MYSQLDbConnection();
        Connection con = mysql.makeConection();
    public int getMaxval() throws SQLException{
        int i =0;
        System.out.println("CALL OBJECT GAME SET : .......");
        String gp=null;
        
        System.out.println("SQL 0 ");
        ResultSet rs=null;
        String SQL1=null;
        String SQL0="select sv from setings_tb where sp='gps';";
        System.out.println("SQL 0 "+SQL0);
        PreparedStatement ps0=con.prepareStatement(SQL0);
        rs=ps0.executeQuery();
        System.out.println("RS 0 "+rs);
        while(rs.next())
       gp = rs.getString(1);
        
        System.out.println("GPS: "+gp);
        if(gp.equals("MAX")){
             // SQL1 = "select distinct  num from valview where countval =(select max(countval) from valview );";
             SQL1 = "select distinct no from bid_table where mony = (select max(mony) from bid_table);";
              System.out.println("SQL1: "+SQL1);
        }else{ if(gp.equals("MIN")){
              //SQL1 = "select distinct  num from valview where countval =(select min(countval) from valview );";
               SQL1 = " select distinct no from bid_table where mony = (select min(mony) from bid_table);";
                System.out.println("SQL1: "+SQL1);
        }else{ if(gp.equals("AVARAGE")){
                //SQL1 = "select distinct  num from valview where countval =(select Round (avg(countval)) from valview );";
               SQL1="select distinct no from bid_table where mony not in (select max(mony)from bid_table) and mony not in(select min(mony)from bid_table);";
                  System.out.println("SQL1: "+SQL1);
                }
        }}
        PreparedStatement ps1 = con.prepareCall(SQL1);
        ResultSet rs1 = ps1.executeQuery();
        while(rs1.next()){
            i=Integer.parseInt(rs1.getString(1));
            System.out.println(" BID: "+i);
        }
        
        return i;
    }
    
    public String getGPS(){
        String p=null;
        try{
            String s ="select SV from setings_tb WHERE SP='gps';";
            
            ResultSet rs = null;
            PreparedStatement pr = con.prepareStatement(s);
            rs=pr.executeQuery();
            while(rs.next()){
                p=rs.getString(1);
            }
            
        }catch(Exception E){
            System.out.println("EXCEPTION :"+E);
        }finally{
            int q= setResult(p);
            if(q>0)
                System.out.println("RESULT DONE :"+p);
            return p;
        }
    }
    
    
    public int  setResult(String no){
        System.out.println("CALL SAVE  RESULT :"+no);
        int i =0;
        String SQL = "insert into bit_rslt (win_no,date) values (?,?)";
       java.util.Date date = new java.util.Date();
       long time = date.getTime();
       java.sql.Date sqlDate = new java.sql.Date(time);
        try{
             PreparedStatement pr = con.prepareStatement(SQL);
             pr.setString(1,no );
             pr.setDate(2, sqlDate);
              i = pr.executeUpdate();
        }catch(Exception E){
            E.printStackTrace();
        }finally{
            return i;
        }
        
    }
    public void bidToZero(){
        System.out.println("CALL ZEROFILL ....");
     String Sql = " UPDATE bid_table SET Mony = 0 ORDER BY no  ;";
        try{
           
            PreparedStatement pr = con.prepareStatement(Sql);
            pr.executeUpdate();
        
    }catch(Exception E){
        E.printStackTrace();
    }
   }
    
    
    public ResultSet last5show(String uid){
        ResultSet rs = null;
         String SQL = "SELECT * FROM bit_rslt ORDER BY id DESC LIMIT 5;";
         
        try{
            PreparedStatement pr = con.prepareStatement(SQL);
            rs=pr.executeQuery();
            
    }catch(Exception E){
        E.printStackTrace();
    }finally{
         return rs;  
        }    
    }
}

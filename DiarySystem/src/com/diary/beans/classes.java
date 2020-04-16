package com.diary.beans;
import java.sql.*;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class classes {
	Connection connmain=null;
	Connection connmain1=null;
	Connection connmain2=null;
	Statement stmain=null;
	Statement stmain1=null;
	Statement stmain2=null;
	NumberFormat numberformat = new DecimalFormat("#0.00");
	public String getDate(String dt,String userFormat, String returnFormat) throws Exception {
		String thedate="";
		String UserDate=dt;
		String UserFormat=userFormat;
		String ReturnFormat=returnFormat;
		thedate=new SimpleDateFormat(ReturnFormat).format(new SimpleDateFormat(UserFormat).parse(UserDate));
		return thedate;

	}
	
	 public static Connection getPooledConnection() throws Exception{
	       Connection conn = null;
	       System.out.print("Inside pooled Connection");
	        try{
	          Context ctx = new InitialContext();
	          if(ctx == null )
	              throw new Exception("No Context");

	          DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/PooledDB");

	          if (ds != null) {
	             conn = ds.getConnection();
	            return conn;
	          }else{
	              return null;
	          }

	        }catch(Exception e) {
	            e.printStackTrace();
	            throw e;
	        }
	    }

	
	
	public void getConnection(String MM_dbConn_DRIVER,String MM_dbConn_STRING,String MM_dbConn_USERNAME, String MM_dbConn_PASSWORD) {
		try{
			Class.forName(MM_dbConn_DRIVER); 
			connmain = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
			stmain=connmain.createStatement();
		}catch (Exception e) {
			System.out.print("Connection Error");
		}
	}
	public void getConnection1(String MM_dbConn_DRIVER,String MM_dbConn_STRING,String MM_dbConn_USERNAME, String MM_dbConn_PASSWORD) {
		System.out.print("AKSHAY ");
		
		try{
			Class.forName(MM_dbConn_DRIVER); 
			connmain1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
			stmain1=connmain1.createStatement();
			stmain2=connmain1.createStatement();
		}catch (Exception e) {
			System.out.print("Connection Error");
		}
	}

	public void getConnection2(String MM_dbConn_DRIVER,String MM_dbConn_STRING,String MM_dbConn_USERNAME, String MM_dbConn_PASSWORD) {
		try{
			Class.forName(MM_dbConn_DRIVER); 
			connmain2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
			stmain2=connmain2.createStatement();
		}catch (Exception e) {
			System.out.print("Connection Error");
		}

	}
	public void closeConnection()
	{
		try{
			stmain.close();
			connmain.close();

		}catch (Exception e) {

		}
	}
	public void closeConnection1()
	{
		try{
			stmain1.close();
			connmain1.close();

		}catch (Exception e) {


		}
	}

	
	public Connection ReturnConnection() 
	{	
		return connmain;
	}
	public Connection ReturnConnection1() 
	{	
		return connmain1;
	}
	public Connection ReturnConnection2() 
	{	
		return connmain2;
	}
	
	
	


}




<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String category=request.getParameter("category");
    String date=request.getParameter("date");
    String name=request.getParameter("name");
    String description=request.getParameter("description");
    String amount=request.getParameter("amount");

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bjit_db", "root", "");
        Statement st=conn.createStatement();
        int i=st.executeUpdate("insert into expense(category,date,name,description,amount)values('"+category+"','"+date+"','"+name+"','"+description+"','"+amount+"')");
        out.println("<div style='text-align:center;margin:50px auto;'><div style='text-align:center;margin:50px auto; color:green; font-size:20px; padding:50px; border: 1px solid green; width:300px;'>Data has been successfully inserted! Redirecting...</div></div>");
        response.setHeader("Refresh", "2; URL=retrieve.jsp");
    } catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
    }
 %>
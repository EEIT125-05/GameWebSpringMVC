package com.web.game.withplay.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.SerializedName;


@WebServlet("/WithPlayAjax")
public class WithPlayAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public WithPlayAjax() {
        super();
    }
    
    public class Result{
    	@SerializedName("message")
    	public String message;
    	
    }
    
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		System.out.println(request.getParameter("id"));
		String id = request.getParameter("id");
		
		
		DataSource ds = null;
		InitialContext ctxt = null;
		Connection conn = null;
		try {
			ctxt = new InitialContext();
			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/GameDB");
			conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from withgametable");
			
			Boolean used = false;
			Result result = new Result();
			Gson gson = new GsonBuilder().create();
			
			while(rs.next()) {
				if(id.equals(rs.getString("Idcode"))){
					used = true;
				}
			}
			
			if(used) {
				result.message = "身份證字號重複使用";
			}else {
				result.message = "OK";				
			}
			
			out.println(gson.toJson(result));
			
			
			
		}catch (NamingException ne) {
			System.out.println("Naming Service Lookup Exception");
		} catch (SQLException e) {
			System.out.println("Database Connection Error");
			e.printStackTrace();
		}
		
		
	}

}

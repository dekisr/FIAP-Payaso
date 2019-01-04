package br.com.fiap.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	public static Connection conectar() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		return DriverManager.getConnection
		("jdbc:oracle:thin:@PATH", "LOGIN", "PASSWORD");
	}
}
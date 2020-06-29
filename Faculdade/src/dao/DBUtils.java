package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {
	private String url = "jdbc:jtds:sqlserver://127.0.0.1:1433;DatabaseName=bd_faculdade;namedPipes=true";
	private String user = "Fiyero";
	private String password = "123";
	private Connection con;
	private static DBUtils dbutils;

	private DBUtils() {
		try {
			Class.forName("net.sourceforge.jtds.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static DBUtils getInstance() {
		if (dbutils == null) {
			dbutils = new DBUtils();
		}
		return dbutils;
	}

	public Connection getConnection() throws SQLException {
		if (con == null || con.isClosed()) {
			//System.out.println("Nova conexão criada");
			con = DriverManager.getConnection(url, user, password);
		} else {
			//System.out.println("Usando a mesma conexão");
		}
		return con;
	}
}

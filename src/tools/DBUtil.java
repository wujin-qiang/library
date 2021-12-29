package tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	private static String DRIVER = null;

	private static String URL = null;

	private static String USERNAME = null;

	private static String PASSWORD = null;

	static {
		DRIVER = "com.mysql.jdbc.Driver";
		URL = "jdbc:mysql://localhost:3306/library?useUnicode=true&characterEncoding=UTF-8";
		USERNAME = "root";
		PASSWORD = "root";
	}

	public static Connection getConn() {
		Connection conn = null;
		try {
			/* 加载驱动 */
			//            System.out.println(DRIVER);
			Class.forName(DRIVER);
			/* 获取连接 */
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 关闭连接
	public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}


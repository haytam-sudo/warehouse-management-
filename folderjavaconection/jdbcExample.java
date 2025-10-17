package folderjavaconection;

import java.sql.*;

public class jdbcExample {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/ma_base", "root", "Haytam1bilal");

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM etudiants");

            while (rs.next()) {
                System.out.println(rs.getString("nom"));
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
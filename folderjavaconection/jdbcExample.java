package folderjavaconection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class jdbcExample {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/warehouse_app";
        String user = "root";
        String password = "Haytam1bilal";
        String query = "SELECT * from warehouse";

        try (Connection con = DriverManager.getConnection(url, user, password);
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query)) { // try with ressources to close the resources after we finish

            List<String> warehouses = new ArrayList<>();
            while (rs.next()) {
                String line = rs.getString("warehouse_name") + " | " +
                        rs.getString("location") + " | " +
                        rs.getString("phone") + " | " +
                        rs.getString("email");
                warehouses.add(line + "\n");
            }
            System.out.println(warehouses);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

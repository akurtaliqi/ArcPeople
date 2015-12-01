package DAO;

import Model.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GraphesDAO {

    public int selectDayById(Connection conn, int current_day) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int day = 0;
        try {
            String query = "select count(*) from ajout where extract "
                    + "(day from dateajout) = ? and extract (month from dateajout) "
                    + " = extract (month from sysdate)";

            stmt = conn.prepareStatement(query);
            stmt.setInt(1, current_day);
            rs = stmt.executeQuery();

            while (rs.next()) {
                day = rs.getInt("COUNT(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                return day;
            } catch (SQLException e) {
                e.printStackTrace();
                return day;
            }
        }
    }

}

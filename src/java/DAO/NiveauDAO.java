package DAO;

import Model.Niveau;
import Model.Users;
import java.awt.Image;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class NiveauDAO {
    
    public Niveau getNiveauById(Long p_id) {
        Connection conn = DBDataSource.getJDBCConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Niveau n = new Niveau();
        try {
            String query = "SELECT N.NUMERO, N.LIBELLE, N.CODE FROM USERS U "
                    + "INNER JOIN NIVEAU N ON U.FK_NUM_NIVEAU = N.NUMERO "
                    + "WHERE U.NUMERO = ?";
            
            stmt = conn.prepareStatement(query);        
            stmt.setLong(1, p_id);
            rs = stmt.executeQuery();
           
            while(rs.next()){
                n.setId(rs.getLong("NUMERO"));
                n.setLibelle(rs.getString("LIBELLE"));
                n.setCode(rs.getString("CODE"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
                 return n;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        } 
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Ajout;
import Model.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Maxime Stierli <maxime.stierli@he-arc.ch>
 */
public class AjoutDAO {

    public AjoutDAO() {
    }

    ;
    
     public ArrayList<Users> top5Ajout() {
        UsersDAO usersDAO = new UsersDAO();
        ArrayList<Users> usersSelect = usersDAO.selectAll();
        ArrayList<Users> userTrie = new ArrayList<Users>();
        int value;
        int index = 0;
        Users user = null;

        while (!usersSelect.isEmpty() && userTrie.size() < 5) {
            value = -1;
            for (int i = 0; i <= usersSelect.size() - 1; i++) {

                if (countAjout(usersSelect.get(i).getId()) >= value) {
                    value = countAjout(usersSelect.get(i).getId());
                    index = i;
                    user = usersSelect.get(i);
                }
            }
            if (user != null) {
                userTrie.add(user);
                usersSelect.remove(index);
                user = null;
            }
        }
        return userTrie;
    }

    /*public ArrayList<Users> top5Additions() {
     Connection con = DBDataSource.getJDBCConnection();

     ArrayList<Users> usersTop = new ArrayList();
     try {
     Statement stmt = con.createStatement();

     String requete = "SELECT U.USERNAME, COUNT(A.USERS_NUMERO) FROM AJOUT A "
     + " INNER JOIN USERS ON A.USERS_NUMERO = U.NUMER0 "
     + " GROUP BY U.USERNAME ORDER BY COUNT(A.USERS_NUMERO) DESC, U.USERNAME";

     ResultSet rs = stmt.executeQuery(requete);

     while (rs.next()) {
     Users u = new Users();
     u.setUsername(rs.getString("USERNAME"));
     u.setNbPoints(rs.getInt("COUNT(USERS_NUMERO)"));
     usersTop.add(u);
     }
            
     rs.close();
     stmt.close();
            
     return usersTop;
            
     } catch (Exception ex) {
     ex.printStackTrace(System.out);
     } finally {
     try {
     con.close();
     } catch (SQLException ex) {
     Logger.getLogger(AjoutDAO.class.getName()).log(Level.SEVERE, null, ex);
     }
     }
     return usersTop;
     }*/
    public ArrayList<Ajout> top5Additions(Connection con) {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Ajout> ajoutsTop = new ArrayList();
        try {
            stmt = con.createStatement();

            String requete = "SELECT USERS_NUMERO, COUNT(USERS_NUMERO) FROM AJOUT GROUP BY USERS_NUMERO ORDER BY COUNT(USERS_NUMERO) DESC";
            rs = stmt.executeQuery(requete);

            while (rs.next()) {
                Ajout a = new Ajout();
                a.setAjout_users(rs.getLong("USERS_NUMERO"));
                a.setNbTotalGroupes(rs.getInt("COUNT(USERS_NUMERO)"));
                ajoutsTop.add(a);
            }
            return ajoutsTop;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                rs.close();
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(AjoutDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return ajoutsTop;
    }

    public int countAjout(Long users_id) {
        Connection conn = DBDataSource.getJDBCConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int total = 0;
        try {
            String query = "SELECT COUNT(*) AS TOTAL FROM AJOUT WHERE users_numero = ? AND EXTRACT(month from dateAjout) = EXTRACT(month from sysdate) AND EXTRACT(year from dateAjout) = EXTRACT(year from sysdate)";

            stmt = conn.prepareStatement(query);
            stmt.setLong(1, users_id);
            rs = stmt.executeQuery();
            rs.next();
            total = rs.getInt("total");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
                return total;
            } catch (SQLException e) {
                e.printStackTrace();
                return 0;
            }
        }
    }

    public Long create(Long users_id) {
        Connection conn = DBDataSource.getJDBCConnection();
        OraclePreparedStatement pstmt = null;
        ResultSet rs = null;
        Long returnNumero = null;
        try {

            String query = "insert into Ajout(USERS_NUMERO) values (?) returning numero into ?";
            System.out.println("insertquery ->" + query);

            pstmt = (OraclePreparedStatement) conn.prepareStatement(query); //create a statement
            pstmt.setLong(1, users_id);
            pstmt.registerReturnParameter(2, OracleTypes.NUMBER);

            int count = pstmt.executeUpdate();
            conn.commit();

            if (count > 0) {
                rs = pstmt.getReturnResultSet(); //rest is not null and not empty
                while (rs.next()) {
                    returnNumero = rs.getLong(1);
                    System.out.println(returnNumero);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                pstmt.close();
                conn.close();
                return returnNumero;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }
    }
}


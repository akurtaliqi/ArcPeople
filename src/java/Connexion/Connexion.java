package Connexion;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import oracle.jdbc.pool.OracleDataSource;

public class Connexion {
    
    private Connection myConn = null;
    
    public Connection getConnection() {
        try {
            DataSource ds = new OracleDataSource();
            /* Paramétrer la DataSourceafin les infos de connexion à la BD */
            ((OracleDataSource) ds).setDriverType("thin");
            ((OracleDataSource) ds).setServerName("ne-ege-leto.ig.he-arc.ch");
            ((OracleDataSource) ds).setDatabaseName("ens2");
            ((OracleDataSource) ds).setPortNumber(1521);
            ((OracleDataSource) ds).setUser("ajtene_kurtaliq");
            ((OracleDataSource) ds).setPassword("ajtene_kurtaliq");

            myConn = ds.getConnection();
            myConn.setAutoCommit(false);
            
            //ds.getConnection().setAutoCommit(false);
            //conn == ds.getConnection()
            //erreur il créer deux connections !!!!

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return myConn;
    }
    
    
}

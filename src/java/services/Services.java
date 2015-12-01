package services;

import DAO.AjoutDAO;
import DAO.CommentaireDAO;
import DAO.DBDataSource;
import DAO.GraphesDAO;
import DAO.UsersDAO;
import Model.Ajout;
import Model.Commentaire;
import Model.Graphe;
import Model.Users;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

public class Services {

    public Vector<Commentaire> selectComments(Connection con) {
        
        CommentaireDAO cdao = new CommentaireDAO();
        
        Vector<Commentaire> vcomm = new Vector();
        vcomm = cdao.selectAll();
        
        return vcomm;
    }
    
    public ArrayList<Ajout> getTop5UsersAdditions(Connection con) throws SQLException {
        
        AjoutDAO adao = new AjoutDAO();
        
        ArrayList<Ajout> usersTop = adao.top5Additions(con);
        
        return usersTop;
        
        
    }
    
    public ArrayList<Graphe> getDatas(Connection con, int nbDays) {
        GraphesDAO gdao = new GraphesDAO();
        ArrayList<Graphe> datas = new ArrayList();
        
        for (int i = 0; i < nbDays; i++) {
            Graphe g = new Graphe();
            g.setDayInMonth(i);
            g.setNbAjouts(gdao.selectDayById(con, i));
            datas.add(g);
        }
        
        return datas;
    }

}

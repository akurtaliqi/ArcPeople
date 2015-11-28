/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Maxime Stierli <maxime.stierli@he-arc.ch>
 */
public class Ajout {
    private Long id;
    private Long ajout_users;
    private int nbTotalGroupes;
    
    public Ajout(Long ajout_users){
        this.ajout_users = ajout_users;
    }
    
    public Ajout(){
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setAjout_users(Long ajout_users) {
        this.ajout_users = ajout_users;
    }

    public Long getId() {
        return id;
    }

    public Long getAjout_users() {
        return ajout_users;
    }

    public int getNbTotalGroupes() {
        return nbTotalGroupes;
    }

    public void setNbTotalGroupes(int nbTotalGroupes) {
        this.nbTotalGroupes = nbTotalGroupes;
    }
    
    
    
}

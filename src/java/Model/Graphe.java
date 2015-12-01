package Model;

public class Graphe {
    
    private int dayInMonth;
    private int nbAjouts;

    public Graphe() {
    }

    public Graphe(int dayInMonth, int nbAjouts) {
        this.dayInMonth = dayInMonth;
        this.nbAjouts = nbAjouts;
    }

    public int getDayInMonth() {
        return dayInMonth;
    }

    public void setDayInMonth(int dayInMonth) {
        this.dayInMonth = dayInMonth;
    }

    public int getNbAjouts() {
        return nbAjouts;
    }

    public void setNbAjouts(int nbAjouts) {
        this.nbAjouts = nbAjouts;
    }
    
    
    
}

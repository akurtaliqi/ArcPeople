package DAO;

import java.util.GregorianCalendar;

public class TestGraphes {

    public static void main(String[] args) {
        
        GraphesDAO gdao = new GraphesDAO();
        
        System.out.println(gdao.selectDayById(28));
        GregorianCalendar c = new GregorianCalendar();
        int max = c.getActualMaximum(GregorianCalendar.DAY_OF_MONTH);
    
        System.out.println(max);
        
    }
    
}

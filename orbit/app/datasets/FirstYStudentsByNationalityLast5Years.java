package datasets;

import java.util.*;
import models.global.*;

import play.db.ebean.Model;
import javax.persistence.Entity;
import javax.persistence.OneToOne;  
import com.avaje.ebean.annotation.Sql;  
import com.avaje.ebean.Ebean;
import com.avaje.ebean.RawSqlBuilder;

public class FirstYStudentsByNationalityLast5Years
    implements DataSet {

    /** Month of academic year start */
    private final int START_OF_YEAR = 10;

    /** Year of 1st cycle 
     *  i.e the year when there was the spring semester for students from cycle 1
     */
    private final int CYCLE_ONE = 1985;

    /** Years that will be reported */
    private final int YEARS_REQUIRED = 5;

    private List<Country> countries;

    public FirstYStudentsByNationalityLast5Years() {
        countries = new LinkedList();
        for (Country c: Country.find.all()) {
            countries.add(c);
        }
        // System.out.println(countries.toString());
    }

    /**
     * No options supported, does nothing.
     */
    public void setOptions(Map options) {
    }

    public List<List<String>> getColumns() {
        List<List<String>> cols = new LinkedList<List<String>>();
        List<String> col;
        col = new LinkedList<String>();
        col.add("string");
        col.add("Year");
        cols.add(col);

        for (Country country: this.countries) {
            col = new LinkedList<String>();
            col.add("number");
            col.add(country.name);
            cols.add(col);
        }
        return cols;
    }

    /** Performs a convertion from year to phd cycle number */
    private int y2cycle(int year) {
        return year - CYCLE_ONE;
    }
    /** Converts from cycle number to academic year string e.g. 28 -> "2012-2013" */
    private String cycle2a_y(int cycle) {
        int year = CYCLE_ONE + cycle;
        return ((year-1) + " - " + (year));
    }
    private int thisYear() {
        Calendar c = Calendar.getInstance();
        int thisyear = c.get(Calendar.YEAR);
        if (c.get(Calendar.MONTH) >= START_OF_YEAR) {
            return thisyear + 1;
        }
        else {
            return thisyear;
        }
    }

    public List<List> getData() {
        List<List> data = new ArrayList<List>();
        int to_c = y2cycle(thisYear());
        int from_c = to_c - YEARS_REQUIRED + 1;
        System.out.println("Will report years from "+from_c+" to "+to_c);
        for (int cycle = from_c; cycle <= to_c; cycle++) {
            List row = new LinkedList();
            row.add(cycle2a_y(cycle));
            for (Country country: this.countries) {
                int val = Student.allActive().eq("phd_cycle", Integer.toString(cycle))
                    .eq("citizenship", country).findRowCount();
                row.add(new Integer(val));
            }
            /*
            Map <String, Integer> map = new LinkedHashMap<String, Integer>();
            for ( Student stud: Student.allActive().findList() ) {
                String countryName = stud.citizenship.name;
                Integer val = map.get(countryName);
                map.put(countryName,
                        (val != null) ? 
                        new Integer(val.intValue()+1) : new Integer(1)
                        );
            }
            
            for (Map.Entry<String, Integer> entry: map.entrySet()) {
                List row = new LinkedList();
                row.add(entry.getKey());
                row.add(entry.getValue());
                data.add(row);
            }
            */
            data.add(row);
        }
        return data;
    }

}

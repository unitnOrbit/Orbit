package datasets;

import java.util.*;
import models.global.*;

import play.db.ebean.Model;
import javax.persistence.Entity;
import javax.persistence.OneToOne;  
import com.avaje.ebean.annotation.Sql;  
import com.avaje.ebean.Ebean;
import com.avaje.ebean.RawSqlBuilder;
/**
 * Class for managinf First year admitted students by nationality in the
 * last years.
 *
 * Builds the data table as follows:
 *   Year   | Country1 | ... | CountryN
 * [string] | [number] | ... | [number]
 * ---------+----------+-----+----------
 * 2011-2012|   num    | ... |   num
 */
public class FirstYStudentsByNationalityLast5Years
    implements DataSet {

    /**
     * Years that will be reported
     */
    public static final int YEARS_REQUIRED = 5;

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
        col.add(DataSet.ColTypes.STRING);
        col.add("Year");
        cols.add(col);

        for (Country country: this.countries) {
            col = new LinkedList<String>();
            col.add(DataSet.ColTypes.NUMBER);
            col.add(country.name);
            cols.add(col);
        }
        return cols;
    }

    public List<List> getData() {
        List<List> data = new ArrayList<List>();
        int to_c = SchoolCalendar.thisCycle();
        int from_c = to_c - YEARS_REQUIRED + 1;
        System.out.println("Will report years from "+from_c+" to "+to_c);
        for (int cycle = from_c; cycle <= to_c; cycle++) {
            List row = new LinkedList();
            row.add(SchoolCalendar.cycle2a_y(cycle));
            for (Country country: this.countries) {
                int val = Student.allActive().eq("phd_cycle", Integer.toString(cycle))
                    .eq("citizenship", country).findRowCount();
                row.add(new Integer(val));
            }

            data.add(row);
        }
        return data;
    }

}

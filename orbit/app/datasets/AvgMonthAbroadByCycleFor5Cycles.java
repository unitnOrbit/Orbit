package datasets;

import java.util.*;
import models.global.*;

import play.db.ebean.Model;
import javax.persistence.Entity;
import javax.persistence.OneToOne;  
import com.avaje.ebean.annotation.Sql;  
import com.avaje.ebean.Ebean;
import com.avaje.ebean.RawSqlBuilder;

import org.joda.time.DateTime;
import org.joda.time.Months;

/**
 * Class for building the statistic representing
 * Students grouped by nationality.
 * 
 * Builds the data table as follows:
 *  Country | Students
 * [string] | [number]
 * ---------+----------
 *   Italy  |   num    
 *  Austria |   num
 *   ...        ...
 *
 */
public class AvgMonthAbroadByCycleFor5Cycles
    implements DataSet {


    public static final int YEARS_REQUIRED = 5;

    private List<Trip> trips;

    public AvgMonthAbroadByCycleFor5Cycles() {
        trips = new LinkedList();
        for (Trip t: Trip.find.all()) {
            trips.add(t);
        }
    }


    /**
     * No options supported, does nothing.
     */
    public void setOptions(Map options) {
	// no option supported yet
    }
	
    public List<List<String>> getColumns() {
	List<List<String>> cols = new LinkedList<List<String>>();
                List<String> col;
	col = new LinkedList<String>();
	col.add(DataSet.ColTypes.STRING);
	col.add("Cycle");
	cols.add(col);
	  
	col = new LinkedList<String>();
	col.add(DataSet.ColTypes.STRING);
	col.add("Avg months spent abroad");
	cols.add(col);

	return cols;
    }
 
    public List<List> getData() {
    	List<List> data = new ArrayList<List>();

                int to_c = SchoolCalendar.thisCycle();
                int from_c = to_c - YEARS_REQUIRED + 1;

                /*for (int i = from_c; i <= to_c; i++){

                    List row = new LinkedList();
                    row.add(SchoolCalendar.cycle2a_y(i));
                    for (Trip tr: this.trips) {                    
                   }
                
                data.add(row);

                }*/

	return data;
     }
}

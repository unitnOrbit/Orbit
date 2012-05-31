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
public class StudentsByNationality
    implements DataSet {

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
	col.add("Nationality");
	cols.add(col);
	    
	col = new LinkedList<String>();
	col.add(DataSet.ColTypes.NUMBER);
	col.add("Number of enrolled students");
	cols.add(col);
	return cols;
    }

    public List<List> getData() {
	List<List> data = new ArrayList<List>();
	
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

	return data;
    }

}

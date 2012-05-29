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
public class AvgMonthAbroadByCycleByInstitutionFor5CyclesHistorically
    implements DataSet {

    /**
     * No options supported, does nothing.
     */
    public void setOptions(Map options) {
	// no option supported yet
    }
	
    public List<List<String>> getColumns() {
	List<List<String>> cols = new LinkedList<List<String>>();

	return cols;
    }
 
    public List<List> getData() {
	List<List> data = new ArrayList<List>();
	return data;
    }

}

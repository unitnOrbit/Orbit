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
 * this class represents the number scholarship over the last 5 years, classified by source
 */
public class ScholarshipOver5bySource
    implements DataSet {
	
    public void setOptions(Map options) {
	// no option supported yet
    }

    public List<List<String>> getColumns() {
	List<List<String>> cols = new LinkedList<List<String>>();
	List<String> col;
	col = new LinkedList<String>();
	col.add("string");
	col.add("FundingInstitutions");
	cols.add(col);
	    
	col = new LinkedList<String>();
	col.add("number");
	col.add("Scholarship");
	cols.add(col);
	return cols;
    }


    public List<List> getData() {
	List<List> data = new ArrayList<List>();
	Map <String, Integer> map = new LinkedHashMap<String, Integer>();
	//TODO: vericare condizione e anno relativo
	for ( Student stud: Student.find.where().eq("phdCycle", 28-5).findList() ) {
	    String institution = stud.fundingInstitution.name;
	    Integer val = map.get(institution);
	    map.put(institution,
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

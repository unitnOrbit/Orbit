package datasets;

import java.util.*;
import models.global.*;

public class StudentsByNationality
    implements DataSet {
	
    public void setOptions(Map options) {
	// no option supported yet
    }
	
    public List<List<String>> getColumns() {
	List<List<String>> cols = new LinkedList<List<String>>();
	List<String> col;
	col = new LinkedList<String>();
	col.add("string");
	col.add("Nationality");
	cols.add(col);
	    
	col = new LinkedList<String>();
	col.add("integer");
	col.add("Number of enrolled students");
	cols.add(col);
	return cols;
    }

    public List<List> getData() {
	List<List> data = new LinkedList<List>();
	List row = new LinkedList();
	row.add("Italiani");
	row.add(new Integer(1));
	data.add(row);
	return data;
    }

}

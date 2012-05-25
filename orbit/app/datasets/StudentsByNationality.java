package datasets;

import java.util.*;
import models.global.*;

import play.db.ebean.Model;
import javax.persistence.Entity;
import javax.persistence.OneToOne;  
import com.avaje.ebean.annotation.Sql;  
import com.avaje.ebean.Ebean;
import com.avaje.ebean.RawSqlBuilder;

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
	col.add("string");
	col.add("Nationality");
	cols.add(col);
	    
	col = new LinkedList<String>();
	col.add("number");
	col.add("Number of enrolled students");
	cols.add(col);
	return cols;
    }
    /*
    @Entity
    @Sql
    public static class CountriesAggregate {

	@OneToOne  
	public Country country;

	public Long number;

	public CountriesAggregate() { super(); }
	public String toString() {
	    return this.country.toString() + ": " + this.number.toString();
	}
	public Country getCountry() { return this.country; }
	public void setCountry(Country c) { this.country = c; }
	public Long getNumber() { return this.number; }
	public void setNumber(Long n) { this.number = n; }
    }
    */
    public List<List> getData() {
	List<List> data = new ArrayList<List>();
	/*
	List row = new LinkedList();
	row.add("Italy");
	row.add(new Integer(123));
    
	data.add(row);
	*/
	/*
	String sql = 
	    "SELECT c.id as country, count(*) as number " +
	    "FROM students s" +
	    "LEFT JOIN countries c ON s.citizenship = c.country_id" ;

	List<CountriesAggregate> l = 
	    Ebean.find(CountriesAggregate.class)
	    .setRawSql( RawSqlBuilder  
			.parse(sql)  
			.columnMapping("country",  "country.id")
			.create() )
	    .findList();
	*/
	
	// e` sporchissimo, ma qui sopra sopra non va un cazzo
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

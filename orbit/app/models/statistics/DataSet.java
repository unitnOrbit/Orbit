                 package models.statistics;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity
public class DataSet extends Model {

    @Id
    public Long id;

    public String description;

    public static Finder<Long,DataSet> find = 
	new Finder<Long,DataSet>(Long.class, DataSet.class);
 
    public String toString() {
    	return "dataSet: " + this.description;
    }
}

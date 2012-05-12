package models.statistics;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.Size;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity
public class DataSet extends Model {

    @Id
    public Long id;

    @Constraints.Required
    public String description;

    public static Finder<Long,DataSet> find = 
	new Finder<Long,DataSet>(Long.class, DataSet.class);
 
    public String toString() {
    	return "dataSet: " + this.description;
    }


    /*
     * Manage the steps from the class name to the class instance itself
     */

    /**
     * Exception thrown by getDataSetInstance(). Note that, although the class
     * itself is public, the constructor is not: this way, other classes 
     * can catch it, but can not instanciate it.
     * As of today's implementation of the containing class, this exception
     * always contains not-null message and cause, available via getMessage()
     * and getCause() methods inherited from Throwable.
     */
    public static class InvalidClassNameException extends Exception {
	private InvalidClassNameException(String message, Throwable cause) {
	    super(message, cause);
	}
    }

    /*
     * Returns the Class object corresponding to the specified class name.
     * Throws InvalidClassNameException on failure.
     */
    private Class<? extends datasets.DataSet> getDataSetClass() 
	throws InvalidClassNameException {

	try {
	    return Class.forName(this.description)
		.asSubclass(datasets.DataSet.class);
	}
	catch (ClassNotFoundException e) {
	    throw new InvalidClassNameException(
                String.format("The DataSet \"%s\" references a non-existing "
			      + "java class. Note that nested classes are "
			      + "not allowed.",
			      this.description),
		e
	    );
	}
	catch (ClassCastException e) {
	    throw new InvalidClassNameException(
                String.format("The DataSet \"%s\" references a java class "
			      + "which does not implement %s.",
			      this.description,
			      datasets.DataSet.class.getName()),
		e
	    );
	}
    }

    /*
     * Returns an instance of the Class object corresponding to the
     * specified class name.
     * Throws InvalidClassNameException on failure.
     */
    public datasets.DataSet getDataSetInstance() 
	throws InvalidClassNameException {

	try {
	    return this.getDataSetClass().newInstance();
	}
	catch (IllegalAccessException e) {
	    throw new InvalidClassNameException(
                String.format("The DataSet \"%s\" references an unaccessible "
			      + "java class. Both the class and its nullary "
			      + "contructor must be accessable.",
			      this.description),
		e
	    );
	}
	catch (InstantiationException e) {
	    throw new InvalidClassNameException(
                String.format("The DataSet \"%s\" references a java class "
			      + "which is not instantiable. The class must be "
			      + "instantiable (not abstract, not an "
			      + "interface) and have a nullary constructor.",
			      this.description),
		e
	    );
	}
    }
}

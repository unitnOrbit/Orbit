package datasets;

import java.util.*;

/**
 * Provides an interface which all datasets classes must implement.
 * Once a class implements DataSet, its package-qualified name can 
 * be specified as a value in the database table "data_set".
 */
public interface DataSet {

    /**
     * Returns information about the columns:
     * Each row in the returned list represents a column, formatted
     * as a 2-items list of strings: the column type and the column name.
     */
    public List<List<String>> getColumns();

    /**
     * Return the table of data as a List of Lists.
     */
    public List<List> getData();

    /**
     * Sets the options for this DataSet. Each implementing class 
     * should specify which options are allowed.
     */
    public void setOptions(Map options);

}
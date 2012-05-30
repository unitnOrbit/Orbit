package datasets;

import java.util.*;
import models.global.*;

/**
 * Class for building the statistic representing
 * Students grouped by nationality.
 * 
 *
 * Builds the data table as follows:
 *   Year   |  Fund.Inst1  | ... | Fund.InstN
 * [string] |  [number]    | ... |  [number]
 * ---------+--------------+-----+-----------
 * 2011-2012|avg m. abroad | ... | avg m. abroad
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

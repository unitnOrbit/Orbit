package datasets;

import java.util.*;
import models.global.*;

import play.db.ebean.Model;
import javax.persistence.Entity;
import com.avaje.ebean.Ebean;
import com.avaje.ebean.RawSqlBuilder;

/**
 * DataSet for the number scholarship over
 * the last 5 years, classified by Funding Institution
 *
 * Builds the data table as follows:
 *   Year   | Fund.Inst1 | ... | Fund.InstN
 * [string] | [number]   | ... | [number]
 * ---------+------------+-----+----------
 * 2011-2012|   num      | ... |   num
 */
public class ScholarshipOver5bySource implements DataSet {

    public static final int YEARS_REQUIRED = 5;

    private List<FundingInstitution> institutions;

    public ScholarshipOver5bySource() {
        institutions = new LinkedList();
        for (FundingInstitution fi: FundingInstitution.find.all()) {
            institutions.add(fi);
        }
    }

    /**
     * No options supported
     */
    public void setOptions(Map options) {
	// no option supported yet
    }

    public List<List<String>> getColumns() {
	List<List<String>> cols = new LinkedList<List<String>>();
	List<String> col;
	col = new LinkedList<String>();
	col.add(DataSet.ColTypes.STRING);
	col.add("Academic Years");
	cols.add(col);

        for (FundingInstitution institutions: this.institutions) {
	     col = new LinkedList<String>();
	     col.add(DataSet.ColTypes.NUMBER);
	     col.add(institutions.name);
	     cols.add(col);
        }
	return cols;
    }


    public List<List> getData() {
	List<List> data = new ArrayList<List>();

        int to_c = SchoolCalendar.thisCycle();
        int from_c = to_c - YEARS_REQUIRED + 1;

        for (int i = from_c; i <= to_c; i++){
            List row = new LinkedList();
            row.add(SchoolCalendar.cycle2a_y(i));
            for (FundingInstitution fund: this.institutions) {
                int val = Student.allActive()
                    .eq("phd_cycle", Integer.toString(i))
                    .eq("fundingInstitution", fund)
                    .findRowCount();
                row.add(new Integer(val));
            }
            data.add(row);
        }
	return data;
    }

}

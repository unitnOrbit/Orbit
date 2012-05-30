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
 * Average student marks.
 *
 * Builds the data table as follows:
 *   Year   | Fund.Inst1 | ... | Fund.InstN
 * [string] | [number]   | ... | [number]
 * ---------+------------+-----+-----------
 * 2011-2012|   avg mark | ... |  avg marks
 *
 * -1.0 as avarage mark means no data (no exam taken by students
 * with scholarship by the corresponding funding institution).
 */
public class AverageMark
    implements DataSet {

    public static final int YEARS_REQUIRED = 5;

    private List<FundingInstitution> institutions;

    public AverageMark() {
        institutions = new LinkedList();
        for (FundingInstitution fi: FundingInstitution.find.all()) {
            institutions.add(fi);
        }
    }

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
        col.add("Academic Year");
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
                List<Student> list = Student.allActive()
                    .eq("phd_cycle", Integer.toString(i))
                    .eq("fundingInstitution", fund)
                    .findList();
                double sum = 0;
                int count = 0;
                for (Student s: list) {
                    Double mean = s.marks_mean();
                    if (mean != null) {
                        count ++;
                        sum += mean.doubleValue();
                    }
                }
                if (count > 0)
                    row.add(new Double(sum/count));
                else
                    row.add(new Double(-1.0));
            }
            data.add(row);
        }
        return data;
    }

}

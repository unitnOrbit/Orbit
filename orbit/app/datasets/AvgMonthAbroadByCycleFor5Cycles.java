package datasets;

import java.util.*;
import models.global.*;

/**
 * Class for building the statistic representing
 * Students grouped by nationality.
 *
 * Builds the data table as follows:
 *   Year   |Avg months abroad
 * [string] |    [number]
 * ---------+-----------------
 * 2011-2012|      num
 */
public class AvgMonthAbroadByCycleFor5Cycles
    implements DataSet {


    public static final int YEARS_REQUIRED = 5;

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

        col = new LinkedList<String>();
        col.add(DataSet.ColTypes.NUMBER);
        col.add("Avg months spent abroad");
        cols.add(col);

        return cols;
    }

    public List<List> getData() {
    	List<List> data = new ArrayList<List>();
        int to_c = SchoolCalendar.thisCycle();
        int from_c = to_c - YEARS_REQUIRED + 1;

        for (int cycle = from_c; cycle <= to_c; cycle++){
            SchoolCalendar.CalendarRange cyclebounds =
                SchoolCalendar.cyclebounds(cycle);
            List row = new LinkedList();
            row.add(SchoolCalendar.cycle2a_y(cycle));
            // count days spent abroad
            int daysAbroad = 0;
            List<Trip> trips = Trip.find
                .where()
                .raw("actual_begin_date_time < actual_end_date_time")
                .ge("actual_begin_date_time", cyclebounds.start.getTime())
                .le("actual_begin_date_time", cyclebounds.end.getTime())
                .findList();
            for (Trip tr: trips) {
                if (tr.actualEndDateTime != null) {
                    SchoolCalendar.CalendarRange tripRange =
                        new SchoolCalendar.CalendarRange(tr.actualBeginDateTime,
                                                         tr.actualEndDateTime);
                    daysAbroad += tripRange.daysDiff();
                    System.out.println("  " + daysAbroad);
                }
            }
            // count students
            int num_students =
                // note that MySQL automatically converts phd_cycle
                // to integer when needed
                Student.find.where()
                .le("phd_cycle", cycle)
                .eq("is_graduated", true)
                .ge("graduation_date", cyclebounds.start.getTime())
                .findRowCount()
                +
                Student.find.where()
                .le("phd_cycle", cycle)
                .eq("is_graduated", false)
                .raw("(phd_cycle + course_year - 1) >= ?", cycle)
                .findRowCount()
                ;
            //System.out.println("cycle "+cycle
            //                   +", "+num_students
            //                   +" students, totalling "
            //                   +daysAbroad+" days.");

            if (num_students > 0)
                row.add(new Double( (((double)daysAbroad)/num_students)/30 ));
            else
                row.add(new Double(0));

            data.add(row);
        }

	return data;
     }
}

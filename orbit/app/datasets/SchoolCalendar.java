package datasets;

import java.util.Calendar;
import org.joda.time.Days;
import org.joda.time.DateTime;

/**
 * Constants and utilities for dealing with timing and calendar
 * concerning the PhD School.
 */
public class SchoolCalendar {

    /**
     * Month of academic year start, in 0-based notation.
     */
    public static final int START_OF_YEAR = Calendar.NOVEMBER;

    /**
     * Year before 1st cycle.
     *
     * i.e the year before the spring semester for students from cycle 1,
     * which is the same as the year of the call for cycle 1.
     */
    public static final int CYCLE_ZERO = 1985;

    /**
     * Performs a convertion from year to phd cycle number.
     */
    public static int y2cycle(int year) {
        return year - CYCLE_ZERO;
    }
    /**
     * Converts from cycle number to academic year string e.g. 28 -> "2012-2013".
     */
    public static String cycle2a_y(int cycle) {
        int year = CYCLE_ZERO + cycle;
        return ((year-1) + " - " + (year));
    }

    /**
     * Return the current year (+1 if START_OF_YEAR has passed).
     */
    public static int thisYear() {
        Calendar c = Calendar.getInstance();
        int thisyear = c.get(Calendar.YEAR);
        if (c.get(Calendar.MONTH) >= START_OF_YEAR) {
            return thisyear + 1;
        }
        else {
            return thisyear;
        }
    }

    /**
     * Return the current PhD School cycle.
     */
    public static int thisCycle() {
        return y2cycle(thisYear());
    }

    /**
     * Little struct for storing two dates.
     */
    public static class CalendarRange {
        public Calendar start;
        public Calendar end;

        public CalendarRange(Calendar start, Calendar end) {
            this.start = start;
            this.end = end;
        }

        /**
         * Returns the difference in days between end and start.
         */
        public int daysDiff(){
            if (this.start.equals(this.end)) {
                return 0;
            }
            else {
                return
                    Days.daysBetween(new DateTime(this.start),
                                     new DateTime(this.end))
                    .getDays() ;
            }
        }
    }

    /**
     * Return the CalendarRange corresponding to the specified cycle.
     */
    public static CalendarRange cyclebounds(int cycle) {
        int year = CYCLE_ZERO + cycle;
        Calendar start = Calendar.getInstance();
        start.set(year-1, START_OF_YEAR, 1);
        // end is one year minus one day later
        Calendar end = (Calendar) start.clone();
        end.add(Calendar.YEAR, 1);
        end.add(Calendar.DAY_OF_MONTH, -1);

        return new CalendarRange(start, end);
    }

}
package datasets;

import java.util.Calendar;

/**
 * Constants and utilities for dealing with timing and calendar
 * concerning the PhD School.
 */
public class SchoolCalendar {

    /**
     * Month of academic year start.
     */
    public static final int START_OF_YEAR = 10;

    /** 
     * Year of 1st cycle.
     *
     * i.e the year when there was the spring semester for students from cycle 1
     */
    public static final int CYCLE_ONE = 1985;

    /**
     * Performs a convertion from year to phd cycle number.
     */
    public static int y2cycle(int year) {
        return year - CYCLE_ONE;
    }
    /**
     * Converts from cycle number to academic year string e.g. 28 -> "2012-2013".
     */
    public static String cycle2a_y(int cycle) {
        int year = CYCLE_ONE + cycle;
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

    /** Return the current PhD School cycle. */
    public static int thisCycle() {
        return y2cycle(thisYear());
    }
}
package controllers;
import views.html.*;
import play.mvc.*;
import java.util.*;

import models.statistics.*;
import models.global.UserCredentials;

public class Browsing extends Controller {

    /**
     * Returns the list of categories available to the current user.
     *
     * Useful for building the sidebar.
     */
    public static List<Category> get_cat_list() {
        return Category.find.all();
    }

    /**
     * Returns a page for navigating across categories.
     */
    public static Result cat_list() {
        List<Category> cats = get_cat_list();
        User user = Secured.user();
        List<Category> ret = new LinkedList<Category>();
        for (Category c:cats) {
            if (c.allowed_reports(user).size() > 0)
                ret.add(c);
        }
    	return ok(cat_list.render(ret));
    }

    /**
     * Returns a page for navigating across reports in the given category.
     */
    public static Result cat_by_id(Long cat_id) {
    	Category cat = Category.find.byId(cat_id);
        List<Report> reports = cat.allowed_reports(Secured.user());
    	return ok(cat_view.render(cat, reports));
    }

    /**
     * Returns a page displaying the given category.
     */
    public static Result report_by_id(Long report_id) {
        List<String> stats = new LinkedList<String>();
        Report report = Report.find.byId(report_id);
        
        if ( ! report.is_authorized(Secured.user()) ) {
            return forbidden("You are not allowed to see this report!\n");
        }
        
        for (Statistic stat: report.statistics) {
            stats.add(controllers.routes.Browsing.statistic_by_id(stat.id).toString());
        }
        Category cat = null;
        try {
            cat = Category.find.byId(
                                     Long.parseLong(request().queryString().get("category")[0])
                                     );
        }
        catch (NullPointerException e) {
            cat = report.categories.get(0);
        }
        catch (NumberFormatException e) {
            cat = report.categories.get(0);
        }
        
        return ok(reports.render(cat, report, play.libs.Json.toJson(stats).toString()));
    }
    
    /**
     * Return a json with information about the statistic and 
     * how to display/plot it
     */
    public static Result statistic_by_id(Long stat_id) {
        Statistic stat = Statistic.find.byId(stat_id);
        
        if ( ! stat.is_authorized(Secured.user()) ) {
            return forbidden("Forbidden\n");
        }
        
        String res;
        try {
            return ok(stat.toJson());
        }
        catch (DataSet.InvalidClassNameException e) {
            return internalServerError(e.getMessage());
        }
    }
    
    /*
     public static Result most_common() {
     
     Map<String,Object> cat = new HashMap<String,Object>();
     cat.put("ok","true");
     
     List<String> cat_id_list = new LinkedList<String>();
     
     cat_id_list.add("Current Students");
     cat_id_list.add("Student Application");
     cat_id_list.add("Student marks");
     cat.put("list",cat_id_list);
     
     return ok(toJson(cat));
     }
     */

    /**
     * utility function: splits the give iterable into
     * a list of lists where each sublist has n elements,
     * except the last one that might have less elements.
     */
    public static <T> List<List<T>> split(Iterable<T> in, int n) {
        LinkedList<List<T>> ret = new LinkedList<List<T>>();
        for (T item: in) {
            if (ret.peek() == null) {
                ret.addLast(new LinkedList<T>());
            }
            else if (ret.getLast().size() >= n) {
                ret.addLast(new LinkedList<T>());
            }
            ret.getLast().add(item);
        }
        return ret;
    }
}

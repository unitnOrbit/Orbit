package controllers;
import views.html.*;
import play.mvc.*;
import java.util.*;
import static play.libs.Json.toJson;

import models.statistics.*;

public class Browsing extends Controller {

    /*
    public static Result list() {
    	Map<String,Object> d = new HashMap<String,Object>();
    	d.put("ok","true");
    	List<String> cat_list = new LinkedList<String>();
    	cat_list.add("Current Students");
    	cat_list.add("Student Application");
    	cat_list.add("Student marks");
		d.put("list",cat_list);
		return ok(toJson(d));
    }
    */

    /**
     * Returns a page for navigating across categories.
     */
    public static Result cat_list() {
	System.out.println(request().username());
	System.out.println(Secured.username());
    	List<models.statistics.Category> cats = models.statistics.Category.find.all();
    	return ok(cat_list.render(cats));
    }
    
    /**
     * Return the list of categories. Useful for building the sidebar.
     */
    public static List<models.statistics.Category> getMainCategory() {
        List<models.statistics.Category> cats = models.statistics.Category.find.all();
        return cats;
    }

    /**
     * Returns a page for navigating across reports in the given category.
     */
    public static Result cat_by_id(Long cat_id) {

    	models.statistics.Category cat =
    		models.statistics.Category.find.byId(cat_id);

    	for (Report	r:cat.reports){
    		String s = r.name; //does nothing, but forces fetching the database
    	}

    	return ok(cat_view.render(cat, cat.reports));
    }
    
    /**
     * Returns a page displaying the given category.
     */
    public static Result report_by_id(Long report_id) {
	List<Long> stats = new LinkedList<Long>();
	Report report = Report.find.byId(report_id);
	for (Statistic stat: report.statistics) {
	    stats.add(stat.id);
	}
	//return ok(stats.toString());
        return ok(reports.render(report, stats));
    }
    
    /**
     * Returns a json with information about the statistic and 
     * how to display/plot it
     */
    public static Result statistic_by_id(Long stat_id) {
	Statistic stat = Statistic.find.byId(stat_id);
	Map res = new HashMap();
	res.put("title", stat.name);
	res.put("description", stat.description);
	res.put("type", stat.widget.description);
	Class ds_class = null;
	datasets.DataSet ds = null;
	try {
	    ds_class = Class.forName(stat.dataset.description);
	    ds = (datasets.DataSet) ds_class.newInstance();
	}
	catch (ClassNotFoundException e) {
	    return internalServerError(
                String.format("The DataSet \"%s\" references a non-existing "
			      + "java class. Note that nested classes are "
			      + "not allowed.",
			      stat.dataset.description)
	    );
	}
	catch (IllegalAccessException e) {
	    return internalServerError(
                String.format("The DataSet \"%s\" references an unaccessible "
			      + "java class. Both the class and its nullary "
			      + "contructor must be accessable.",
			      stat.dataset.description)
	    );
	}
	catch (InstantiationException e) {
	    return internalServerError(
                String.format("The DataSet \"%s\" references a java class "
			      + "which is not instantiable. The class must be "
			      + "instantiable (not abstract, not an interface) "
			      + "and have a nullary constructor.",
			      ds_class.getName())
	    );
	}
	catch (ClassCastException e) {
	    return internalServerError(
                String.format("The DataSet \"%s\" references a java class "
			      + "which does not implement %s.",
			      ds_class.getName(),
			      datasets.DataSet.class.getName())
	    );
	}
	res.put("columns", ds.getColumns());
	res.put("data", ds.getData());
	return ok(toJson(res));
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

}

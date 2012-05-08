package controllers;
import views.html.*;
import play.mvc.*;
import java.util.*;
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

    public static Result cat_list() {
    	
    	List<models.statistics.Category> cats = models.statistics.Category.find.all();
    	
    	return ok(cat_list.render(cats));
    }
    
    public static List<models.statistics.Category> getMainCategory() {
        List<models.statistics.Category> cats = models.statistics.Category.find.all();
        return cats;
    }
    public static Result cat_by_id(Long cat_id) {

    	models.statistics.Category cat =
    		models.statistics.Category.find.byId(cat_id);

    	for (Statistic 	r:cat.statistics){
    		String s = r.name; //does nothing, but forces fetching the database
    	}

    	return ok(cat_view.render(cat, cat.statistics));
    }
    
    public static Result report_by_id(Long report_id) {
        return TODO;
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

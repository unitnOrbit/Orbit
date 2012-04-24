package controllers;

import play.mvc.*;
import static play.libs.Json.toJson;
import java.util.*;


public class Report extends Controller {

    public static Result by_id(Long report_id) {
        return TODO;
    }

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
    
    public static Result getChartsList(Long cat_id){
    	
    	Map<String,Object> cat = new HashMap<String,Object>();
    	cat.put("ok","true");
    	List<String> cat_id_list = new LinkedList<String>();
    	cat_id_list.add("Grafico 1 [id: " + cat_id + "]");
    	cat_id_list.add("Grafico 2");
    	cat_id_list.add("Grafico 3");
    	cat.put("list",cat_id_list);
    	
    	return ok(toJson(cat));
    }
    
    public static Result example() {
	return ok("prova");
    }

}

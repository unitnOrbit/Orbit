package controllers;

import play.*;
import play.mvc.*;
import play.api.libs.*;
import play.api.libs.json.*;
import play.api.libs.json.JsObject;
import views.html.*;
import models.*;
import java.util.*;

import static play.libs.Json.toJson;
//import java.util.Map;
//import java.util.HashMap;
import java.util.*;

public class Category extends Controller {

    public static Result list() {
    
	Map<String,Object> d = new HashMap<String,Object>();
	d.put("ok","true");
	List<String> cat_list = new LinkedList();
	cat_list.add("Current Students");
	cat_list.add("Student Application");
	cat_list.add("Student marks");
	d.put("list",cat_list);
	return ok(toJson(d));

    }

    public static Result by_id(Long cat_id) {
        //return ok(index.render("Your new application is ready."));
	return TODO;
    }


}

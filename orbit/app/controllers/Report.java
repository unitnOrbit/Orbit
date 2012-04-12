package controllers;

import play.mvc.*;
import static play.libs.Json.toJson;
import java.util.*;


public class Report extends Controller {

    public static Result by_id(Long report_id) {
        return TODO;
    }

    public static Result most_common() {
    	Map<String,String> stringMap = new HashMap<String,String>();
    	stringMap.put("nome","paolo");
    	stringMap.put("cognome","rossi");
        return ok(toJson(stringMap));
    	
    }
    
    public static Result example() {
	return ok("prova");
    }

}

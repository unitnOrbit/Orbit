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
import java.util.Map;
import java.util.HashMap;

public class Category extends Controller {

      public static Result list() {
    
        Map<String,String> d = new HashMap<String,String>();
    d.put("stringa1","stringa2");
    d.put("stringa3","stringa4");
    return ok(toJson(d));




    }

    public static Result by_id(Integer cat_id) {
        return ok(index.render("Your new application is ready."));
    }


}

package controllers;

import play.*;
import play.mvc.*;
import views.html.*;
import models.*;
import java.util.*;

public class Application extends Controller {

    public static Result index() {
        return ok(index.render("Your new application is ready."));
    }
   
    public static Result prova() {
        return ok(prova.render("Ho vinto."));
    }
  
    public static Result dbtest() {
        //Country c = new Country();
	//c.name = "Vaffanculo";
        //c.region = "Northen Europe";
        //c.save();

       /* List<Countries> l = Countries.find.all();
        StringBuffer ret_val = new StringBuffer();
	for (Countries c2: l){
	   ret_val.append(c2.toString());
        }
        
        return ok(ret_val.toString());
    */
      return TODO;
  }
  
}
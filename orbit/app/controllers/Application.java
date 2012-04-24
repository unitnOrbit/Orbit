package controllers;

import play.*;
import play.mvc.*;
import views.html.*;
import models.global.*;
import models.statistics.*;
import java.util.*;

public class Application extends Controller {

    public static Result index() {
        return ok(index.render());
    }
    



    // test
    public static Result aboutPage() {
        return ok(about.render());
    }    

    public static Result testPage(Long id_cat) {
        return ok(test.render(id_cat));
    }

    public static Result testPage2(Long id_graph) {
        return ok(test2.render (id_graph));
    }
   
    public static Result prova() {
        return ok(prova.render("ho vinto"));
    }

    public static Result dbtest() {
        List<Country> l = Country.find.all();
        StringBuffer ret_val = new StringBuffer();
        for (Country c2: l){
            ret_val.append(c2.toString());
        }
        
        return ok(ret_val.toString());
        
    }
  
}

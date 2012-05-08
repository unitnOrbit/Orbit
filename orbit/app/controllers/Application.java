package controllers;

import play.*;
import play.mvc.*;
import views.html.*;
import models.global.*;
import models.statistics.*;
import java.util.*;

/**
 * Main Controller class for the project: contains controllers
 * for static pages, and pages
 * which don't fit other Controllers.
 */
public class Application extends Controller {
    /**
     * Renders the home page. Actually, simply calls the 
     * category list page
     */
    public static Result index() {
	return controllers.Browsing.cat_list();
    }
    
    /**
     * Renders the 'about' page.
     */
    public static Result aboutPage() {
        return ok(about.render());
    }    

    //


    /**
     * If the url doesn't end in '/', redirects to the same
     * url with a trailing '/', otherways returns 404 Not Found error.
     * This is designed to be the LAST pattern in the routes file,
     * and to match urls that didn't match any other pattern
     * 
     * @param path The url string
     */
    public static Result appendSlash(String path) {
	char ending = path.charAt(path.length() -1 );
	if (ending != '/')
	    return redirect('/' + path + '/');
	else
	    return notFound();
    }

    /////////////////////////////////////////////////////
    ///////////////// TESTING STUFF /////////////////////
    /////////////////////////////////////////////////////

    public static Result chartPage(Long id_cat, Long id_chart) {
	return ok(chart.render(id_cat, id_chart));
    }

    public static Result prova() {
        return ok(prova.render("ho vinto"));
    }

    public static Result dbtest() {
        StringBuffer ret_val = new StringBuffer();
	ret_val.append("Ciao\n");
	
	List<DataSet> l = DataSet.find.all();
	
	for (DataSet d:l){
	    //ret_val.append(l.toString());
	}

	List<Country> l2 = Country.find.all();
	
	for (Country c2: l2){
            //ret_val.append(c2.toString());
	}
	
	Statistic s = Statistic.find.byId(1L);
        Report r = Report.find.byId(1L);
	Widget w = s.widget;
	DataSet ds = s.dataset;
	Set<models.statistics.Category> cats = r.categories;
	
	for(models.statistics.Category cat: cats){
	    ret_val.append(cat.toString());
	}
	
	//ret_val.append(s.widget.toString());
	//ret_val.append(s.dataset.toString()); 
	//ret_val.append(s.categories.toString());
	
	return ok(ret_val.toString());
        
    }
  
}

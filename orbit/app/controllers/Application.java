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
}

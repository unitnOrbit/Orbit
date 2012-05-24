package controllers;

import play.*;
import play.mvc.*;
import play.data.*;

import views.html.*;
import models.global.*;
import models.statistics.*;

import java.util.*;
import java.lang.annotation.Documented;

/**
 * Controller class for administration pages. 
 * 
 * Note that any unauthorized user is redirected to 
 * the login page, according to Secured Authenticator.
 */
@Security.Authenticated(Secured.class)
public class Admin extends Controller {


    public static Result cat_edit_pg(Long cat_id) {
      models.statistics.Category cat =
    		models.statistics.Category.find.byId(cat_id);

    	for (Report r:cat.reports){
	    r.refresh(); // fetches object from database
    	}

	Form<Category> form = new Form(Category.class);
	return ok(cat_edit_pg.render(cat, cat.reports,form));
    }


    public static Result cat_edit(Long cat_id) {
	Form<Category> loginForm = form(Category.class);
	loginForm = loginForm.bindFromRequest();
        System.out.println("cat_id="+cat_id);
	return TODO;
    }

    public static Result cat_new_pg() {
	return TODO;
    }
    public static Result cat_new() {
	return TODO;
    }
    public static Result cat_del_pg(Long cat_id) {
	return TODO;
    }
    public static Result cat_del(Long cat_id) {
	return TODO;
    }

    public static Result report_edit_pg(Long report_id) {
        List<Long> stats = new LinkedList<Long>();
        Report report = Report.find.byId(report_id);
        for (Statistic stat: report.statistics) {
            stats.add(stat.id);
        }
        Category cat = null;
        try {
            cat = Category.find.byId(
                  Long.parseLong(request().queryString().get("category")[0])
              );
        }
        catch (NullPointerException e) {
            cat = report.categories.get(0);
        }
        catch (NumberFormatException e) {
            cat = report.categories.get(0);
        }
        
        Form<Report> form = new Form(Report.class).fill(report);
        
        return ok(report_edit_pg.render(cat, report, stats, form));
    }

    public static Result report_edit(Long report_id) {
        Form<Report> reportForm = form(Report.class).bindFromRequest();
        
        // DEBUG
        System.out.println("report name: " + reportForm.get().name);
        System.out.println("report desc: " + reportForm.get().description);
        //System.out.println("report visib: " + reportForm.get().visibility);

        reportForm.get().updateName(report_id, reportForm.get().name);        
    }

    public static Result report_new_pg() {
	return TODO;
    }
    public static Result report_new() {
	return TODO;
    }
    public static Result report_del_pg(Long report_id) {
	return TODO;
    }
    public static Result report_del(Long report_id) {
	return TODO;
    }
}
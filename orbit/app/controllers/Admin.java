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
        Category cat = Category.find.byId(cat_id);
        
    	for (Report r:cat.reports){
            r.refresh(); // fetches object from database
    	}

        Form<Category> form = new Form(Category.class).fill(cat);
        return ok(cat_edit_pg.render(cat, cat.reports,form));
    }

    public static Result cat_edit(Long cat_id) {
        Form<Category> categoryForm = form(Category.class).bindFromRequest();
        Category category = Category.find.byId(cat_id);
        
    	for (Report r:category.reports){
            r.refresh(); // fetches object from database
    	}
        
        // Checks if name is empty
        if(categoryForm.field("name").valueOr("").isEmpty()) {
            categoryForm.reject("name", "Cannot be empty!");
        }
        
        if(categoryForm.hasErrors()) {
            return(badRequest(cat_edit_pg.render(category, 
                                                 category.reports, 
                                                 categoryForm)));
        } else {
            System.out.println("Cat name: " + categoryForm.get().name);
            System.out.println("Cat descr: " + categoryForm.get().description);
            // TODO
            //System.out.println("Cat visib: " + categoryForm.get().visibility);
            
            categoryForm.get().updateName(cat_id, categoryForm.get().name);
            categoryForm.get().updateDescription(cat_id, categoryForm.get().description);
            // TODO
            //categoryForm.get().updateVisibility(cat_id, categoryForm.get().visibility);
            return ok(cat_edit_pg.render(category, category.reports, categoryForm));
        }
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
        Report report = Report.find.byId(report_id);
        List<Long> stats = new LinkedList<Long>();
        
        for (Statistic stat: report.statistics) {
            stats.add(stat.id);
        }
        
        Category cat = null;
        try {
            cat = Category.find.byId(Long.parseLong(request().queryString().get("category")[0]));
        }
        catch (NullPointerException e) {
            cat = report.categories.get(0);
        }
        catch (NumberFormatException e) {
            cat = report.categories.get(0);
        }
        
        // Checks if name is empty
        if(reportForm.field("name").valueOr("").isEmpty()) {
            reportForm.reject("name", "Cannot be empty!");            
        }
        
        if(reportForm.hasErrors()) {
            return badRequest(report_edit_pg.render(cat, report, stats, reportForm));
        } else {
            System.out.println("report name: " + reportForm.get().name);
            System.out.println("report desc: " + reportForm.get().description);
            // TODO
            //System.out.println("report visib: " + reportForm.get().visibility);
            
            reportForm.get().updateName(report_id, reportForm.get().name);
            reportForm.get().updateDescription(report_id, reportForm.get().description);
            // TODO
            //reportForm.get().updateVisibility(report_id, reportForm.get().visibility);
            
            return ok(report_edit_pg.render(cat, report, stats, reportForm));
        }        
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
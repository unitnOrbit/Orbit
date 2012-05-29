package controllers;

import play.*;
import play.mvc.*;
import play.data.*;

import views.html.*;
import models.global.*;
import models.statistics.*;

import java.util.*;
//import java.lang.annotation.Documented; // WTF?

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
        return ok(cat_edit_pg.render(cat, cat.reports, form, "edit"));
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
            return(badRequest(cat_edit_pg.render(category, category.reports, 
                                                 categoryForm, "error")));
        } else {
            System.out.println("Cat name: " + categoryForm.get().name);
            System.out.println("Cat descr: " + categoryForm.get().description);
            
            categoryForm.get().updateName(cat_id, categoryForm.get().name);
            categoryForm.get().updateDescription(cat_id, categoryForm.get().description);
            return ok(cat_edit_pg.render(category, category.reports, 
                                         categoryForm, "success"));
        }
    }
    
    /**
     * Displays a form for the creation of the category
     */    
    public static Result cat_new_pg() {
        Form<Category> newCatForm = new Form(Category.class);
        
        return ok(cat_new.render(newCatForm));
    }
    
    /** 
     * Process data received from the form and proceed with the creation
     */
    public static Result cat_new() {
        Form<Category> newCatForm = form(Category.class).bindFromRequest();
        List<Category> cats_list = Category.find.all();

        // Checks if name is empty
        if(newCatForm.field("name").valueOr("").isEmpty()) {
            newCatForm.reject("name", "Cannot be empty!");
        }
        
        if(newCatForm.hasErrors()) {
            System.err.println("\tFAIL: " + newCatForm.errors());
            return badRequest(cat_new.render(newCatForm));
        } else {
            String name = newCatForm.field("name").value();
            String description = newCatForm.field("description").value();
            newCatForm.get().createCategory(name, description);
            return ok(cat_list.render(cats_list));
            //return TODO;
        }
        
    }
    
    /**
     * Displays a form for the removal of the category
     */    
    public static Result cat_del_pg(Long cat_id) {
        Form<Category> catDelForm = form(Category.class);
        Category category = Category.find.byId(cat_id);
        
        return ok(cat_remove.render(category, catDelForm));
    }
    
    /** 
     * Process data received from the form and proceed with the cancellation
     */
    public static Result cat_del(Long cat_id) {
        Form<Category> catDelForm = form(Category.class).bindFromRequest();
        Category category = Category.find.byId(cat_id);
        List<Category> cats_list = Category.find.all();
        
        // Debug msg
        System.out.println(">\tcat_del(" + cat_id + ")");
        System.out.println("\tname: " + category.name);
        
        // Checks if the confirmation is true
        if(catDelForm.field("confirmation").value() == null) {
            catDelForm.reject("confirmation", "You must confirm this box to continue!");            
        }
        
        if(catDelForm.hasErrors()) {
            System.err.println("\tFAIL: " + catDelForm.errors());
            return badRequest(cat_remove.render(category, catDelForm));
        } else {
            catDelForm.get().deleteCategory(cat_id);
            
            System.out.println("\tSUCCESS!\n");
            return ok(cat_list.render(cats_list));
        }
    }
    
    public static Result report_edit_pg(Long report_id) {
        Report report = Report.find.byId(report_id);
        List<Long> stats = new LinkedList<Long>();
        List<UserRole> roles = report.allowed_roles;
        
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

        Form<Report> form = new Form(Report.class).fill(report);
        for(UserRole role:report.allowed_roles) {
            System.out.println(role.role);
            String currentRole = "role-" + role.userrolID;
            //form.fill(wtf wtf wtf);
        }
        
        return ok(report_edit_pg.render(cat, report, stats, form, roles, "edit"));
    }
    
    public static Result report_edit(Long report_id) {
        Form<Report> reportForm = form(Report.class).bindFromRequest();
        Report report = Report.find.byId(report_id);
        List<Long> stats = new LinkedList<Long>();
        List<UserRole> roles = report.allowed_roles;
        
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
        
        // Debug msg
        System.out.println(">\treport_edit(" + report_id + ")");
        
        // Checks if name is empty
        if(reportForm.field("name").valueOr("").isEmpty()) {
            reportForm.reject("name", "Cannot be empty!");
        }
        
        if(reportForm.hasErrors()) {
            System.out.println("FAIL: " + reportForm.errors());
            return badRequest(report_edit_pg.render(cat, report, stats, reportForm, roles, "error"));
        } else {
            System.out.println("\tSUCCESS!\n");
            
            reportForm.get().updateName(report_id, reportForm.get().name);
            reportForm.get().updateDescription(report_id, reportForm.get().description);
            reportForm.get().updateVisibility(report_id, reportForm.get().is_public);
            
            return ok(report_edit_pg.render(cat, report, stats, reportForm, roles, "success"));
        }        
    }
    
    public static Result report_new_pg() {
        return TODO;
    }
    public static Result report_new() {
        return TODO;
    }
    
    /**
     * Displays a form for the removal of the report
     */
    public static Result report_del_pg(Long report_id) {
        Form<Report> repDelForm = form(Report.class).bindFromRequest();
        Report report = Report.find.byId(report_id);
        
        //return ok(report_remove.render(report, repDelForm));
        return TODO;
    }
    
    /** 
     * Process data received from the form and proceed with the cancellation
     */
    public static Result report_del(Long report_id) {
        return TODO;
    }
}
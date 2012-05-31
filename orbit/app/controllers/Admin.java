package controllers;

import play.*;
import play.mvc.*;
import play.data.*;

import views.html.*;
import models.global.*;
import models.statistics.*;

import java.util.*;
import com.avaje.ebean.Ebean;

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
            return redirect(routes.Application.index());
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
            //return ok(cat_list.render(cats_list));
            return redirect(routes.Application.index());
        }
    }
    
    public static Result report_edit_pg(Long report_id) {
        Report report = Report.find.byId(report_id);
        List<Category> cats = Category.find.all();
        List<UserRole> roles = UserRole.find.where()
            .eq("deleted", false).findList();

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

        Form<Report> formRepEdit = new Form(Report.class).fill(report);

        return ok(report_edit.render(cat, report, formRepEdit, cats, roles));
    }

    public static Result report_edit(Long report_id) {
        Form<Report> reportForm = form(Report.class).bindFromRequest();
        Report report = Report.find.byId(report_id);
        List<Category> cats = Category.find.all();
        List<UserRole> roles = UserRole.find.where()
            .eq("deleted", false).findList();

        Category cat = null;
        try {
            cat = Category.find.byId(Long.parseLong(request().queryString()
                                                    .get("category")[0]));
        }
        catch (NullPointerException e) {
            cat = report.categories.get(0);
        }
        catch (NumberFormatException e) {
            cat = report.categories.get(0);
        }

        if(reportForm.hasErrors()) {
            return badRequest(report_edit.render(cat, report, reportForm,
                                                 cats, roles));
        }
        else {
            Report newreport = reportForm.get();
            newreport.update(report.id); //.save();

            System.out.println("old report,  id="+report.id);
            //System.out.println(reportForm.data().toString());
            Ebean.deleteManyToManyAssociations(newreport, "allowed_roles");
            for(UserRole role: roles) {
                String val = reportForm.data().get("role-"+role.userrolID);
                System.out.println("  VAL: "+val);
                if ( val != null ) {
                    if( ! role.visible_reports.contains(role) ) {
                        newreport.allowed_roles.add(role);
                    }
                }
            }
            //role.saveManyToManyAssociations("visible_reports");
            //newreport.saveManyToManyAssociations("allowed_roles");
            //System.out.println(report.allowed_roles.toString());
            Ebean.saveManyToManyAssociations(newreport, "allowed_roles");

            Ebean.deleteManyToManyAssociations(newreport, "categories");
            for(Category c: cats) {
                String val = reportForm.data().get("cat-"+c.id);
                System.out.println("  VAL: "+val);
                if ( val != null ) {
                    if( ! newreport.categories.contains(c) ) {
                        newreport.categories.add(c);
                    }
                }
            }
            Ebean.saveManyToManyAssociations(newreport, "categories");

            return redirect(routes.Application.index());
        }
    }

    public static Result report_new_pg() {
        Form<Report> formRepNew = new Form(Report.class);
        List<Category> cats_list = Category.find.all();
        List<UserRole> roles = UserRole.find.where()
            .eq("deleted", false).findList();
        return ok(rep_new.render(formRepNew, cats_list, roles));
    }

    public static Result report_new() {
        Form<Report> reportForm = form(Report.class).bindFromRequest();
        List<Category> cats_list = Category.find.all();
        List<UserRole> roles = UserRole.find.where()
            .eq("deleted", false).findList();

        if(reportForm.hasErrors()) {
            //System.out.println("FAIL: " + reportForm.errors());
            return badRequest(rep_new.render(reportForm, cats_list, roles));
        }
        else {
            Report report = reportForm.get();
            report.save();

            //System.out.println("new report has id " + report.id);
            //System.out.println(reportForm.data().toString());
            for(UserRole role: roles) {
                String val = reportForm.data().get("role-"+role.userrolID);
                System.out.println("  VAL: "+val);
                if ( val != null ) {
                    //if( ! role.visible_reports.contains(role) ) {
                    //role.visible_reports.add(report);
                    report.allowed_roles.add(role);
                    System.out.println("  "+report.allowed_roles.toString());
                    //}
                }
            }
            //role.saveManyToManyAssociations("visible_reports");
            //report.saveManyToManyAssociations("allowed_roles");
            //System.out.println(report.allowed_roles.toString());
            Ebean.saveManyToManyAssociations(report, "allowed_roles");

            for(Category cat: cats_list) {
                String val = reportForm.data().get("cat-"+cat.id);
                System.out.println("  VAL: "+val);
                if ( val != null ) {
                    //if( ! role.visible_reports.contains(role) ) {
                    //role.visible_reports.add(report);
                    report.categories.add(cat);
                    System.out.println("  "+report.allowed_roles.toString());
                    //}
                }
            }
            Ebean.saveManyToManyAssociations(report, "categories");

            return redirect(routes.Application.index());
        }
    }

    /**
     * Displays a form for the removal of the report
     */
    public static Result report_del_pg(Long report_id) {
        Form<Report> repDelForm = form(Report.class);
        Report report = Report.find.byId(report_id);

        return ok(report_remove.render(report, repDelForm));
    }

    private static class Confirm {
        boolean confirm;
        public String validate() {
            if (confirm == true)
                return null;
            else
                return "You must confirm before deleting";
        }
    }

    /**
     * Process data received from the form and proceed with the cancellation
     */
    public static Result report_del(Long report_id) {
        Form<Report> repDelForm = form(Report.class).bindFromRequest();
        Report report = Report.find.byId(report_id);
        List<Category> cats_list = Category.find.all();
        
        // Debug msg
        System.out.println(">\trep_del(" + report_id + ")");
        System.out.println("\tname: " + repDelForm.field("name").value());
        
        // Checks if the confirmation is true
        if(repDelForm.field("confirmation").value() == null) {
            repDelForm.reject("confirmation", "You must confirm this box to continue!");            
        }
 
        if(repDelForm.hasErrors()) {
            System.err.println("\tFAIL: " + repDelForm.errors());
            return badRequest(report_remove.render(report, repDelForm));
        }
        else {
            repDelForm.get().deleteReport(report_id);

            //System.out.println("\tSUCCESS!\n");
            //return ok(cat_list.render(cats_list));
            return redirect(routes.Application.index());
        }
    }
}

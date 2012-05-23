package controllers;

import play.*;
import play.mvc.*;
import views.html.*;
import models.global.*;
import models.statistics.*;
import java.util.*;
import java.lang.annotation.Documented;

/**
 * Controller class for administration pages. 
 * Note that any unauthorized user is redirected to 
 * the login page, according to Secured Authenticator
 */
@Security.Authenticated(Secured.class)
public class Admin extends Controller {
    public static Result cat_edit_pg(Long cat_id) {
	return TODO;
    }
    public static Result cat_edit(Long cat_id) {
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
	return TODO;
    }
    public static Result report_edit(Long report_id) {
	return TODO;
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
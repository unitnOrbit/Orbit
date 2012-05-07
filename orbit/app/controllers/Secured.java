package controllers;

import play.*;
import play.mvc.*;
import play.mvc.Http.*;

/**
 * Provides the Authenticator for the project, adding some
 * shortcuts for access control on web pages.
 */
public class Secured extends Security.Authenticator {
    
    @Override
    public String getUsername(Context ctx) {
        return ctx.session().get("username");
    }
    
    @Override
    public Result onUnauthorized(Context ctx) {
	//return redirect(routes.Application.index());
        return redirect(routes.Authentication.login());
    }
    
    
    ////// Access rights //////
    
    /**
     * Checks whether the current user is allowed to see the 
     * specified report.
     */
    public static boolean canSee(Long report_id) {
	// Context.current().request().
	return true; // TODO: actual access control
    }
    
    /**
     * Checks whether the current user is an admin.
     */
    public static boolean isAdmin(Long task) {
        return false; // TODO: actual access control
    }
    
}
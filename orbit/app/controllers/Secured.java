package controllers;

import models.global.AnonymousUser;
import models.global.UserCredentials;
import models.statistics.User;
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
    
    ////// Utilities to be called from controllers //////

    /**
     * Logs <code>username</code> in. 
     * This function does NOT check authentication.
     */
    public static void login(String username) {
	Context.current().session().put("username", username);
    }

    public static String username() {
	return Context.current().session().get("username");
    }

    public static User user() {
    	String u_name = username();
    	if (u_name == null) {
    		return new AnonymousUser();
    	}	
        else {
        	return UserCredentials.find.where().eq("username", u_name).findUnique();
        }
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
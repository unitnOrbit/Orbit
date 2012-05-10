package controllers;

import play.*;
import play.mvc.*;
import play.data.*;

import models.*;
import views.html.*;

import play.data.validation.Constraints.Required;

public class Authentication extends Controller {

    /**
     * Login class (used to feed the login form)
     */
    public static class Login {
        public String username;

	public String validate() {
	    /*
	    if (username == null){
		System.out.println(username);
		return "Null username is not allowed";
	    }
	    else if (username == "") {
		return "Empty username is not allowed";
		}*/
	    return null;
	}

	public String toString() {
	    return "<Authentication.Login obj: " + this.username + ">";
	}
    }

    /**
     * Login page.
     */
    public static Result login() {
        return ok(
            login.render(form(Login.class))
        );
    }

    /**
     * Handle login action.
     */
    public static Result authenticate() {
	
        Form<Login> loginForm = form(Login.class).bindFromRequest();
        if(loginForm.hasErrors()) {
	    // should never happen with fake authentication
	    return badRequest(loginForm.toString());
        } else {
	    //System.out.println(loginForm.get());
	    //System.out.println(loginForm.data());
	    //System.out.println(loginForm.get().getClass());
	    //System.out.println(loginForm.get().username);
	    System.out.println(request());
	    System.out.println(request().getClass());
	    System.out.println("");
	    System.out.println(loginForm);
	    System.out.println(loginForm.get());
	    System.out.println(loginForm.get().username);
	    System.out.println(loginForm.data().get("username"));
            //session("username", loginForm.data().get("username"));
	    Secured.login(loginForm.data().get("username"));
            return redirect(
                routes.Application.index()
            ); 
        }
    }

    /**
     * Logout and clean the session.
     */
    public static Result logout() {
        session().clear();
        // flash("success", "You've been logged out");
        return redirect( routes.Application.index() );
    }
  
}
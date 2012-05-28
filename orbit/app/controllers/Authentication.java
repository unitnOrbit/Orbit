package controllers;

import play.*;
import play.mvc.*;
import play.data.*;

import models.*;
import views.html.*;

import play.data.validation.Constraints.Required;
import models.statistics.User;

public class Authentication extends Controller {
    
    /**
     * Login class (used to feed the login form)
     * Validates if and only if the username exists in the database.
     * This is for developement only, meant to get things work
     * before the external authentication system is available.
     */
    public static class Login {
        public String username;
        
        public String validate() {
            if (username == null){
                return "Null username.";
            }
            else if (username == "") {
                return "Empty username.";
            }
            User user = Secured.user(username);
            if (user == null) {
                return "Invalid username.";
            }
            
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
        
        Form<Login> loginForm = form(Login.class);
        loginForm = loginForm.bindFromRequest();
        if(loginForm.hasErrors()) {
            return forbidden(login.render(loginForm));
        } else {
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

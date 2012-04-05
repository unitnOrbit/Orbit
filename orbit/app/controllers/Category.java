package controllers;

import play.*;
import play.mvc.*;
import views.html.*;
import models.*;
import java.util.*;

public class Category extends Controller {

    public static Result list() {
	return ok(index.render("Your new application is ready."));
    }

    public static Result by_id(Integer cat_id) {
        return ok(index.render("Your new application is ready."));
    }

}
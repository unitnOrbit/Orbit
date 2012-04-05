package controllers;

import play.*;
import play.mvc.*;
import views.html.*;
import models.*;
import java.util.*;

public class Report extends Controller {

    public static Result by_id(Integer report_id) {
        return ok(index.render("Your new application is ready."));
    }

}
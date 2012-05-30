package models.statistics;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;
import com.avaje.ebean.FetchConfig;

import models.global.UserRole;
import models.global.UserCredentials;

@Entity
public class Report extends Model {

    @Id
    public Long id;

    @Constraints.Required
    public String name;

    public String description;

    @NotNull()
    public boolean is_public;

    @ManyToMany()
    public List<Statistic> statistics;

    @ManyToMany()
    public List<Category> categories;

    @ManyToMany()
    public List<UserRole> allowed_roles;

    public static Finder<Long,Report> find = new Finder<Long, Report>(
      Long.class, Report.class
    );

    @Override
    public String toString(){
        return this.name;
    }


    // TODO: tidy up following methods: there is no need of getting id,
    // because they aren't static
    /**
     * Updates the name of report.
     *
     * @param id    The unique id of the report
     * @param name  The new name used for the report
     */
    public void updateName(Long id, String name) {
        Report selectedReport = Report.find.byId(id);
        selectedReport.name = name;
        selectedReport.update();
    }

    /**
     * Updates the description of report.
     *
     * @param id            The unique id of the report
     * @param description   The new description used for the report
     */
    public void updateDescription(Long id, String description) {
        Report selectedReport = Report.find.byId(id);
        selectedReport.description = description;
        selectedReport.update();
    }

    /**
     * Updates the visibility of report.
     *
     * @param id            The unique id of the report
     * @param visible       The new visibility used for the report
     */
    public void updateVisibility(Long id, List<UserRole> r) {
        Report selectedReport = Report.find.byId(id);
        //selectedReport.is_public = visible;
        selectedReport.update();
    }


    /**
     * Checks whether a user with the given Role
     * is allowed to see this report.
     */
    public boolean is_authorized(UserRole role) {
        for (UserRole allowed: this.allowed_roles) {
            if (allowed.userrolID == role.userrolID)
                return true;
        }
        return false;
    }

    /**
     * Checks whether the user with given UserCredentials
     * is allowed to see this report.
     */
    public boolean is_authorized(UserCredentials u) {
        return this.is_authorized(u.userRol);
    }

    /**
     * Checks whether The given User
     * is allowed to see this report.
     *
     * Note that if the user's username is not null,
     * a cast to UserCredentials is performed.
     */
    public boolean is_authorized(User user) {
        if (this.is_public || user.isAdmin()) {
            return true;
        } else {
            if (user.getUsername() == null) {
                return false;
            } else {
                if ( this.is_authorized((UserCredentials) user) )
                    return true;
                else
                    return false;
            }
        }
    }
}

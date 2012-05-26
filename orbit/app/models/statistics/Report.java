package models.statistics;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import models.global.UserRole;

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
        selectedReport.save();
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
        selectedReport.save();
    }

    /**
     * Updates the visibility of report.
     *
     * @param id            The unique id of the report
     * @param visibility    The new visibility used for the report
     */
    public void updateVisibility(Long id, boolean visibility) {
        Report selectedReport = Report.find.byId(id);
        // TODO: remove comments when "visibility" will be added
        //selectedReport.visibility = visibility;
        //selectedReport.save();
    }
}

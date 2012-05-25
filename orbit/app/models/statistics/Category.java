package models.statistics;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity
public class Category extends Model {

    @Id
    public Long id;
    
    public String name;

    public String description;

    @ManyToMany(mappedBy="categories")
    public List<Report> reports;

    public static Finder<Long,Category> find = new Finder<Long, Category>(
      Long.class, Category.class
    );

    @Override
    public String toString(){
        return this.name;
    }

    /**
     * Updates the name of category.
     *
     * @param id    The unique id of the category
     * @param name  The new name used for the category
     */
    public void updateName(Long id, String name) {
        Category selectedCategory = Category.find.byId(id);
        selectedCategory.name = name;
        selectedCategory.save();
    }
    
    /**
     * Updates the description of category.
     *
     * @param id            The unique id of the category
     * @param description   The new description used for the category
     */
    public void updateDescription(Long id, String description) {        
        Category selectedCategory = Category.find.byId(id);
        selectedCategory.description = description;
        selectedCategory.save();
    }
    
    /**
     * Updates the visibility of category.
     *
     * @param id            The unique id of the category
     * @param visibility    The new visibility used for the category
     */    
    public void updateVisibility(Long id, boolean visibility) {
        Category selectedCategory = Category.find.byId(id);
        
        // TODO: remove comments when "visibility" will be added
        //selectedCategory.visibility = visibility;
        //selectedCategory.save();
    }    
    
    //
    // CLEAN HERE
    //
    //public List<Report> report_list() {
    //    Report.find.where().eq("id", this.id)
    //}
}

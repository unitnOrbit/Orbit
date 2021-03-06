package models.statistics;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.Ebean;

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
     * Returns the list of reports the specified
     * user is allowed to see.
     */
    public List<Report> allowed_reports(User user) {
        List<Report> allowed = new LinkedList<Report>();
        for (Report report: this.reports) {
            if (report.is_authorized(user))
                allowed.add(report);
        }
        return allowed;
    }

    public void createCategory(String name, String descr) {
        this.name = name;
        this.description = descr;
        this.save();
        //System.out.println("New Category: "+ name + ", " + descr);
        //save();
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
        selectedCategory.update();
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
        selectedCategory.update();
    }

    /**
     * Remove the selected category.
     *
     * @param id    The unique id of the category
     */ 
    public void deleteCategory(Long id) {
        Category category = Category.find.byId(id);
        Ebean.deleteManyToManyAssociations(category, "reports");
        find.ref(id).delete();
    }
}

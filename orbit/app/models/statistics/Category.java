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
    public Integer id;
    
    public String name;

    public String description;

    public static Finder<Long,Category> find = new Finder(
      Long.class, Category.class
    );

    @Override
    public String toString(){
        return this.name;
    }
}

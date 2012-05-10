package models.statistics;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity
public class Widget extends Model {

    @Id
    public Long id;
    
    @Constraints.Required
    public String name;

    @Constraints.Required
    public String description;

    //@OneToMany(mappedBy="widget")
    //public Statistic statistic;

    public static Finder<Long,Widget> find = new Finder<Long, Widget>(
      Long.class, Widget.class
    );

    @Override
    public String toString(){
        return this.name;
    }
}

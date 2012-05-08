package models.statistics;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity
public class UserGroup extends Model {

    @Id
    public Long id;
    
    @Constraints.Required
    public String type_user;

    //@ManyToMany
    //public Statistic statistic;

    public static Finder<Long,UserGroup> find = new Finder<Long, UserGroup>(
      Long.class, UserGroup.class
    );

    @Override
    public String toString(){
        return this.type_user;
    }
}

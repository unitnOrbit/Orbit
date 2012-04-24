package models.statistics;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity
public class User_Group extends Model {

    @Id
	@Constraints.Min(10)
    public Integer id;
    
	@Constraints.Required
    public String type_user;


    public static Finder<Long,User_Group> find = new Finder(
      Long.class, User_Group.class
    );

    @Override
    public String toString(){
        return this.type_user;
    }
}

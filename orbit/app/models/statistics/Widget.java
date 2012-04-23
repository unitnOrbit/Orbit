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
	@Constraints.Min(10)
    public Integer id;
    
	@Constraints.Required
    public String name;

    public String description;

    public static Finder<Long,Widget> find = new Finder(
      Long.class, Widget.class
    );

    @Override
    public String toString(){
        return this.name;
    }
}

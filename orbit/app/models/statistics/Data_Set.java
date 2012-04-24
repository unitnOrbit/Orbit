package models.statistics;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity
public class Data_Set extends Model {

    @Id
	@Constraints.Min(10)
    public Integer id;

    public String description;

    public static Finder<Long,Data_Set> find = new Finder(
      Long.class, Data_Set.class
    );

}

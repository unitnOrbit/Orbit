package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity 
@Table(name="countries")
public class Country extends Model {

    @Id
    @Column(name="country_ID")
    public Long id;

    //@Constraints.Required
    @Constraints.MaxLength(255)
    @Column(length=255, unique=true)
    public String name;

    //@Constraints.Required
    @Constraints.MaxLength(200)
    @Column(length=200)
    public String region;

    //@Constraints.Required
    @Constraints.MaxLength(255)
    public String citizenship;

    //@Constraints.Required
    public boolean deleted;

    public static Finder<Long,Country> find = new Finder<Long,Country>(
        Long.class, Country.class
    ); 

    public String toString(){
        return "Country instance: <" + name + ">";
    }
}
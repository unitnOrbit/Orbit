package models.global;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity
@Table(name = "countries")
public class Country extends Model {
    public static final long serialVersionUID = 1L;
    @Id
    @Column(name = "country_ID")
    public Integer countryID;
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "name")
    public String name;
    @Size(min = 1, max = 200)
    @Column(name = "region")
    public String region;
    @Size(min = 1, max = 255)
    @Column(name = "citizenship")
    public String citizenship;
    @Column(name = "deleted")
    public boolean deleted;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "countryOfProvenance")
    public Set<Student> studentsSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "citizenship")
    public Set<Student> studentsSet1;
    @OneToMany(mappedBy = "country")
    public Set<University> universitiesSet;

    public static Finder<Long,Country> find = new Finder<Long, Country>(
Long.class, Country.class
);

public static List<Country> all() {
return find.all();
}
public static void create(Country country) {
country.save();
}

public static void delete(Long id) {
find.ref(id).delete();
}
}

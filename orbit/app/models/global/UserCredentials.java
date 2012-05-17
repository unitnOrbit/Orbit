package models.global;


import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import models.statistics.User;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity
@Table(name = "users_credentials")
public class UserCredentials extends Model implements User {
    public static final long serialVersionUID = 1L;
    @Id
    @Column(name = "user_credential_ID")
    public Integer usercredentialID;
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "user_name")
    public String userName;
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "password")
    public String password;
    @JoinColumn(name = "user_rol", referencedColumnName = "user_rol_ID")
    @ManyToOne(optional = false)
    public UserRole userRol;
    @JoinColumn(name = "user", referencedColumnName = "user_ID")
    @ManyToOne(optional = false)
    public Student user;

    public static Finder<Long,UserCredentials> find = new Finder<Long, UserCredentials>(
      Long.class, UserCredentials.class
    );

    public static List<UserCredentials> all() {
      return find.all();
    }

    public static void create(UserCredentials usercredentials) {
      usercredentials.save();
    }

    public static void delete(Long id) {
       find.ref(id).delete();
    }

    public static UserCredentials authenticate(String username, String password) {
      return find.where().eq("username", username).eq("password", password).findUnique();
    }


   public boolean isAdmin(){
	   if(userRol.userrolID == 1) {
	       return true;
	   }
	   else {
           return false;
       }
   }

   public String getUsername(){
	 return this.userName;

   }
} 

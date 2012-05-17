package models.global;

import models.statistics.User;



public class AnonymousUser implements User{

	@Override
	public boolean isAdmin() {
		return false;
	}

	@Override
	public String getUsername() {
		return null;
	}
	

}
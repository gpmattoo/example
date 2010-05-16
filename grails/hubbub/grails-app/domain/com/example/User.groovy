package com.example

class User {

	String userId
	String password
	String homepage
	Date dateCreated
	Profile profile
	
    static constraints = {
		userId(size:3..20, unique:true)
		password(size:6..8, validator: {pass, user ->
			return pass != user.userId
		})
		homepage(url:true, nullable:true)
		profile(nullable:true)
    }

	static hasMany = [posts: Post, tags: Tag, following: User]
    
	static mapping = {
		profile lazy:false
		//posts sort:'dateCreated'
	}
}

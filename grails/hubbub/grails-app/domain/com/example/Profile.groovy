package com.example

class Profile {

	static belongsTo = User

	byte[] photo
	String fullname
	String bio
	String homepage
	String email
	String timezone
	String country
	String jabberAddress

    static constraints = {
		fullname(nullable:true)
		bio(nullable:true)
		homepage(url:true, maxSize:1000, nullable:true)
		email(email:true, nullable:true)
		photo(nullable:true)
		country(nullable:true)
		timezone(nullable:true)
		jabberAddress(email:true, nullable:true)
    }

	String toString() {
		"Profile for ${fullname} (${id})"
	}
}
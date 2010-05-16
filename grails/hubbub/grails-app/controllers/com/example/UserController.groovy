package com.example

import org.mortbay.jetty.Request;

class UserController {
	
	def scaffold = true
	
	//def index = { }
	
	def search = {
	}
	
	def results = {
		def users = User.findAllByUserIdLike("%${params.userId}%")
		return [users: users, term: params.userId]
	}

	def register = {
		if(request.post) {
			def user = new User(params)
			if(user.validate()) {
				user.save()
				flash.message = 'Successfully created user'
				redirect(uri:'/')
			} else {
				flash.message = 'Error Registering User'
				return [user:user]
			}
		}
	}

	def register2 = {UserRegistrationCommand cmd ->
		if(request.get) {
			return
		}
		if(cmd.hasErrors()) {
			return [user:cmd]
		} else {
			def user = new User(cmd.properties)
			def profile = new Profile(cmd.properties)
			if(user.save()) {
				flash.message = "Welcome aboard, ${cmd.fullname ?: cmd.userId}"
				redirect(uri:'/')
			} else {
				//maybe not unique userId
				return [user:cmd]
			}
		}
	}
}

class UserRegistrationCommand {
	String userId
	String password
	String passwordRepeat

	byte[] photo
	String fullname
	String bio
	String homepage
	String email
	String timezone
	String country
	String jabberAddress

	static constraints = {
		userId(size:3..20)
		password(size:6..8, blank:false, validator: {pass, cmd ->
			return pass != cmd.userId
		})
		passwordRepeat(nullable:false, validator: {pass2, cmd ->
			return pass2 == cmd.password
		})
		fullname(nullable:true)
		bio(nullable:true)
		homepage(url:true, nullable:true)
		email(email:true, nullable:true)
		photo(nullable:true)
		country(nullable:true)
		timezone(nullable:true)
		jabberAddress(email:true, nullable:true)
	}
}
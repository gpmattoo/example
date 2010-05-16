package com.example;
import grails.test.*

class QueryIntegrationTests extends GrailsUnitTestCase {
	
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testBasicDynamicFinders() {
    	new User(userId:'glen', password:'secret', profile: new Profile(email:'glen@glensmith.com')).save()
    	new User(userId:'peter', password:'sesame', profile:new Profile(homepage:'http://peter.com/')).save()

    	def user = User.findByPassword('sesame')
    	assertEquals 'peter', user.userId

    	user = User.findByUserIdAndPassword('glen', 'secret')
    	assertEquals 'glen', user.userId

    	def now = new Date()
    	def users = User.findAllByDateCreatedBetween(now-1, now)
    	assertEquals 2, users.size()

    	def profiles = Profile.findAllByEmailIsNotNull()
    	assertEquals 1, profiles.size()
    }

    void testQueryByExample() {
    	new User(userId:'glen', password:'password').save()
    	new User(userId:'peter', password:'password').save()
    	new User(userId:'cynthia', password:'sesame').save()

    	def usersToFind = new User(userId:'glen')
    	def u1 = User.find(usersToFind)
    	assertEquals('password', u1.password)

    	usersToFind = new User(userId:'cynthia')
    	def u2 = User.find(usersToFind)
    	assertEquals('cynthia', u2.userId)

    	usersToFind = new User(password:'password')
    	def u3 = User.findAll(usersToFind)
    	assertEquals(['glen','peter'], u3*.userId)
    }
}

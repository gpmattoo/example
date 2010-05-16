import grails.util.Environment;

import com.example.User;
import com.example.Profile;

class BootStrap {

     def init = { servletContext ->
     	switch(Environment.current) {
     	case Environment.DEVELOPMENT: 
     		createAdminUserIfRequired()
     		break
     	}
     }
     
     def destroy = {
    		 
     }

     void createAdminUserIfRequired() {
    	 if(!User.findByUserId('admin')) {
    		 println 'Fresh Database.  Creating ADMIN user'
    		 new User(
    				 userId:'admin', 
    				 password:'secret', 
    				 profile:new Profile(email:'admin@localhost.com')
    		 ).save(failOnError:true)
    	 } else {
    		 println 'Existing admin user, skipping creation'
    	 }
     }
} 
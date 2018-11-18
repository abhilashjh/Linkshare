import com.security.User
import com.security.Role
import com.security.UserRole

class BootStrap {

    def init = { servletContext ->

        User checkUser = User.findByUsername("demo")
        User userObj;
        Role checkRole = Role.findByAuthority("ROLE_USER")
        Role roleObj;
        if(!(checkUser || checkRole)) {
            if (!checkUser) {
                userObj = new User();
                userObj.firstName = "John"
                userObj.lastName = "Doe"
                userObj.username = "demo"
                userObj.password = "Demo@123"
                userObj.email = "abhilashjha@gmail.com"
                userObj.active = true
                userObj.admin = false
                userObj.accountExpired = false
                userObj.accountLocked = false
                userObj.passwordExpired = false
                userObj.enabled = true
                println userObj.validate()
                userObj.save(flush: true, failOnError: true)
            }
            else {
                userObj = checkUser;
            }

            if (!checkRole) {
                roleObj = new Role();
                roleObj.authority = "ROLE_USER"
                roleObj.save(flush: true)
            }
            else{
                roleObj = checkRole;
            }
            UserRole.create(userObj, roleObj, true)
        }


        checkUser = User.findByUsername("admin")
        checkRole = Role.findByAuthority("ROLE_USER")
        if(!(checkUser || checkRole)) {
            if (!checkUser) {
                userObj = new User();
                userObj.firstName = "Ken"
                userObj.lastName = "Roberts"
                userObj.username = "admin"
                userObj.password = "Admin@123"
                userObj.email = "abhilash@nexthoughts.com"
                userObj.active = true
                userObj.admin = false
                userObj.accountExpired = false
                userObj.accountLocked = false
                userObj.passwordExpired = false
                userObj.enabled = true
                userObj.save(flush: true, failOnError: true)
            }
            else{
                userObj = checkUser;
            }


            if (!checkRole) {
                roleObj = new Role();
                roleObj.authority = "ROLE_ADMIN"
                roleObj.save(flush: true);
            }
            else{
                roleObj = checkRole;
            }

            UserRole.create(userObj, roleObj, true)
        }
    }
    def destroy = {
    }
}

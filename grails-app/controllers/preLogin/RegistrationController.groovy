package preLogin

import com.RegistrationCommand
import com.security.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class RegistrationController {


    def customerRegistration(){
        def map = [:]
        println "1"
        println params
        RegistrationCommand cmd = new RegistrationCommand()
        bindData(cmd, params)
        if(cmd.validate()){
            println "validate success"
            User user = new User()
            def userObj = getParams()
            user.firstName = userObj["firstName"]
            user.lastName = userObj["lastName"]
            user.email = userObj["email"]
            user.username = userObj["username"]
            user.password = userObj["password"]
            user.admin = false;
            if(user.save()){
                map = ['Status': 1, 'Message': g.message(code: 'registration.successful.message')]
            }
            else{
                List<User> usr = User.findByUsername(userObj["username"] as String) as List
                map = ['Status': 0, 'Message': g.message(code: 'registration.unsuccessful.message')]
            }
        }
        else{
            println "validate failed"
            map = ['Status': 0, 'Message': g.message(code: 'registration.vadlidation.fail.message')]
        }

        render(map as JSON)
    }
}

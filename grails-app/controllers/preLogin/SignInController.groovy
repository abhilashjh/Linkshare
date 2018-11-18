package preLogin

import com.Topic
import com.ViewTopicService
import com.security.User
import com.security.Role
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

import javax.websocket.Session


@Secured(["permitAll"])
class SignInController {

    def springSecurityService
    def ViewTopicService


    def index() {
        User user = springSecurityService.currentUser as User
        if(user){
            def roles = user.authorities
            Role adminRole  = Role.findByAuthority("ROLE_ADMIN")
            Role userRole  = Role.findByAuthority("ROLE_USER")
            if(roles.contains(adminRole)){
                redirect(controller: 'SignIn', action: 'adminDashboard')
            }
            else if(roles.contains(userRole)) {
                println "before redirect"
                redirect(controller: 'SignIn', action: 'userDashboard')
            }
            else
                redirect controller: 'SignIn', action: 'preLoginPage'
        }
        else
            redirect controller: 'SignIn', action: 'preLoginPage'
    }

    @Secured(["ROLE_ADMIN"])
    def adminDashboard(){
        User user = springSecurityService.currentUser as User
        String firstName =  user.firstName;
        String lastName = user.lastName;
        String fullName = firstName.trim().length()>0? firstName + ' ' + lastName : lastName;
        fullName = fullName.replaceAll("  ", " ")
        session["FullName"] = fullName;
        render(view: '/dashboard/Admin_Home', model:[name: Session["FullName"]])
    }

    @Secured(["ROLE_USER"])
    def userDashboard(){
        User user = springSecurityService.currentUser as User
        String firstName =  user.firstName;
        String lastName = user.lastName;
        String fullName = firstName.trim().length()>0? firstName + ' ' + lastName : lastName;
        fullName = fullName.replaceAll("  ", " ")
        session["FullName"] = fullName;
        session["Username"] = user.username
        render(view: '/dashboard/Home')
    }

    def preLoginPage() {
        List<Topic> recentTopicResult = ViewTopicService.getRecentTopics()
        def topTopicResult = ViewTopicService.getTopTopics(1) as List
        render(view: '/default', model: [recent : recentTopicResult, top: topTopicResult])
    }


}

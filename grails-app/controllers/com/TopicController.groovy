package com

import com.TopicCommand
import com.security.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
//@Secured(["ROLE_ADMIN","ROLE_USER"])
@Secured(["permitAll"])
class TopicController {
    def springSecurityService
    def index() { }

    //@Secured(["ROLE_ADMIN","ROLE_USER"])
    @Secured(["permitAll"])
    def createTopic(){
        def map = [:];
        println params;
//        TopicCommand cmd = new TopicCommand()
//        bindData(cmd, params)
//        if(cmd.validate){
//
//        }
        User user = springSecurityService.currentUser as User;
        def postParams = getParams();
        Topic topic1 = new Topic()

        topic1.visibility = Visibility.PUBLIC;
        topic1.createdBy = user;
        topic1.user = user;
        topic1.name = postParams["topicName"];
        topic1.save(flush: true);

        Subscription subscription = new Subscription()
        subscription.user = user;
        subscription.topic = topic1;
        subscription.seriousness = Seriousness.SERIOUS;
        subscription.save(flush: true);



        println("PostParams " + postParams)
        map = ["Status":"1", "Message":"Successful" ]
        render map as JSON
    }
}

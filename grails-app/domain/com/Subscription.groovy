package com

import com.security.User

class Subscription {
    String ControlId = UUID.randomUUID().toString()
    User user
    Topic topic
    Seriousness seriousness
    Date dateCreated
    Date lastUpdated
    static constraints = {
    }
}

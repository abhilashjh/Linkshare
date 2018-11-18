package com

import grails.validation.Validateable

@Validateable
class RegistrationCommand {

    String username
    String password
    String email
    String firstName
    String lastName
//    byte[] photo
    //boolean admin
    //boolean active = true

    static constraints = {
        username blank: false, unique: true, size: 3..32
        email blank: false, unique: true
        password blank: false
        firstName blank: false
        lastName blank: false
    }
}

package com

import com.security.User
import grails.test.mixin.TestFor
import preLogin.RegistrationController
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(RegistrationController)
class RegistrationControllerSpec extends Specification {

    def setup() {
        new User(username: 'abhilash', password: '123456', email: 'abhilashjha@gmail.com', firstName: 'Abhilash', lastName: 'Jha', admin: Boolean.FALSE).save(flush: true)    }

    def cleanup() {
    }

    void "test something"() {
        expect:
            User.count() == 1
    }
}

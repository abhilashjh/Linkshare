package com

import grails.test.mixin.TestFor
import preLogin.RegistrationController
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(RegistrationController)
class RegistrationControllerSpec extends Specification {

    void "test something"() {

        when:
        String str = "Hello"

        then:
        println str
        assert(str == "Bye")

    }
}

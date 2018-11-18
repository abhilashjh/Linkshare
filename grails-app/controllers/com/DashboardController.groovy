package com

import grails.plugin.springsecurity.annotation.Secured

class DashboardController {

    @Secured(['customer'])
    def LoadUser() { }

    @Secured(['admin'])
    def LoadAdimin() { }
}

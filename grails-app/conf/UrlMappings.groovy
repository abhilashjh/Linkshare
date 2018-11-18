class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "signIn", action: "preLoginPage")
        "/default"(controller: "signIn", action: "preLoginPage")
        "500"(view:'/error')
	}
}

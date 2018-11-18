package com.security

class User {

	transient springSecurityService

	String username
	String password
	String email
	String firstName
	String lastName
	byte[] photo
	boolean admin
	boolean active = true
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true, minSize: 3, maxSize: 32, nullable: false
		password blank: false, nullable: false
		email maxSize: 100, blank: false, nullable: false, unique: true
		firstName maxSize: 50, blank: false, nullable: false
		lastName maxSize: 50, blank: false, nullable: false
		photo nullable: true, blank: true
	}

	static mapping = {
		password column: '`password`'
		photo sqlType: "longblob"
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}

package com

import com.security.User

class Topic {
    String uniqueId = UUID.randomUUID().toString();
    String name;
    User createdBy;
    Date dateCreated;
    Date lastUpdated;
    Visibility visibility;

    static belongsTo = [user: User]
    static constraints = {
        name blank: false, nullable: false, maxSize: 100
    }
}

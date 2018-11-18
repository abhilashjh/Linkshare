package com

/**
 * Created by abhilash on 10/4/17.
 */
enum Visibility {
    PUBLIC("Public"),
    PRIVATE("Private")

    final String value

    Visibility(String value){
        this.value=value
    }

    static List<Visibility> list(){
        [PRIVATE.value, PUBLIC.value]
    }

}

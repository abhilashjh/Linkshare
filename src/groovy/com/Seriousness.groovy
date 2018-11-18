package com

/**
 * Created by abhilash on 10/4/17.
 */
enum Seriousness {
    SERIOUS("Serious"),
    VERYSERIOUS("Very Serious"),
    CASUAL("Casual")

    final String value

    Seriousness(String value){
        this.value = value
    }

    List<Seriousness> list(){
        [SERIOUS,VERYSERIOUS,CASUAL]
    }
}

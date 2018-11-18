package res
import com.security.User
import com.Topic

class Resource {
    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated
    static constraints = {
    }
}

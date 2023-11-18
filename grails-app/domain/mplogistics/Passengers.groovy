package mplogistics

class Passengers {

    int id
    String firstName
    String lastName
    String ssn
    String address
    int age

    static mapping = {
        version false
    }

    static constraints = {
        firstName blank: false, nullable: false, size: 1..45
        lastName blank: false, nullable: false, size: 1..45
        ssn blank: true, nullable: true, size: 1..45
        address blank: true, nullable: true, size: 1..150
    }
}

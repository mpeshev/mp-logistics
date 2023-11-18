package mplogistics

class Clients {

    int id
    String name
    Companies company

    static mapping = {
        version false
    }

    static constraints = {
        name blank: false, nullable: false, size: 1..45
    }

}

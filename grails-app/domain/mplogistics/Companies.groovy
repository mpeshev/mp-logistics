package mplogistics

class Companies {

    int id
    String name

    static mapping = {
        version false
    }

    static constraints = {
        name blank: false, nullable: false, size: 1..45
    }

    String toString() {
        name
    }
}

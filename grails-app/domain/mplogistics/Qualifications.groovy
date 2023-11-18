package mplogistics

class Qualifications {

    int id
    String type

    static mapping = {
        version false
    }

    static constraints = {
        type blank: false, nullable: false, size: 1..45
    }
}

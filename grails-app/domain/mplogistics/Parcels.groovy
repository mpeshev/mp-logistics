package mplogistics

class Parcels {

    int id
    String item
    double weight
    Freights freight

    static mapping = {
        version false
    }

    static constraints = {
        item blank: false, nullable: false, size: 1..45
    }
}

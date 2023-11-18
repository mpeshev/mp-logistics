package mplogistics

class Freights {

    int id
    String fromAddress
    String toAddress
    Date arrivalDate
    Date departureDate
    String cost

    static mapping = {
        version false
    }

    static constraints = {
        fromAddress blank: false, nullable: false, size: 1..150
        toAddress blank: false, nullable: false, size: 1..150
        cost blank: false, nullable: false, size: 1..45
    }
}

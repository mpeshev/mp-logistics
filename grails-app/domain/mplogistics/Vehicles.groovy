package mplogistics

class Vehicles {

    int id
    String model
    String serialNumber
    Companies company

    static mapping = {
        version false
    }

    static constraints = {
        model blank: false, nullable: false, size: 1..45
        serialNumber blank: false, nullable: false, size: 1..45
    }
}

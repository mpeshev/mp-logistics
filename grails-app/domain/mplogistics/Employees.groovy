package mplogistics

class Employees {

    int id
    String name
    Companies company
    JobTitles jobTitles

    static mapping = {
        version false
    }

    static constraints = {
        name blank: false, nullable: false, size: 1..45
    }
}

class Student {
  String _name = "";
  final List<double> _notes = [];

  Student(this._name);
 
  void setName(String name){
    _name = name;
  }

  String getName(){
    return _name;
  }

  List<double> getNotes(){
    return _notes;
  }

  void setNotes(double note){
    _notes.add(note);
  }

  double returnAvg(){
    var avg = _notes.reduce((value, element) => value + element) / _notes.length;
    return avg.isNaN ? 0 : avg;
  }

  bool aproved(double n){
    return returnAvg() >= n;
  }
}
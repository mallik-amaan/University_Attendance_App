class UserData{
  String _name;
  String _email;
  String _uid;

  UserData(this._name, this._email, this._uid);

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
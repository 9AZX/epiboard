import 'package:scoped_model/scoped_model.dart';

class StudentInfoModel extends Model {
  String _login;
  String _title;
  String _internalEmail;
  String _lastname;
  String _firstname;
  Userinfo _userinfo;
  bool _referentUsed;
  String _picture;
  String _scolaryear;
  int _promo;
  int _semester;
  String _location;
  String _documents;
  bool _close;
  String _ctime;
  String _mtime;
  String _idPromo;
  String _idHistory;
  String _courseCode;
  String _semesterCode;
  String _schoolId;
  String _schoolCode;
  String _schoolTitle;
  String _oldIdPromo;
  String _oldIdLocation;
  bool _invited;
  int _studentyear;
  bool _admin;
  bool _editable;
  bool _restrictprofiles;
  List<Groups> _groups;
  int _credits;
  List<Gpa> _gpa;

  StudentInfoModel(
      {String login,
      String title,
      String internalEmail,
      String lastname,
      String firstname,
      Userinfo userinfo,
      bool referentUsed,
      String picture,
      Null pictureFun,
      String scolaryear,
      int promo,
      int semester,
      String location,
      String documents,
      bool close,
      String ctime,
      String mtime,
      String idPromo,
      String idHistory,
      String courseCode,
      String semesterCode,
      String schoolId,
      String schoolCode,
      String schoolTitle,
      String oldIdPromo,
      String oldIdLocation,
      bool invited,
      int studentyear,
      bool admin,
      bool editable,
      bool restrictprofiles,
      List<Groups> groups,
      int credits,
      List<Gpa> gpa}) {
    this._login = login;
    this._title = title;
    this._internalEmail = internalEmail;
    this._lastname = lastname;
    this._firstname = firstname;
    this._userinfo = userinfo;
    this._referentUsed = referentUsed;
    this._picture = picture;
    this._scolaryear = scolaryear;
    this._promo = promo;
    this._semester = semester;
    this._location = location;
    this._documents = documents;
    this._close = close;
    this._ctime = ctime;
    this._mtime = mtime;
    this._idPromo = idPromo;
    this._idHistory = idHistory;
    this._courseCode = courseCode;
    this._semesterCode = semesterCode;
    this._schoolId = schoolId;
    this._schoolCode = schoolCode;
    this._schoolTitle = schoolTitle;
    this._oldIdPromo = oldIdPromo;
    this._oldIdLocation = oldIdLocation;
    this._invited = invited;
    this._studentyear = studentyear;
    this._admin = admin;
    this._editable = editable;
    this._restrictprofiles = restrictprofiles;
    this._groups = groups;
    this._credits = credits;
    this._gpa = gpa;
  }

  String get login => _login;
  set login(String login) => _login;
  String get title => _title;
  set title(String title) => _title;
  String get internalEmail => _internalEmail;
  set internalEmail(String internalEmail) => _internalEmail;
  String get lastname => _lastname;
  set lastname(String lastname) => _lastname = lastname;
  String get firstname => _firstname;
  set firstname(String firstname) => _firstname = firstname;
  Userinfo get userinfo => _userinfo;
  set userinfo(Userinfo userinfo) => _userinfo = userinfo;
  bool get referentUsed => _referentUsed;
  set referentUsed(bool referentUsed) => _referentUsed = referentUsed;
  String get picture => _picture;
  set picture(String picture) => _picture = picture;
  String get scolaryear => _scolaryear;
  set scolaryear(String scolaryear) => _scolaryear = scolaryear;
  int get promo => _promo;
  set promo(int promo) => _promo = promo;
  int get semester => _semester;
  set semester(int semester) => _semester = semester;
  String get location => _location;
  set location(String location) => _location = location;
  String get documents => _documents;
  set documents(String documents) => _documents = documents;
  bool get close => _close;
  set close(bool close) => _close = close;
  String get ctime => _ctime;
  set ctime(String ctime) => _ctime = ctime;
  String get mtime => _mtime;
  set mtime(String mtime) => _mtime = mtime;
  String get idPromo => _idPromo;
  set idPromo(String idPromo) => _idPromo = idPromo;
  String get idHistory => _idHistory;
  set idHistory(String idHistory) => _idHistory = idHistory;
  String get courseCode => _courseCode;
  set courseCode(String courseCode) => _courseCode = courseCode;
  String get semesterCode => _semesterCode;
  set semesterCode(String semesterCode) => _semesterCode = semesterCode;
  String get schoolId => _schoolId;
  set schoolId(String schoolId) => _schoolId = schoolId;
  String get schoolCode => _schoolCode;
  set schoolCode(String schoolCode) => _schoolCode = schoolCode;
  String get schoolTitle => _schoolTitle;
  set schoolTitle(String schoolTitle) => _schoolTitle = schoolTitle;
  String get oldIdPromo => _oldIdPromo;
  set oldIdPromo(String oldIdPromo) => _oldIdPromo = oldIdPromo;
  String get oldIdLocation => _oldIdLocation;
  set oldIdLocation(String oldIdLocation) => _oldIdLocation = oldIdLocation;
  bool get invited => _invited;
  set invited(bool invited) => _invited = invited;
  int get studentyear => _studentyear;
  set studentyear(int studentyear) => _studentyear = studentyear;
  bool get admin => _admin;
  set admin(bool admin) => _admin = admin;
  bool get editable => _editable;
  set editable(bool editable) => _editable;
  bool get restrictprofiles => _restrictprofiles;
  set restrictprofiles(bool restrictprofiles) =>
      _restrictprofiles = restrictprofiles;
  List<Groups> get groups => _groups;
  set groups(List<Groups> groups) => _groups = groups;
  int get credits => _credits;
  set credits(int credits) => _credits = credits;
  List<Gpa> get gpa => _gpa;
  set gpa(List<Gpa> gpa) => _gpa = gpa;

  StudentInfoModel.fromJson(Map<String, dynamic> json) {
    _login = json['login'];
    _title = json['title'];
    _internalEmail = json['internal_email'];
    _lastname = json['lastname'];
    _firstname = json['firstname'];
    _userinfo = json['userinfo'] != null
        ? new Userinfo.fromJson(json['userinfo'])
        : null;
    _referentUsed = json['referent_used'];
    _picture = json['picture'];
    _scolaryear = json['scolaryear'];
    _promo = json['promo'];
    _semester = json['semester'];
    _location = json['location'];
    _documents = json['documents'];
    _close = json['close'];
    _ctime = json['ctime'];
    _mtime = json['mtime'];
    _idPromo = json['id_promo'];
    _idHistory = json['id_history'];
    _courseCode = json['course_code'];
    _semesterCode = json['semester_code'];
    _schoolId = json['school_id'];
    _schoolCode = json['school_code'];
    _schoolTitle = json['school_title'];
    _oldIdPromo = json['old_id_promo'];
    _oldIdLocation = json['old_id_location'];
    _invited = json['invited'];
    _studentyear = json['studentyear'];
    _admin = json['admin'];
    _editable = json['editable'];
    _restrictprofiles = json['restrictprofiles'];
    if (json['groups'] != null) {
      _groups = new List<Groups>();
      json['groups'].forEach((v) {
        _groups.add(new Groups.fromJson(v));
      });
    }
    _credits = json['credits'];
    if (json['gpa'] != null) {
      _gpa = new List<Gpa>();
      json['gpa'].forEach((v) {
        _gpa.add(new Gpa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this._login;
    data['title'] = this._title;
    data['internal_email'] = this._internalEmail;
    data['lastname'] = this._lastname;
    data['firstname'] = this._firstname;
    if (this._userinfo != null) {
      data['userinfo'] = this._userinfo.toJson();
    }
    data['referent_used'] = this._referentUsed;
    data['picture'] = this._picture;
    data['scolaryear'] = this._scolaryear;
    data['promo'] = this._promo;
    data['semester'] = this._semester;
    data['location'] = this._location;
    data['documents'] = this._documents;
    data['close'] = this._close;
    data['ctime'] = this._ctime;
    data['mtime'] = this._mtime;
    data['id_promo'] = this._idPromo;
    data['id_history'] = this._idHistory;
    data['course_code'] = this._courseCode;
    data['semester_code'] = this._semesterCode;
    data['school_id'] = this._schoolId;
    data['school_code'] = this._schoolCode;
    data['school_title'] = this._schoolTitle;
    data['old_id_promo'] = this._oldIdPromo;
    data['old_id_location'] = this._oldIdLocation;
    data['invited'] = this._invited;
    data['studentyear'] = this._studentyear;
    data['admin'] = this._admin;
    data['editable'] = this._editable;
    data['restrictprofiles'] = this._restrictprofiles;
    if (this._groups != null) {
      data['groups'] = this._groups.map((v) => v.toJson()).toList();
    }
    data['credits'] = this._credits;
    if (this._gpa != null) {
      data['gpa'] = this._gpa.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Userinfo {
  Birthplace _birthplace;

  Userinfo({Birthplace birthplace}) {
    this._birthplace = birthplace;
  }

  Birthplace get birthplace => _birthplace;
  set birthplace(Birthplace birthplace) => _birthplace = birthplace;

  Userinfo.fromJson(Map<String, dynamic> json) {
    _birthplace = json['birthplace'] != null
        ? new Birthplace.fromJson(json['birthplace'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._birthplace != null) {
      data['birthplace'] = this._birthplace.toJson();
    }
    return data;
  }
}

class Birthplace {
  String _value;
  bool _adm;
  bool _public;

  Birthplace({String value, bool adm, bool public}) {
    this._value = value;
    this._adm = adm;
    this._public = public;
  }

  String get value => _value;
  set value(String value) => _value = value;
  bool get adm => _adm;
  set adm(bool adm) => _adm = adm;
  bool get public => _public;
  set public(bool public) => _public = public;

  Birthplace.fromJson(Map<String, dynamic> json) {
    _value = json['value'];
    _adm = json['adm'];
    _public = json['public'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this._value;
    data['adm'] = this._adm;
    data['public'] = this._public;
    return data;
  }
}

class Groups {
  String _title;
  String _name;
  int _count;

  Groups({String title, String name, int count}) {
    this._title = title;
    this._name = name;
    this._count = count;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get name => _name;
  set name(String name) => _name = name;
  int get count => _count;
  set count(int count) => _count = count;

  Groups.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _name = json['name'];
    _count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['name'] = this._name;
    data['count'] = this._count;
    return data;
  }
}

class Gpa {
  String _gpa;
  String _cycle;

  Gpa({String gpa, String cycle}) {
    this._gpa = gpa;
    this._cycle = cycle;
  }

  String get gpa => _gpa;
  set gpa(String gpa) => _gpa = gpa;
  String get cycle => _cycle;
  set cycle(String cycle) => _cycle = cycle;

  Gpa.fromJson(Map<String, dynamic> json) {
    _gpa = json['gpa'];
    _cycle = json['cycle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gpa'] = this._gpa;
    data['cycle'] = this._cycle;
    return data;
  }
}

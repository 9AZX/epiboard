import 'package:scoped_model/scoped_model.dart';

class GeneralInfoModel extends Model {
  String _ip;
  Board _board;
  List<History> _history;
  Infos _infos;
  List<Current> _current;

  GeneralInfoModel(
      {String ip,
      Board board,
      List<History> history,
      Infos infos,
      List<Current> current}) {
    this._ip = ip;
    this._board = board;
    this._history = history;
    this._infos = infos;
    this._current = current;
  }

  String get ip => _ip;
  set ip(String ip) => _ip = ip;
  Board get board => _board;
  set board(Board board) => _board = board;
  List<History> get history => _history;
  set history(List<History> history) => _history = history;
  Infos get infos => _infos;
  set infos(Infos infos) => _infos = infos;
  List<Current> get current => _current;
  set current(List<Current> current) => _current = current;

  GeneralInfoModel.fromJson(Map<String, dynamic> json) {
    _ip = json['ip'];
    _board = json['board'] != null ? new Board.fromJson(json['board']) : null;
    if (json['history'] != null) {
      _history = new List<History>();
      json['history'].forEach((v) {
        _history.add(new History.fromJson(v));
      });
    }
    _infos = json['infos'] != null ? new Infos.fromJson(json['infos']) : null;
    if (json['current'] != null) {
      _current = new List<Current>();
      json['current'].forEach((v) {
        _current.add(new Current.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ip'] = this._ip;
    if (this._board != null) {
      data['board'] = this._board.toJson();
    }
    if (this._history != null) {
      data['history'] = this._history.map((v) => v.toJson()).toList();
    }
    if (this._infos != null) {
      data['infos'] = this._infos.toJson();
    }
    if (this._current != null) {
      data['current'] = this._current.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Board {
  List<Projets> _projets;
  List<Null> _notes;
  List<Activites> _activites;
  List<Modules> _modules;

  Board(
      {List<Projets> projets,
      List<Null> notes,
      List<Null> susies,
      List<Activites> activites,
      List<Modules> modules,
      List<Null> stages,
      List<Null> tickets}) {
    this._projets = projets;
    this._notes = notes;
    this._activites = activites;
    this._modules = modules;
  }

  List<Projets> get projets => _projets;
  set projets(List<Projets> projets) => _projets = projets;
  List<Null> get notes => _notes;
  set notes(List<Null> notes) => _notes = notes;
  List<Activites> get activites => _activites;
  set activites(List<Activites> activites) => _activites = activites;
  List<Modules> get modules => _modules;
  set modules(List<Modules> modules) => _modules = modules;

  Board.fromJson(Map<String, dynamic> json) {
    if (json['projets'] != null) {
      _projets = new List<Projets>();
      json['projets'].forEach((v) {
        _projets.add(new Projets.fromJson(v));
      });
    }
    if (json['activites'] != null) {
      _activites = new List<Activites>();
      json['activites'].forEach((v) {
        _activites.add(new Activites.fromJson(v));
      });
    }
    if (json['modules'] != null) {
      _modules = new List<Modules>();
      json['modules'].forEach((v) {
        _modules.add(new Modules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._projets != null) {
      data['projets'] = this._projets.map((v) => v.toJson()).toList();
    }
    if (this._activites != null) {
      data['activites'] = this._activites.map((v) => v.toJson()).toList();
    }
    if (this._modules != null) {
      data['modules'] = this._modules.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projets {
  String _title;
  String _titleLink;
  String _timelineStart;
  String _timelineEnd;
  String _timelineBarre;
  bool _dateInscription;
  String _idActivite;
  bool _soutenanceName;
  bool _soutenanceLink;
  bool _soutenanceDate;
  bool _soutenanceSalle;

  Projets(
      {String title,
      String titleLink,
      String timelineStart,
      String timelineEnd,
      String timelineBarre,
      bool dateInscription,
      String idActivite,
      bool soutenanceName,
      bool soutenanceLink,
      bool soutenanceDate,
      bool soutenanceSalle}) {
    this._title = title;
    this._titleLink = titleLink;
    this._timelineStart = timelineStart;
    this._timelineEnd = timelineEnd;
    this._timelineBarre = timelineBarre;
    this._dateInscription = dateInscription;
    this._idActivite = idActivite;
    this._soutenanceName = soutenanceName;
    this._soutenanceLink = soutenanceLink;
    this._soutenanceDate = soutenanceDate;
    this._soutenanceSalle = soutenanceSalle;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get titleLink => _titleLink;
  set titleLink(String titleLink) => _titleLink = titleLink;
  String get timelineStart => _timelineStart;
  set timelineStart(String timelineStart) => _timelineStart = timelineStart;
  String get timelineEnd => _timelineEnd;
  set timelineEnd(String timelineEnd) => _timelineEnd = timelineEnd;
  String get timelineBarre => _timelineBarre;
  set timelineBarre(String timelineBarre) => _timelineBarre = timelineBarre;
  bool get dateInscription => _dateInscription;
  set dateInscription(bool dateInscription) =>
      _dateInscription = dateInscription;
  String get idActivite => _idActivite;
  set idActivite(String idActivite) => _idActivite = idActivite;
  bool get soutenanceName => _soutenanceName;
  set soutenanceName(bool soutenanceName) => _soutenanceName = soutenanceName;
  bool get soutenanceLink => _soutenanceLink;
  set soutenanceLink(bool soutenanceLink) => _soutenanceLink = soutenanceLink;
  bool get soutenanceDate => _soutenanceDate;
  set soutenanceDate(bool soutenanceDate) => _soutenanceDate = soutenanceDate;
  bool get soutenanceSalle => _soutenanceSalle;
  set soutenanceSalle(bool soutenanceSalle) =>
      _soutenanceSalle = soutenanceSalle;

  Projets.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _titleLink = json['title_link'];
    _timelineStart = json['timeline_start'];
    _timelineEnd = json['timeline_end'];
    _timelineBarre = json['timeline_barre'];
    _dateInscription = json['date_inscription'];
    _idActivite = json['id_activite'];
    _soutenanceName = json['soutenance_name'];
    _soutenanceLink = json['soutenance_link'];
    _soutenanceDate = json['soutenance_date'];
    _soutenanceSalle = json['soutenance_salle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['title_link'] = this._titleLink;
    data['timeline_start'] = this._timelineStart;
    data['timeline_end'] = this._timelineEnd;
    data['timeline_barre'] = this._timelineBarre;
    data['date_inscription'] = this._dateInscription;
    data['id_activite'] = this._idActivite;
    data['soutenance_name'] = this._soutenanceName;
    data['soutenance_link'] = this._soutenanceLink;
    data['soutenance_date'] = this._soutenanceDate;
    data['soutenance_salle'] = this._soutenanceSalle;
    return data;
  }
}

class Activites {
  String _title;
  String _module;
  String _moduleLink;
  String _moduleCode;
  String _titleLink;
  String _timelineStart;
  String _timelineEnd;
  String _timelineBarre;
  var _dateInscription;
  String _salle;
  String _intervenant;
  String _token;
  String _tokenLink;
  String _registerLink;

  Activites(
      {String title,
      String module,
      String moduleLink,
      String moduleCode,
      String titleLink,
      String timelineStart,
      String timelineEnd,
      String timelineBarre,
      String dateInscription,
      String salle,
      String intervenant,
      String token,
      String tokenLink,
      String registerLink}) {
    this._title = title;
    this._module = module;
    this._moduleLink = moduleLink;
    this._moduleCode = moduleCode;
    this._titleLink = titleLink;
    this._timelineStart = timelineStart;
    this._timelineEnd = timelineEnd;
    this._timelineBarre = timelineBarre;
    this._dateInscription = dateInscription;
    this._salle = salle;
    this._intervenant = intervenant;
    this._token = token;
    this._tokenLink = tokenLink;
    this._registerLink = registerLink;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get module => _module;
  set module(String module) => _module = module;
  String get moduleLink => _moduleLink;
  set moduleLink(String moduleLink) => _moduleLink = moduleLink;
  String get moduleCode => _moduleCode;
  set moduleCode(String moduleCode) => _moduleCode = moduleCode;
  String get titleLink => _titleLink;
  set titleLink(String titleLink) => _titleLink = titleLink;
  String get timelineStart => _timelineStart;
  set timelineStart(String timelineStart) => _timelineStart = timelineStart;
  String get timelineEnd => _timelineEnd;
  set timelineEnd(String timelineEnd) => _timelineEnd = timelineEnd;
  String get timelineBarre => _timelineBarre;
  set timelineBarre(String timelineBarre) => _timelineBarre = timelineBarre;
  dynamic get dateInscription => _dateInscription;
  set dateInscription(var dateInscription) =>
      _dateInscription = dateInscription;
  String get salle => _salle;
  set salle(String salle) => _salle = salle;
  String get intervenant => _intervenant;
  set intervenant(String intervenant) => _intervenant = intervenant;
  String get token => _token;
  set token(String token) => _token = token;
  String get tokenLink => _tokenLink;
  set tokenLink(String tokenLink) => _tokenLink = tokenLink;
  String get registerLink => _registerLink;
  set registerLink(String registerLink) => _registerLink = registerLink;

  Activites.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _module = json['module'];
    _moduleLink = json['module_link'];
    _moduleCode = json['module_code'];
    _titleLink = json['title_link'];
    _timelineStart = json['timeline_start'];
    _timelineEnd = json['timeline_end'];
    _timelineBarre = json['timeline_barre'];
    _dateInscription = json['date_inscription'];
    _salle = json['salle'];
    _intervenant = json['intervenant'];
    _token = json['token'];
    _tokenLink = json['token_link'];
    _registerLink = json['register_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['module'] = this._module;
    data['module_link'] = this._moduleLink;
    data['module_code'] = this._moduleCode;
    data['title_link'] = this._titleLink;
    data['timeline_start'] = this._timelineStart;
    data['timeline_end'] = this._timelineEnd;
    data['timeline_barre'] = this._timelineBarre;
    data['date_inscription'] = this._dateInscription;
    data['salle'] = this._salle;
    data['intervenant'] = this._intervenant;
    data['token'] = this._token;
    data['token_link'] = this._tokenLink;
    data['register_link'] = this._registerLink;
    return data;
  }
}

class Modules {
  String _title;
  String _titleLink;
  String _timelineStart;
  String _timelineEnd;
  String _timelineBarre;
  String _dateInscription;

  Modules(
      {String title,
      String titleLink,
      String timelineStart,
      String timelineEnd,
      String timelineBarre,
      String dateInscription}) {
    this._title = title;
    this._titleLink = titleLink;
    this._timelineStart = timelineStart;
    this._timelineEnd = timelineEnd;
    this._timelineBarre = timelineBarre;
    this._dateInscription = dateInscription;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get titleLink => _titleLink;
  set titleLink(String titleLink) => _titleLink = titleLink;
  String get timelineStart => _timelineStart;
  set timelineStart(String timelineStart) => _timelineStart = timelineStart;
  String get timelineEnd => _timelineEnd;
  set timelineEnd(String timelineEnd) => _timelineEnd = timelineEnd;
  String get timelineBarre => _timelineBarre;
  set timelineBarre(String timelineBarre) => _timelineBarre = timelineBarre;
  String get dateInscription => _dateInscription;
  set dateInscription(String dateInscription) =>
      _dateInscription = dateInscription;

  Modules.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _titleLink = json['title_link'];
    _timelineStart = json['timeline_start'];
    _timelineEnd = json['timeline_end'];
    _timelineBarre = json['timeline_barre'];
    _dateInscription = json['date_inscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['title_link'] = this._titleLink;
    data['timeline_start'] = this._timelineStart;
    data['timeline_end'] = this._timelineEnd;
    data['timeline_barre'] = this._timelineBarre;
    data['date_inscription'] = this._dateInscription;
    return data;
  }
}

class History {
  String _title;
  User _user;
  String _content;
  String _date;
  String _id;
  String _visible;
  String _idActivite;
  String _class;

  History(
      {String title,
      User user,
      String content,
      String date,
      String id,
      String visible,
      String idActivite,
      String classe}) {
    this._title = title;
    this._user = user;
    this._content = content;
    this._date = date;
    this._id = id;
    this._visible = visible;
    this._idActivite = idActivite;
    this._class = classe;
  }

  String get title => _title;
  set title(String title) => _title = title;
  User get user => _user;
  set user(User user) => _user = user;
  String get content => _content;
  set content(String content) => _content = content;
  String get date => _date;
  set date(String date) => _date = date;
  String get id => _id;
  set id(String id) => _id = id;
  String get visible => _visible;
  set visible(String visible) => _visible = visible;
  String get idActivite => _idActivite;
  set idActivite(String idActivite) => _idActivite = idActivite;
  String get classe => _class;
  set classe(String classe) => _class = classe;

  History.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _content = json['content'];
    _date = json['date'];
    _id = json['id'];
    _visible = json['visible'];
    _idActivite = json['id_activite'];
    _class = json['class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    if (this._user != null) {
      data['user'] = this._user.toJson();
    }
    data['content'] = this._content;
    data['date'] = this._date;
    data['id'] = this._id;
    data['visible'] = this._visible;
    data['id_activite'] = this._idActivite;
    data['class'] = this._class;
    return data;
  }
}

class User {
  String _picture;
  String _title;
  String _url;

  User({String picture, String title, String url}) {
    this._picture = picture;
    this._title = title;
    this._url = url;
  }

  String get picture => _picture;
  set picture(String picture) => _picture = picture;
  String get title => _title;
  set title(String title) => _title = title;
  String get url => _url;
  set url(String url) => _url = url;

  User.fromJson(Map<String, dynamic> json) {
    _picture = json['picture'];
    _title = json['title'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picture'] = this._picture;
    data['title'] = this._title;
    data['url'] = this._url;
    return data;
  }
}

class Infos {
  String _location;

  Infos({String location}) {
    this._location = location;
  }

  String get location => _location;
  set location(String location) => _location = location;

  Infos.fromJson(Map<String, dynamic> json) {
    _location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this._location;
    return data;
  }
}

class Current {
  String _creditsMin;
  String _creditsNorm;
  String _creditsObj;
  String _nslogMin;
  String _nslogNorm;
  String _credits;
  String _grade;
  String _cycle;
  String _codeModule;
  String _currentCycle;
  String _semesterCode;
  String _semesterNum;
  Null _activeLog;

  Current(
      {String creditsMin,
      String creditsNorm,
      String creditsObj,
      String nslogMin,
      String nslogNorm,
      String credits,
      String grade,
      String cycle,
      String codeModule,
      String currentCycle,
      String semesterCode,
      String semesterNum,
      Null activeLog}) {
    this._creditsMin = creditsMin;
    this._creditsNorm = creditsNorm;
    this._creditsObj = creditsObj;
    this._nslogMin = nslogMin;
    this._nslogNorm = nslogNorm;
    this._credits = credits;
    this._grade = grade;
    this._cycle = cycle;
    this._codeModule = codeModule;
    this._currentCycle = currentCycle;
    this._semesterCode = semesterCode;
    this._semesterNum = semesterNum;
    this._activeLog = activeLog;
  }

  String get creditsMin => _creditsMin;
  set creditsMin(String creditsMin) => _creditsMin = creditsMin;
  String get creditsNorm => _creditsNorm;
  set creditsNorm(String creditsNorm) => _creditsNorm = creditsNorm;
  String get creditsObj => _creditsObj;
  set creditsObj(String creditsObj) => _creditsObj = creditsObj;
  String get nslogMin => _nslogMin;
  set nslogMin(String nslogMin) => _nslogMin = nslogMin;
  String get nslogNorm => _nslogNorm;
  set nslogNorm(String nslogNorm) => _nslogNorm = nslogNorm;
  String get credits => _credits;
  set credits(String credits) => _credits = credits;
  String get grade => _grade;
  set grade(String grade) => _grade = grade;
  String get cycle => _cycle;
  set cycle(String cycle) => _cycle = cycle;
  String get codeModule => _codeModule;
  set codeModule(String codeModule) => _codeModule = codeModule;
  String get currentCycle => _currentCycle;
  set currentCycle(String currentCycle) => _currentCycle = currentCycle;
  String get semesterCode => _semesterCode;
  set semesterCode(String semesterCode) => _semesterCode = semesterCode;
  String get semesterNum => _semesterNum;
  set semesterNum(String semesterNum) => _semesterNum = semesterNum;
  Null get activeLog => _activeLog;
  set activeLog(Null activeLog) => _activeLog = activeLog;

  Current.fromJson(Map<String, dynamic> json) {
    _creditsMin = json['credits_min'];
    _creditsNorm = json['credits_norm'];
    _creditsObj = json['credits_obj'];
    _nslogMin = json['nslog_min'];
    _nslogNorm = json['nslog_norm'];
    _credits = json['credits'];
    _grade = json['grade'];
    _cycle = json['cycle'];
    _codeModule = json['code_module'];
    _currentCycle = json['current_cycle'];
    _semesterCode = json['semester_code'];
    _semesterNum = json['semester_num'];
    _activeLog = json['active_log'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credits_min'] = this._creditsMin;
    data['credits_norm'] = this._creditsNorm;
    data['credits_obj'] = this._creditsObj;
    data['nslog_min'] = this._nslogMin;
    data['nslog_norm'] = this._nslogNorm;
    data['credits'] = this._credits;
    data['grade'] = this._grade;
    data['cycle'] = this._cycle;
    data['code_module'] = this._codeModule;
    data['current_cycle'] = this._currentCycle;
    data['semester_code'] = this._semesterCode;
    data['semester_num'] = this._semesterNum;
    data['active_log'] = this._activeLog;
    return data;
  }
}

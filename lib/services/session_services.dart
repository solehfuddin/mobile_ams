part of 'services.dart';

class SessionServices {
  final _mySession = GetStorage();
  final _splashKey = "issplash";
  bool _isLogin = false;
  final _useridKey = "userid";
  final _technicianidkey = "technicianid";
  final _usernameKey = "username";
  final _passwordKey = "password";
  final _fullnameKey = "fullname";
  final _nikKey = "nik";
  final _phoneKey = "phone";
  final _emailKey = "email";
  final _latKey = "lat";
  final _longKey = "long";
  final _userimgKey = "userimg";
  final _idlestsKey = "idlests";
  final _levelKey = "level";
  final _isactiveKey = "isActive";
  final _fcmTokenKey = "fcmToken";
  final _createatKey = "createdAt";
  final _rememberuserKey = "rememberusername";
  final _rememberpassKey = "rememberpassword";

  void writeSplashSession() {
    _mySession.write(_splashKey, true);
  }

  bool readSplashSession() {
    return _mySession.read(_splashKey) == null ? false : true;
  }

  void writeUserSession(UserModel? user, String? password) {
    _mySession.write(_useridKey, user?.userId);
    _mySession.write(_technicianidkey, user?.technicianId);
    _mySession.write(_usernameKey, user?.username);
    _mySession.write(_passwordKey, password);
    _mySession.write(_fullnameKey, user?.fullname);
    _mySession.write(_nikKey, user?.nik);
    _mySession.write(_phoneKey, user?.phone);
    _mySession.write(_emailKey, user?.email);
    // _mySession.write(_latKey, 0);
    // _mySession.write(_longKey, 0);
    _mySession.write(_userimgKey, user?.userimg);
    _mySession.write(_idlestsKey, user?.idlests);
    _mySession.write(_levelKey, user?.level);
    _mySession.write(_isactiveKey, user?.isActive);
    _mySession.write(_fcmTokenKey, user?.fcmToken);
    _mySession.write(_createatKey, user?.createdAt);
  }

  void writePasswordSession(String? password) {
    _mySession.write(_passwordKey, password);
  }

  void writeEmailSession(String? email) {
    _mySession.write(_emailKey, email);
  }

  void writePhoneSession(String? phone) {
    _mySession.write(_phoneKey, phone);
  }

  void removeUserSession() {
    _mySession.remove(_useridKey);
    _mySession.remove(_technicianidkey);
    _mySession.remove(_usernameKey);
    _mySession.remove(_passwordKey);
    _mySession.remove(_fullnameKey);
    _mySession.remove(_nikKey);
    _mySession.remove(_phoneKey);
    _mySession.remove(_emailKey);
    _mySession.remove(_latKey);
    _mySession.remove(_longKey);
    _mySession.remove(_userimgKey);
    _mySession.remove(_idlestsKey);
    _mySession.remove(_levelKey);
    _mySession.remove(_isactiveKey);
    _mySession.remove(_fcmTokenKey);
    _mySession.remove(_createatKey);

    SystemNavigator.pop();
  }

  UserModel readUserSession() {
    return UserModel(
      _mySession.read(_useridKey),
      _mySession.read(_technicianidkey),
      _mySession.read(_usernameKey),
      _mySession.read(_passwordKey),
      _mySession.read(_fullnameKey),
      _mySession.read(_nikKey),
      _mySession.read(_phoneKey),
      _mySession.read(_emailKey),
      _mySession.read(_latKey),
      _mySession.read(_longKey),
      _mySession.read(_userimgKey),
      _mySession.read(_idlestsKey),
      _mySession.read(_levelKey),
      _mySession.read(_isactiveKey),
      _mySession.read(_fcmTokenKey),
      _mySession.read(_createatKey),
    );
  }

  bool isLoginSession() {
    if (_mySession.read(_usernameKey) != null &&
        _mySession.read(_nikKey) != null) {
      _isLogin = true;
    }
    return _isLogin;
  }

  void writeRemember(RememberModel? remember) {
    _mySession.write(_rememberuserKey, remember?.username);
    _mySession.write(_rememberpassKey, remember?.password);
  }

  RememberModel readRememberSession() {
    return RememberModel(
      _mySession.read(_rememberuserKey),
      _mySession.read(_rememberpassKey),
    );
  }

  void removeRememberSession() {
    _mySession.remove(_rememberuserKey);
    _mySession.remove(_rememberpassKey);
  }

  void writeLocationSession(LocationModels? location) {
    _mySession.write(_latKey, location?.latitude.toString());
    _mySession.write(_longKey, location?.longitude.toString());
  }

  LocationModels readLocationSession() {
    return LocationModels(
      double.parse(
        _mySession.read(_latKey),
      ),
      double.parse(
        _mySession.read(_longKey),
      ),
    );
  }

  void removeLocationSession() {
    _mySession.remove(_latKey);
    _mySession.remove(_longKey);
  }

  void writeImageProfileSession(String? imgurl) {
    _mySession.write(_userimgKey, imgurl);
  }

  String readImageProfileSession() {
    return _mySession.read(_userimgKey);
  }
}

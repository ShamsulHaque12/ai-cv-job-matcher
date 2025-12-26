import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
// final GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: ['email', 'profile', 'openid'],
//   serverClientId: '961923354722-4ouo57bddaim3ah7u0tlqrlu5ti6rulm.apps.googleusercontent.com',
// );
class SharedPreferencesHelper {
  static const _accessTokenKey = "accessToken";
  static const _roleKey = "role";
  static const _userIdKey = "userId";
  static const _companyKey = "companyId";

  /// 🔥 NEW: First Login Popup Flag
  static const _firstLoginKey = "firstLogin";

  /// ----------------- ACCESS TOKEN -----------------
  static Future<void> saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  static Future<void> clearAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
  }

  /// ----------------- ROLE -----------------
  static Future<void> saveRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_roleKey, role);
  }

  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_roleKey);
  }

  static Future<void> clearRole() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_roleKey);
  }

  /// ----------------- USER ID -----------------
  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  static Future<void> clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
  }

  /// ----------------- COMPANY ID -----------------
  static Future<void> saveCompanyId(String companyId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_companyKey, companyId);
  }

  static Future<String?> getCompanyId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_companyKey);
  }

  static Future<void> clearCompanyId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_companyKey);
  }

  /// ----------------- FIRST LOGIN FLAG -----------------
  static Future<void> setFirstLoginFlag() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstLoginKey, true);
  }

  static Future<bool> isFirstLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstLoginKey) ?? false;
  }

  static Future<void> clearFirstLoginFlag() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_firstLoginKey);
  }

  /// ----------------- CLEAR EVERYTHING -----------------
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_roleKey);
    await prefs.remove(_userIdKey);
    await prefs.remove(_companyKey);
    await prefs.remove(_firstLoginKey);
  }

  static Future<void> logout() async {
    // await _googleSignIn.signOut();
    await clearAll();
  }
}

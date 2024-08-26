import 'package:cookie_jar/cookie_jar.dart';
import 'shared_pref_storage.dart';

class SharedPrefCookieStore extends PersistCookieJar {
  SharedPrefCookieStore({
    super.persistSession,
    super.ignoreExpires,
    super.deleteHostCookiesWhenLoadFailed,
  }) : super(
    storage: SharedPrefStorage(),
  );
}
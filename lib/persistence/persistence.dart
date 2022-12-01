import 'package:shared_preferences/shared_preferences.dart';

class Persistence {
  // Singleton
  static Persistence? _persistence;
  static SharedPreferences? _sharedPreferences;

  static bool get _isNull {
    return Persistence._persistence == null;
  }

  static Future<Persistence> getInstance() async {
    if (Persistence._isNull) {
      Persistence._persistence = Persistence();
      Persistence._sharedPreferences = await SharedPreferences.getInstance();
    }
    return Persistence._persistence!;
  }

  // Instance
  Persistence() {
    if (!Persistence._isNull) {
      throw Exception(
          "Para acceder a Persistence usa el método estático \"getInstance\"");
    }
  }

  bool doesExistsKey(String key) {
    return Persistence._sharedPreferences!.containsKey("${key}_value");
  }

  Future<bool> addEntry(String key, dynamic value) async {
    switch (value.runtimeType) {
      case int:
        {
          await Persistence._sharedPreferences!.setInt("${key}_value", value);
          break;
        }
      case double:
        {
          await Persistence._sharedPreferences!
              .setDouble("${key}_value", value);
          break;
        }
      case bool:
        {
          await Persistence._sharedPreferences!.setBool("${key}_value", value);
          break;
        }
      case String:
        {
          await Persistence._sharedPreferences!
              .setString("${key}_value", value);
          break;
        }
      case List<String>:
        {
          await Persistence._sharedPreferences!
              .setStringList("${key}_value", value);
          break;
        }
      default:
        return false;
    }
    await Persistence._sharedPreferences!
        .setString("${key}_type", value.runtimeType.toString());

    return true;
  }

  dynamic getEntry(String key) {
    if (!doesExistsKey(key)) {
      return null;
    }
    String type = Persistence._sharedPreferences!.getString("${key}_type")!;

    dynamic value;
    switch (type) {
      case "bool":
        {
          value = Persistence._sharedPreferences!.getBool("${key}_value");
          break;
        }
      case "String":
        {
          value = Persistence._sharedPreferences!.getString("${key}_value");
          break;
        }
      case "int":
        {
          value = Persistence._sharedPreferences!.getInt("${key}_value");
          break;
        }
      case "double":
        {
          value = Persistence._sharedPreferences!.getDouble("${key}_value");
          break;
        }
      case "List<String>":
        {
          value =
              Persistence._sharedPreferences!.getStringList("${key}_value")!;
          break;
        }
    }

    return value;
  }

  Future<bool> deleteEntry(String key) async {
    return (await Persistence._sharedPreferences!.remove("${key}_type") &&
        await Persistence._sharedPreferences!.remove("${key}_value"));
  }

  List<String> getDataKeys() {
    return Persistence._sharedPreferences!.getKeys().toList();
  }
}

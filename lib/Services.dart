import 'dart:convert';
import 'package:http/http.dart' as http; // add the http plugin in pubspec.yaml file.
import 'classes/Menu.dart';
 
class Services {
  static const ROOT = 'http://192.168.1.16:3000';
  //static const ROOT = 'http://bts-pfe-app.herokuapp.com';
 
  static Future<List<Menu>> getMenus(String type) async {
    try {
      if (type == "favoris") {
        var me = await getMe();
        print(me["favoris"].map<Menu>((json) => Menu.fromJson(json)).toList());
        return me["favoris"].map<Menu>((json) => Menu.fromJson(json)).toList();
      } else {
        final response = await http.get(ROOT + "/menus/" + type, headers: {
          "Autorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZWUzODIwZDY4ZGM5YzMxNDRjYThjNDQiLCJpYXQiOjE1OTE5NjgyNjl9.-tliz0Hyd_fdRcW-m0Kwi1KvKtzRXbRcEZIvrnwz37E"
        });
        print('getMenus Response: ${response.body}');
        if (200 == response.statusCode) {
          List<Menu> list = parseResponse(response.body);
          return list;
        } else {
          return List<Menu>();
        }
      }
      
    } catch (e) {
      print("from catch getMenu");
      print(e.toString());
      return List<Menu>(); // return an empty list on exception/error
    }
  }

  static Future<Map<String, dynamic>> getMe() async {
    try {
      final response = await http.get(ROOT + '/users/me', headers: {
        "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZWUzODg5Y2JkZWVjNzJiYzQwMGJhMWYiLCJpYXQiOjE1OTE5Njk5NDh9.6sUhBOdlXlWvSCQR3ueho7UAi0kVElaBw5AkkIO3PXQ"
      });
      print('getMenus Response: ${response.body}');
      if (200 == response.statusCode) {
        Map x = json.decode(response.body);
        return x;
      } else {
        return null;
      }
    } catch (e) {
      print("from catch getMe");
      print(e.toString());
      return null; // return an empty list on exception/error
    }
  }

  static List<Menu> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    var x;
    try {
      x = parsed.map<Menu>((json) => Menu.fromJson(json)).toList();
      print("parsed!");
    } catch (e) {
      print("from catch parseResponse");
      print(e.toString());
    }
    return x;
  }

  // Method to add Menu to the database...
  static Future<String> addMenu(String libelle, String type, double prix, int stars, String image, int duree) async {
    try {
      var map = Map<String, dynamic>();
      map['libelle'] = libelle;
      map['type'] = type	;
      map['prix'] = prix.toString();
      map['stars'] = stars.toString();
      map['image'] = image;
      map['duree'] = duree.toString();
      print("************1");
      var response;

      try {
        response = await http.post(ROOT + '/menus', body: map);
      } catch (e) {
        print(e.toString());
      }
      
      print("************2");
      print('addMenu Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
 
  // Method to update an Menu in Database...
  static Future<String> updateMenu(int id, String libelle, String type, double prix, int stars, String image, int duree) async {
    try {
      var map = Map<String, dynamic>();

      map['id'] = id.toString();
      map['libelle'] = libelle;
      map['type'] = type	;
      map['prix'] = prix.toString();
      map['stars'] = stars.toString();
      map['image'] = image;
      map['duree'] = duree.toString();
      final response = await http.post(ROOT + '/menus', body: map);
      print('updateMenu Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
 
  // Method to Delete an Menu from Database...
  static Future<String> deleteMenu(int id) async {
    try {
      var map = Map<String, dynamic>();

      map['id'] = id.toString();
      final response = await http.post(ROOT + '/menus', body: map);
      print('deleteMenu Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // returning just an "error" string to keep this simple...
    }
  }

  // Method to create the table Menus.
  static Future<String> createTable() async {
    try {
      // add the parameters to pass to the request.
      var map = Map<String, dynamic>();

      final response = await http.post(ROOT + '/menus', body: map);
      print('Create Table Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
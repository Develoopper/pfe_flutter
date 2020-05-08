import 'dart:convert';
import 'package:http/http.dart' as http; // add the http plugin in pubspec.yaml file.
import 'classes/Menu.dart';
 
class Services {
  //static const ROOT = 'http://192.168.1.12:3000/menus';
  static const ROOT = 'https://bts-pfe-app.herokuapp.com/menus';
 
  static Future<List<Menu>> getMenus() async {
    try {
      final response = await http.get(ROOT);
      print('getMenus Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Menu> list = parseResponse(response.body);
        return list;
      } else {
        return List<Menu>();
      }
    } catch (e) {
      print("from catch getMenu");
      //print(e.toString());
      return List<Menu>(); // return an empty list on exception/error
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
        response = await http.post(ROOT, body: map);
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
      final response = await http.post(ROOT, body: map);
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
      final response = await http.post(ROOT, body: map);
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

      final response = await http.post(ROOT, body: map);
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
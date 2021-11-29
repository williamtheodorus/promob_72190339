import 'dart:convert';
import 'dart:io';
import 'package:promob_72190339/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "http://localhost/kpsi/public/api/progmob/";

  Client client = Client();

  //Dashboard
  //Mahasiswa
  Future<DashboardSI?> getDashboard() async {
    final response = await client.get("$baseUrl/api/progmob/dashboard/72190339");
    if(response.statusCode == 200) {
      return DashboardSI.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<List<Mahasiswa>?> getMahasiswa() async {
    final response = await client.get("$baseUrl/api/progmob/mhs/72190339");
    if(response.statusCode == 200) {
      return mahasiswaFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createMhs(Mahasiswa data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/dosen/createwithfoto",
      headers: {"content-type": "application/json; multipart/fomr-data"},
      body: mahasiswaToJson(data),
    );
    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createMhsWithFoto(Mahasiswa data, File file, String filename) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/progmob/mhs/createwithfoto")
    );

    Map<String,String> headers={
      "Content-type":"multipart/form-data"
    };

    request.headers.addAll(headers);
    request.files.add(
      http.MultipartFile(
        "foto",
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename
      )
    );

    request.fields.addAll({
      "nama": data.nama,
      "nim": data.nim,
      "alamat": data.alamat,
      "email": data.email,
      "nim_progmob": data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateMhsWithFoto(Mahasiswa data, File file, String nimcari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/progmob_72190339/mhs/updatewithfoto")
    );

    Map<String,String> headers={
      "Content-type":"multipart/form-data"
    };

    request.headers.addAll(headers);

    if(file != null){
      request.files.add(
        http.MultipartFile(
          "foto",
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: file.path
        )
      );
      isfotoupdate = "1";
    }

    request.fields.addAll({
      "nama": data.nama,
      "nim": data.nim,
      "alamat": data.alamat,
      "email": data.email,
      "nim_progmob": data.nim_progmob,
      "nimcari": nimcari,
      "is_foto_update":isfotoupdate
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //Dosen
}
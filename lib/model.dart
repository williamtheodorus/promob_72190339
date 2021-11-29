import 'dart:convert';
import 'dart:core';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

//chart
class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
    : this.color = charts.Color(
    r: color.red, g : color.green, b: color.blue, a: color.alpha);
}
//Dashboard
class DashboardSI{
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;

  DashboardSI({required this.mahasiswa, required this.dosen, required this.matakuliah, required this.jadwal});

  factory DashboardSI.fromJson(Map<String, dynamic> json) {
    return DashboardSI(
      mahasiswa: json["mahasiswa"],
      dosen: json["dosen"],
      matakuliah: json["matakuliah"],
      jadwal: json["jadwal"]
    );
  }
}

//Daftar Mahasiswa
class Mahasiswa{
  String id;
  String nama;
  String nim;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  Mahasiswa({required this.id, required this.nama, required this.nim, required this.alamat,
    required this.email, required this.foto, required this.nim_progmob});

  factory Mahasiswa.fromJson(Map<String, dynamic> map) {
    return Mahasiswa(
        id: map["id"],
        nama: map["nama"],
        nim: map["nim"],
        alamat: map["alamat"],
        email: map["email"],
        foto: map["foto"],
        nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson() {
    return  {"id":id, "nama":nama, "nim":nim, "alamat":alamat, "email":email,
            "foto":foto, "nim_progmob":nim_progmob};
  }

  @override
  String toString() {
    return 'Mahasiswa{"id":$id, "nama":$nama, "nim":$nim, "alamat":$alamat, "email":$email,"foto":$foto, "nim_progmob":$nim_progmob}';
  }
}

List<Mahasiswa> mahasiswaFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Mahasiswa>.from(data.map((item) => Mahasiswa.fromJson(item)));
}

String mahasiswaToJson(Mahasiswa data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//Daftar Matakuliah
class Matakuliah{
  String kodeMataKuliah;
  String hari;
  String sesi;
  String dosen;
  String nama;
  int jmlMhs;

  Matakuliah(this.kodeMataKuliah, this.hari, this.sesi, this.dosen, this.jmlMhs, this.nama);

}

//Daftar Dosen
class Dosen{
  int id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  Dosen({required this.id, required this.nama, required this.nidn, required this.alamat,
    required this.email, required this.gelar, required this.foto, required this.nim_progmob});

  factory Dosen.fromJson(Map<String, dynamic> map) {
    return Dosen(
        id: map["id"],
        nama: map["nama"],
        nidn: map["nidn"],
        alamat: map["alamat"],
        email: map["email"],
        gelar: map["gelar"],
        foto: map["foto"],
        nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson() {
    return  {"id":id, "nama":nama, "nidn":nidn, "alamat":alamat, "email":email,
      "gelar":gelar, "foto":foto, "nim_progmob":nim_progmob};
  }

  @override
  String toString() {
    return 'Dosen{"id":$id, "nama":$nama, "nidn":$nidn, "alamat":$alamat, "email":$email, "gelar":$gelar, "foto":$foto, "nim_progmob":$nim_progmob}';
  }
}

List<Dosen> dosenFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}

String dosenToJson(Dosen data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//To do
class ToDo{
  int userId;
  int id;
  String title;
  bool completed;

  ToDo({required this.userId, required this.id, required this.title, required this.completed});

  factory ToDo.fromJson(Map<String, dynamic> map) {
    return ToDo(
        userId: map["userId"],
        id: map["id"],
        title: map["title"],
        completed: map["completed"]
    );
  }

  Map<String, dynamic> toJson() {
    return  {"userId":userId, "id":id, "title":title, "completed":completed};
  }

  @override
  String toString() {
    return 'ToDo{"userId":$userId, "id":$id, "title":$title, "completed":$completed}';
  }
}

List<ToDo> todoFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<ToDo>.from(data.map((item) => ToDo.fromJson(item)));
}

String todoToJson(ToDo data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

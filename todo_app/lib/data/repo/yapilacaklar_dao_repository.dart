import 'package:todo_app/data/entity/yapilacaklar.dart';
import 'package:todo_app/sqlite/veritabani_yardimcisi.dart';

class YapilacaklarDaoRepository{

  Future<void> kaydet(String name) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim(); // veri tabanına erişmemi sağladı

    var yeniYapilacak = Map<String,dynamic>();
    yeniYapilacak["name"] = name;

    await db.insert("toDos", yeniYapilacak);
  }

  Future<void> guncelle(int id ,String name) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var guncellenenGorev = Map<String,dynamic>();
    guncellenenGorev["name"] = name;

    await db.update("toDos", guncellenenGorev,where:"id = ?",whereArgs: [id]); // where argsın parantezi otomatik olarak soru işaretinin yerine geçer
  }

  Future<List<Yapilacaklar>> yapilacaklariYukle() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> satirlar = await db.rawQuery("SELECT * FROM toDos");

    return List.generate(satirlar.length, (index) {
      var satir = satirlar[index];
      var id = satir["id"];
      var name = satir["name"];

      return Yapilacaklar(id: id, name: name);
    });
  }

  Future<List<Yapilacaklar>> ara(String aramaKelimesi) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> satirlar = await db.rawQuery("SELECT * FROM toDos WHERE name like '%$aramaKelimesi%'");

    return List.generate(satirlar.length, (index) {
      var satir = satirlar[index];
      var id = satir["id"];
      var name = satir["name"];

      return Yapilacaklar(id: id, name: name);
    });
  }

  Future<void> sil(int id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    await db.delete("toDos",where: "id = ?",whereArgs: [id]);
  }

}
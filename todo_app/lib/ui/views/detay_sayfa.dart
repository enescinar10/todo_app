import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/yapilacaklar.dart';
import 'package:todo_app/ui/cubit/detay_sayfa_cubit.dart';
class DetaySayfa extends StatefulWidget {
  Yapilacaklar yap;

  DetaySayfa({required this.yap});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfYapilacak = TextEditingController();

  @override
  void initState() {
    super.initState();
    var yap = widget.yap;
    tfYapilacak.text = yap.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yapılacak Detayı"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0 , right: 50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfYapilacak,decoration: const InputDecoration(hintText: "Yapılacak İş :"),),
              ElevatedButton(onPressed: (){
                context.read<DetaySayfaCubit>().guncelle(widget.yap.id, tfYapilacak.text); // id değişmemesi için widget yani en üsteki clasımızdan alıcaz veriyi
              }, child: const Text("Güncelle")),
            ],
          ),
        ),
      ),
    );
  }
}

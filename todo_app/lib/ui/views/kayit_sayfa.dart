import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/ui/cubit/kayit_sayfa_cubit.dart';
class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {

  var tfYapilacak = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yapılacaklar Kayıtları"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0 , right: 50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfYapilacak,decoration: const InputDecoration(hintText: "Yapılacak İş :"),),
              ElevatedButton(onPressed: (){
                context.read<KayitSayfaCubit>().kaydet(tfYapilacak.text);
              }, child: const Text("Kaydet"),),
            ],
          ),
        ),
      ),
    );
  }
}

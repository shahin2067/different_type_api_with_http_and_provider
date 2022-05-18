import 'package:diffrents_api_and_provider/repository/user_repository.dart';
import 'package:diffrents_api_and_provider/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    var vm = Provider.of<UserViewModel>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      await vm.getVersion();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //UserRepository().fetchUserData();
    var vm = Provider.of<UserViewModel>(context, listen: true);
    print(vm.userData);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: vm.userData == null? SizedBox() : ListView.builder(
        itemCount: vm.userData!.length,
          itemBuilder: (context, index){

            return Text(vm.userData![index].name.toString());
          }
      ),
    );
  }
}

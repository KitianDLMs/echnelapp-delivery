import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:echnelapp_delivery/src/pages/client/profile/info/client_profile_info_controller.dart';

class ClientProfileInfoPage extends StatelessWidget {
  ClientProfileInfoController con = Get.put(ClientProfileInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            // POSICIONAR ELEMENTOS UNO ENCIMA DEL OTRO
            children: [
              _backgroundCover(context),
              _boxForm(context),
              _imageUser(context),
              Column(
                children: [_buttonSignOut(), _buttonRoles()],
              ),
            ],
          )),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.amber,
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.3, left: 50, right: 50),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textName(),
            _textEmail(),
            _textPhone(),
            _buttonUpdate(context),
            _buttonDelete(context)
          ],
        ),
      ),
    );
  }

  Widget _buttonSignOut() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(right: 20),
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () => con.signOut(),
        icon: Icon(
          Icons.power_settings_new,
          color: Colors.white,
          size: 30,
        ),
      ),
    ));
  }

  Widget _buttonRoles() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () => con.goToRoles(),
        icon: Icon(
          Icons.supervised_user_circle,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _buttonUpdate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton(
          onPressed: () => con.goToProfileUpdate(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'ACTUALIZAR DATOS',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _buttonDelete(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton(
          onPressed: () => con.showAlertDialog(context),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'ELIMINAR CUENTA',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _imageUser(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        alignment: Alignment.topCenter,
        child: CircleAvatar(
          backgroundImage: con.user.value.image != null
              ? NetworkImage(con.user.value.image!)
              : AssetImage('assets/img/user_profile.png') as ImageProvider,
          radius: 60,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _textName() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(
            '${con.user.value.name ?? ''} ${con.user.value.lastname ?? ''}'),
        subtitle: Text('Nombre del usuario'),
      ),
    );
  }

  Widget _textEmail() {
    return ListTile(
      leading: Icon(Icons.email),
      title: Text(con.user.value.email ?? ''),
      subtitle: Text('Email'),
    );
  }

  Widget _textPhone() {
    return ListTile(
      leading: Icon(Icons.phone),
      title: Text(con.user.value.phone ?? ''),
      subtitle: Text('Telefono'),
    );
  }
}

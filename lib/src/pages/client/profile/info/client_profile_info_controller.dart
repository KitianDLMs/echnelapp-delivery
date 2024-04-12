import 'dart:io';

import 'package:echnelapp_delivery/src/providers/users_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:echnelapp_delivery/src/models/user.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class ClientProfileInfoController extends GetxController {
  var user = User.fromJson(GetStorage().read('user') ?? {}).obs;

  UsersProvider usersProvider = UsersProvider();

  void signOut() {
    GetStorage().remove('address');
    GetStorage().remove('shopping_bag');
    GetStorage().remove('user');

    Get.offNamedUntil(
        '/', (route) => false); // ELIMINAR EL HISTORIAL DE PANTALLAS
  }

  void goToProfileUpdate() {
    Get.toNamed('/client/profile/update');
  }

  void delete(BuildContext context) async {
    showAlertDialog(context);
    await usersProvider.deleteUser(user.value.id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Usuario Eliminado!'),
      duration: Duration(seconds: 6),
    ));
    return;
  }

  void goToRoles() {
    Get.offNamedUntil('/roles', (route) => false);
  }

  void showAlertDialog(BuildContext context) {
    Widget deleteButton = ElevatedButton(
        onPressed: () {
          delete(context);
        },
        child: Text(
          'Eliminar',
          style: TextStyle(color: Colors.black),
        ));
    Widget cancelButton = ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          'Cancelar',
          style: TextStyle(color: Colors.black),
        ));

    AlertDialog alertDialog = AlertDialog(
      title: Text('¿Quieres eliminar tú cuenta?'),
      actions: [deleteButton, cancelButton],
    );

    CupertinoAlertDialog cupertinoAlertDialog = CupertinoAlertDialog(
      title: Text('¿Quieres eliminar tú cuenta?'),
      actions: [deleteButton, cancelButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Platform.isAndroid ? alertDialog : cupertinoAlertDialog;
        });
  }
}

// @dart=3.0
import 'package:echnelapp_delivery/src/pages/client/payments/create-paypal/client_payments_create_page_paypal.dart';
import 'package:echnelapp_delivery/src/pages/restaurant/orders/detail/restaurant_ordes_derail_print.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:echnelapp_delivery/src/utils/firebase_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:echnelapp_delivery/src/pages/client/orders/detail/client_orders_detail_page.dart';
import 'package:echnelapp_delivery/src/pages/client/orders/map/client_orders_map_page.dart';
import 'package:echnelapp_delivery/src/pages/client/payments/status/client_payments_status_page.dart';
import 'package:echnelapp_delivery/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:echnelapp_delivery/src/providers/push_notifications_provider.dart';
import 'package:echnelapp_delivery/src/pages/client/payments/installments/client_payments_installments_page.dart';
import 'package:echnelapp_delivery/src/pages/delivery/orders/map/delivery_orders_map_page.dart';
import 'package:echnelapp_delivery/src/pages/client/profile/update/client_profile_update_page.dart';
import 'package:echnelapp_delivery/src/pages/delivery/home/delivery_home_page.dart';
import 'package:echnelapp_delivery/src/pages/delivery/orders/detail/delivery_orders_detail_page.dart';
import 'package:echnelapp_delivery/src/pages/client/address/create/client_address_create_page.dart';
import 'package:echnelapp_delivery/src/pages/client/address/list/client_address_list_page.dart';
import 'package:echnelapp_delivery/src/pages/client/home/client_home_page.dart';
import 'package:echnelapp_delivery/src/pages/client/orders/create/client_orders_create_page.dart';
import 'package:echnelapp_delivery/src/pages/client/payments/create/client_payments_create_page.dart';
import 'package:echnelapp_delivery/src/pages/restaurant/home/restaurant_home_page.dart';
import 'package:echnelapp_delivery/src/pages/restaurant/orders/detail/restaurant_orders_detail_page.dart';
import 'package:echnelapp_delivery/src/models/user.dart';
import 'package:echnelapp_delivery/src/pages/client/products/list/client_products_list_page.dart';
import 'package:echnelapp_delivery/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:echnelapp_delivery/src/pages/home/home_page.dart';
import 'package:echnelapp_delivery/src/pages/login/login_page.dart';
import 'package:echnelapp_delivery/src/pages/register/register_page.dart';
import 'package:echnelapp_delivery/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:echnelapp_delivery/src/pages/roles/roles_page.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {});
PushNotificationsProvider pushNotificationsProvider =
    PushNotificationsProvider();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: FirebaseConfig.currentPlatform);
  print('Recibiendo notificacion en segundo plano ${message.messageId}');
  pushNotificationsProvider.showNotification(message);
}

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  // Stripe.publishableKey =
  //     'pk_test_51ITEfNCkJDllD3NbjivtFq0whDfmmUiZGcM8nkYoJGn82npmiY6EXMXH5jr1y4Zp83n8FrR69stRkmM4VtPgtcCJ00NTdBIleZ';
  // await Stripe.instance.applySettings();

  await Firebase.initializeApp(
    options: FirebaseConfig.currentPlatform,
  );
  pushNotificationsProvider.initPushNotifications();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('EL TOKEN DE SESION DEL USUARIO: ${userSession.sessionToken}');
    pushNotificationsProvider.onMessageListener();
  }

  @override
  Widget build(BuildContext context) {
    print('Usuario id: ${userSession.id}');

    return GetMaterialApp(
      title: 'Delivery Echnelapp',
      debugShowCheckedModeBanner: false,
      // initialRoute: '/client/payments/create',
      initialRoute: userSession.id != null
          ? userSession.roles!.length > 1
              ? '/roles'
              : '/client/home'
          : '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/roles', page: () => RolesPage()),
        GetPage(name: '/restaurant/home', page: () => RestaurantHomePage()),
        GetPage(
            name: '/restaurant/orders/list',
            page: () => RestaurantOrdersListPage()),
        GetPage(
            name: '/restaurant/orders/detail',
            page: () => RestaurantOrdersDetailPage()),
        GetPage(
            name: '/delivery/orders/list',
            page: () => DeliveryOrdersListPage()),
        GetPage(
            name: '/delivery/orders/detail',
            page: () => DeliveryOrdersDetailPage()),
        GetPage(
            name: '/delivery/orders/map', page: () => DeliveryOrdersMapPage()),
        GetPage(name: '/delivery/home', page: () => DeliveryHomePage()),
        GetPage(name: '/client/home', page: () => ClientHomePage()),
        GetPage(
            name: '/client/products/list',
            page: () => ClientProductsListPage()),
        GetPage(
            name: '/client/profile/info', page: () => ClientProfileInfoPage()),
        GetPage(
            name: '/client/profile/update',
            page: () => ClientProfileUpdatePage()),
        GetPage(
            name: '/client/orders/create',
            page: () => ClientOrdersCreatePage()),
        GetPage(
            name: '/client/orders/detail',
            page: () => ClientOrdersDetailPage()),
        GetPage(name: '/client/orders/map', page: () => ClientOrdersMapPage()),
        GetPage(
            name: '/client/address/create',
            page: () => ClientAddressCreatePage()),
        GetPage(
            name: '/client/address/list', page: () => ClientAddressListPage()),
        GetPage(
            name: '/client/payments/create',
            page: () => ClientPaymentsCreatePage()),
        // GetPage(
        //     name: '/client/payments/create-paypal',
        //     page: () => ClientPaymentsCreatePaypalPage()),
        GetPage(
            name: '/client/payments/installments',
            page: () => ClientPaymentsInstallmentsPage()),
        GetPage(
            name: '/client/payments/status',
            page: () => ClientPaymentsStatusPage()),
        GetPage(
            name: '/restaurant/orders/print',
            page: () => RestaurantOrdersDetailPrintPage()),
      ],
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: ColorScheme(
              primary: Colors.amber,
              secondary: Colors.amberAccent,
              brightness: Brightness.light,
              onBackground: Colors.grey,
              onPrimary: Colors.grey,
              surface: Colors.amber,
              onSurface: Colors.black,
              error: Colors.grey,
              onError: Colors.grey,
              onSecondary: Colors.grey,
              background: Colors.white)),
      navigatorKey: Get.key,
    );
  }
}

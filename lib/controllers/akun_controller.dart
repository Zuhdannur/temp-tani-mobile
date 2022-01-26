import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hitungtani/models/login_response.dart';
import 'package:hitungtani/models/user.dart';
import 'package:hitungtani/pages/home_page.dart';
import 'package:hitungtani/pages/login_page.dart';
import 'package:hitungtani/services/repository.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:hive/hive.dart';

import 'home_controller.dart';

class AkunController extends GetxController{
  User? user;
  late Repository repository;

  late Box<User> userBox;

  User userLogin = User.instance;
  User userRegister = User.instance;

  var isLoading = false.obs;

  AkunController(){
    repository = locator<Repository>();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    userBox = await Hive.openBox("auth");
    user = userBox.get(0, defaultValue: null);
    if(user!=null){
      repository.tokenDio.options.headers['Authorization'] = "Bearer ${user?.token}";
    }
    update();
    super.onInit();
  }

  User? getCurrentUser() {
    return userBox.get(0, defaultValue: null);
  }

  void setCurrentUser(User user) {
    userBox.put(0, user);
    this.user = user;
    update();
  }

  void register() async {
    isLoading.value = true;
    var result = await userRegister.create();
    isLoading.value = false;
    if(result!=null){
      print(result.error);
      if(!(result.error??false)){
        AppHelpers.showSnackBar(
            snackBarMode: SnackBarMode.SUCCESS, content: "Registrasi berhasil, silakan masuk untuk melanjutkan");
      }
    }
  }

  void login() async {
    isLoading.value = true;
    var result = await userLogin.login();
    isLoading.value = false;
    if(result!=null){
      if(!(result.error??false)){
        AppHelpers.showSnackBar(
            snackBarMode: SnackBarMode.SUCCESS, content: "Login berhasil!");
        User akun = result.data.user;
        akun.token = result.data.token;
        this.setCurrentUser(akun);
        repository.tokenDio.options.headers['Authorization'] = "Bearer ${akun.token}";
        Get.offAll(()=>HomePage());
      }
    }
  }

  void logout(){
    HomeController homeController = Get.put(HomeController());
    userBox.delete(0);
    user = null;
    update();
    homeController.pageIdx.value = 0;
    Get.delete<HomeController>();
    userLogin = User.instance;
    userRegister = User.instance;
    repository.tokenDio = Dio();
    Get.offAll(LoginPage());
  }

}
import 'package:get/get.dart';
import 'package:hitungtani/controllers/beranda_controller.dart';
import 'package:hitungtani/models/anggaran.dart';
import 'package:hitungtani/pages/home_page.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:intl/intl.dart';

class TahunAnggaranController extends GetxController{
  var date = DateTime.now().obs;
  var isLoading = false.obs;
  var tahun = Rxn<Anggaran>().obs;

  BerandaController berandaController = Get.put(BerandaController());

  @override
  void onInit() {
    // TODO: implement onInit
    if(Get.arguments!=null){
      fetchTahunAnggaran();
    }else{
      tahun.value.value = Anggaran.instance;
      tahun.value.value?.tahun = DateFormat("yyyy").format(date.value);
    }
    super.onInit();
  }

  void fetchTahunAnggaran() async {
    isLoading.value = true;
    tahun.value.value = await Anggaran.instance.fetchOne(id: Get.arguments);
    date.value = DateTime(int.parse(tahun.value.value?.tahun??"0"));
    isLoading.value = false;
  }

  void createTahunAnggaran() async {
    isLoading.value = true;
    var result = await tahun.value.value?.create(id: berandaController.idKebun.value.value??0);
    isLoading.value = false;
    if(result!=null){
      print(result.error);
      if(!(result.error??false)){
        AppHelpers.showSnackBar(
            snackBarMode: SnackBarMode.SUCCESS, content: "Simpan Tahun Anggaran Berhasil");
        // berandaController.fetchKebun();
        // if(berandaController.kebun.value.value!=null){
        //   berandaController.fetchOneKebun();
        // }
        // Get.offAll(()=>HomePage());
        Get.back();
      }
    }
  }

  void updateTahunAnggaran() async {
    isLoading.value = true;
    var result = await tahun.value.value?.update();
    isLoading.value = false;
    if(result!=null){
      print(result.error);
      if(!(result.error??false)){
        AppHelpers.showSnackBar(
            snackBarMode: SnackBarMode.SUCCESS, content: "Simpan Tahun Anggaran Berhasil");
        // berandaController.fetchKebun();
        // if(berandaController.kebun.value.value!=null){
        //   berandaController.fetchOneKebun();
        // }
        // Get.offAll(()=>HomePage());
        Get.back();
      }
    }
  }
}
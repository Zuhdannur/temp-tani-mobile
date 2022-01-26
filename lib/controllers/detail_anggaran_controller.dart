import 'package:get/get.dart';
import 'package:hitungtani/models/anggaran.dart';
import 'package:hitungtani/models/detail_anggaran.dart';
import 'package:hitungtani/utils/helpers.dart';

class DetailAnggaranController extends GetxController{
  var anggaran = Rxn<Anggaran>().obs;
  var listDetailAnggaran = List<DetailAnggaran>.empty(growable: true).obs;
  var detailAnggaran = Rxn<DetailAnggaran>().obs;

  var isLoading = false.obs;
  var anggaranLoading = false.obs;
  var formLoading = false.obs;

  int? idAnggaran;

  @override
  void onInit() {
    // TODO: implement onInit
    idAnggaran = Get.arguments;
    fetchAnggaran();
    fetchAllDetailAnggaran();
    super.onInit();
  }

  void fetchAnggaran() async {
    anggaranLoading.value = true;
    anggaran.value.value = await Anggaran.instance.fetchOne(id: idAnggaran??0);
    anggaranLoading.value = false;
  }

  void fetchDetailAnggaran({required int id}) async {
    formLoading.value = true;
    detailAnggaran.value.value = null;
    detailAnggaran.value.value = await DetailAnggaran.instance.fetchOne(id: id);
    formLoading.value = false;
  }

  void fetchAllDetailAnggaran() async {
    isLoading.value = true;
    listDetailAnggaran.value = [];
    listDetailAnggaran.value = await DetailAnggaran.instance.fetchAll(id: idAnggaran??0)??[];
    isLoading.value = false;
  }

  void createDetailAnggaran() async {
    formLoading.value = true;
    var result = await detailAnggaran.value.value?.create(id: idAnggaran??0);
    formLoading.value = false;
    if(result!=null){
      print(result.error);
      if(!(result.error??false)){
        AppHelpers.showSnackBar(
            snackBarMode: SnackBarMode.SUCCESS, content: "Simpan Detail Anggaran Berhasil");
        // berandaController.fetchKebun();
        // if(berandaController.kebun.value.value!=null){
        //   berandaController.fetchOneKebun();
        // }
        // Get.offAll(()=>HomePage());
        Get.back();
      }
    }
  }

  void updateDetailAnggaran() async {
    formLoading.value = true;
    var result = await detailAnggaran.value.value?.update();
    formLoading.value = false;
    if(result!=null){
      print(result.error);
      if(!(result.error??false)){
        AppHelpers.showSnackBar(
            snackBarMode: SnackBarMode.SUCCESS, content: "Simpan Detail Anggaran Berhasil");
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
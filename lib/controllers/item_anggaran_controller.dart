import 'package:get/get.dart';
import 'package:hitungtani/models/anggaran.dart';
import 'package:hitungtani/models/detail_anggaran.dart';
import 'package:hitungtani/models/item_anggaran.dart';
import 'package:hitungtani/utils/helpers.dart';

class ItemAnggaranController extends GetxController{
  var detailAnggaran = Rxn<DetailAnggaran>().obs;
  var listItemAnggaran = List<ItemAnggaran>.empty(growable: true).obs;
  var itemAnggaran = Rxn<ItemAnggaran>().obs;

  var isLoading = false.obs;
  var detailAnggaranLoading = false.obs;
  var formLoading = false.obs;

  int? idDetailAnggaran;

  @override
  void onInit() {
    // TODO: implement onInit
    idDetailAnggaran = Get.arguments;
    fetchDetailAnggaran();
    fetchAllItemAnggaran();
    super.onInit();
  }

  void fetchDetailAnggaran() async {
    detailAnggaranLoading.value = true;
    detailAnggaran.value.value = await DetailAnggaran.instance.fetchOne(id: idDetailAnggaran??0);
    detailAnggaranLoading.value = false;
  }

  void fetchItemAnggaran({required int id}) async {
    formLoading.value = true;
    itemAnggaran.value.value = null;
    itemAnggaran.value.value = await ItemAnggaran.instance.fetchOne(id: id);
    formLoading.value = false;
  }

  void fetchAllItemAnggaran() async {
    isLoading.value = true;
    listItemAnggaran.value = [];
    listItemAnggaran.value = await ItemAnggaran.instance.fetchAll(id: idDetailAnggaran??0)??[];
    isLoading.value = false;
  }

  void createItemAnggaran() async {
    formLoading.value = true;
    var result = await itemAnggaran.value.value?.create(id: idDetailAnggaran??0);
    formLoading.value = false;
    if(result!=null){
      print(result.error);
      if(!(result.error??false)){
        AppHelpers.showSnackBar(
            snackBarMode: SnackBarMode.SUCCESS, content: "Simpan Item Anggaran Berhasil");
        // berandaController.fetchKebun();
        // if(berandaController.kebun.value.value!=null){
        //   berandaController.fetchOneKebun();
        // }
        // Get.offAll(()=>HomePage());
        Get.back();
      }
    }
  }

  void updateItemAnggaran() async {
    formLoading.value = true;
    var result = await itemAnggaran.value.value?.update();
    formLoading.value = false;
    if(result!=null){
      print(result.error);
      if(!(result.error??false)){
        AppHelpers.showSnackBar(
            snackBarMode: SnackBarMode.SUCCESS, content: "Simpan Item Anggaran Berhasil");
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
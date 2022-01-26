import 'package:get/get.dart';
import 'package:hitungtani/models/barang.dart';
import 'package:hitungtani/models/item_anggaran.dart';
import 'package:hitungtani/utils/helpers.dart';

class BarangController extends GetxController{
  var itemAnggaran = Rxn<ItemAnggaran>().obs;
  var listBarang = List<Barang>.empty(growable: true).obs;
  var barang = Rxn<Barang>().obs;

  var isLoading = false.obs;
  var itemAnggaranLoading = false.obs;
  var formLoading = false.obs;

  int? idItemAnggaran;

  @override
  void onInit() {
    // TODO: implement onInit
    idItemAnggaran = Get.arguments;
    fetchItemAnggaran();
    fetchAllBarang();
    super.onInit();
  }

  void fetchItemAnggaran() async {
    itemAnggaranLoading.value = true;
    itemAnggaran.value.value = await ItemAnggaran.instance.fetchOne(id: idItemAnggaran??0);
    itemAnggaranLoading.value = false;
  }

  void fetchBarang({required int id}) async {
    formLoading.value = true;
    barang.value.value = null;
    barang.value.value = await Barang.instance.fetchOne(id: id);
    formLoading.value = false;
  }

  void fetchAllBarang() async {
    isLoading.value = true;
    listBarang.value = [];
    listBarang.value = await Barang.instance.fetchAll(id: idItemAnggaran??0)??[];
    isLoading.value = false;
  }

  void createBarang() async {
    formLoading.value = true;
    var result = await barang.value.value?.create(id: idItemAnggaran??0);
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

  void updateBarang() async {
    formLoading.value = true;
    var result = await barang.value.value?.update();
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
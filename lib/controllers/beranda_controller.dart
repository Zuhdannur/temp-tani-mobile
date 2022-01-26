import 'package:get/get.dart';
import 'package:hitungtani/models/anggaran.dart';
import 'package:hitungtani/models/kebun.dart';
import 'package:hitungtani/models/summary.dart';

class BerandaController extends GetxController {
  var kebun = Rxn<Kebun>().obs;
  var listKebun = List<Kebun>.empty(growable: true).obs;
  var listAnggaran = List<Anggaran>.empty(growable: true).obs;
  var summary = Rxn<Summary>().obs;

  var isLoading = false.obs;
  var oneIsLoading = false.obs;

  var idKebun = Rxn<int>().obs;
  var idAnggaran = Rxn<int>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchKebun();
    super.onInit();
  }

  void fetchKebun() async {
    isLoading.value = true;
    listKebun.value = await Kebun.instance.fetchAll()??[];
    isLoading.value = false;
  }

  void fetchOneKebun() async {
    oneIsLoading.value= true;
    kebun.value.value = null;
    kebun.value.value = await Kebun.instance.fetchOne(id: idKebun.value.value??0);
    oneIsLoading.value= false;
  }

  void fetchAnggaran() async {
    isLoading.value = true;
    listAnggaran.value = [];
    listAnggaran.value = await Anggaran.instance.fetchAll(id: idKebun.value.value??0)??[];
    isLoading.value = false;
  }

  void fetchSummary() async {
    isLoading.value = true;
    summary.value.value = null;
    summary.value.value = await Summary.instance.fetch(id: idAnggaran.value.value??0);
    isLoading.value = false;
  }
}
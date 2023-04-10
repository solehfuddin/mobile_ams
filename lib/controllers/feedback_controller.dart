part of 'controllers.dart';

class FeedbackController extends GetxController {
  void sendFeedback(BuildContext context, FeedbackModel feedback) async {
    showDialog(context: context, builder: (context) => const LoaderWidget());

    FormData formData = FormData.fromMap({
      "trouble_no_index": feedback.troubleNoIndex,
      "ups_brand": feedback.upsBrand,
      "model": feedback.model,
      "serial_number": feedback.serialNumber,
      "factory_prod": feedback.factoryProd,
      "ups_capacity": feedback.upsCapacity,
      "ups_cover": feedback.upsCover,
      "input_ups": feedback.inputUps,
      "input_pln": feedback.inputPln,
      "output_ups": feedback.outputUps,
      "load": feedback.load,
      "assesment_date": feedback.assesmentDate,
      "store_head": feedback.storeHead,
      "store": feedback.store,
      "snmp_card": feedback.snmpCard,
      "epo": feedback.epo,
      "condition_batt_1": feedback.conditionBatt1,
      "condition_batt_2": feedback.conditionBatt2,
      "condition_batt_3": feedback.conditionBatt3,
      "condition_batt_4": feedback.conditionBatt4,
      "voltage_batt_1": feedback.voltageBatt1,
      "voltage_batt_2": feedback.voltageBatt2,
      "voltage_batt_3": feedback.voltageBatt3,
      "voltage_batt_4": feedback.voltageBatt4,
      "pln_installation": feedback.plnInstallation,
      "cable_size": feedback.cableSize,
      "std_cable": feedback.stdCable,
      "stabilizer": feedback.stabilizer,
      "mcb": feedback.mcb,
      "stabilizer_capacity": feedback.stabilizerCapacity,
      "mcb_capacity": feedback.mcbCapacity,
      "surge_arrester": feedback.surgeArrester,
      "room_temperature": feedback.roomTemperature,
      "grounding": feedback.grounding,
      "panel_installation": feedback.panelInstallation,
      "comm_ups_batt_1": feedback.commUpsBatt1,
      "comm_ups_batt_2": feedback.commUpsBatt2,
      "comm_ups_batt_3": feedback.commUpsBatt3,
      "comm_ups_batt_4": feedback.commUpsBatt4,
      "saran_perbaikan": feedback.saranPerbaikan,
      "reason": feedback.reason,
      "is_solved": 1,
      "photo": feedback.photo,
      "video": await MultipartFile.fromFile(
        feedback.video!,
      ),
      "video_description": feedback.videoDescription,
      "signature": feedback.signature,
      "user_input": feedback.userInput,
      "created_at": feedback.createdAt,
    });

    ApiServices().apiPostFeedback(formData).then((value) {
      Navigator.pop(context);

      if (value.status ?? false) {
        Navigator.pushNamed(
          context,
          '/success',
          arguments: SuccessModels(
            "Complete Job",
            "Your job successfully saved, thanks \n for your cooperation and keep \n the spirit!",
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => ErrorDialog(value.message ?? ''),
        );
      }
    });
  }
}

part of 'widgets.dart';

// ignore: must_be_immutable
class DialogCompleted extends StatefulWidget {
  String? troubleId = "";
  DialogCompleted({this.troubleId, super.key});

  @override
  State<DialogCompleted> createState() => _DialogCompletedState();
}

class _DialogCompletedState extends State<DialogCompleted> {
  final _feedbackController = Get.put(FeedbackController());
  Utils myUtil = Utils();

  @override
  void initState() {
    super.initState();
    _feedbackController.getData(context, widget.troubleId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: const Center(
                  child: Text(
                    "Completed Ticket",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Branch Detail",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Inter",
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Trouble Id",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Assesment Date",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.troubleId ?? "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    myUtil.convertDate(
                      DateTime.parse(
                        _feedbackController
                                .feedbackData.value.feedback?.assesmentDate ??
                            "2023-01-01",
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Branch Name",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Inter",
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                _feedbackController.feedbackData.value.feedback?.branchName ??
                    "Not yet",
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Inter",
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Branch Address",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Inter",
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                _feedbackController.feedbackData.value.feedback?.address ??
                    "Not yet",
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Inter",
                  fontSize: 13,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Ups Record",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 2,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      _feedbackController
                              .feedbackData.value.feedback?.upsBrand ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Model",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Serial Number",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Factory Prod",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      _feedbackController.feedbackData.value.feedback?.model ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _feedbackController
                              .feedbackData.value.feedback?.serialNumber ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _feedbackController
                              .feedbackData.value.feedback?.factoryProd ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Ups (VA/KVA)",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Ups (Watt)",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Input Ups",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      _feedbackController
                              .feedbackData.value.feedback?.upsCapacity ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _feedbackController
                              .feedbackData.value.feedback?.upsCover ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _feedbackController
                              .feedbackData.value.feedback?.inputUps ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Input PLN",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Output Ups",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Load / Beban",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      _feedbackController
                              .feedbackData.value.feedback?.inputPln ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _feedbackController
                              .feedbackData.value.feedback?.outputUps ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _feedbackController.feedbackData.value.feedback?.load ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Check Detail",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Inter",
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "SNMP Card",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "EPO",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _feedbackController.feedbackData.value.feedback?.snmpCard ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    _feedbackController.feedbackData.value.feedback?.epo ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Kondisi Batt 1",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Tegangan Batt 1",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.conditionBatt1 ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "${_feedbackController.feedbackData.value.feedback?.voltageBatt1 ?? "0"} Vdc",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Kondisi Batt 2",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Tegangan Batt 2",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.conditionBatt2 ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "${_feedbackController.feedbackData.value.feedback?.voltageBatt2 ?? "0"} Vdc",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Kondisi Batt 3",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Tegangan Batt 3",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.conditionBatt3 ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "${_feedbackController.feedbackData.value.feedback?.voltageBatt3 ?? "0"} Vdc",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Kondisi Batt 4",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Tegangan Batt 4",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.conditionBatt4 ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "${_feedbackController.feedbackData.value.feedback?.voltageBatt4 ?? "0"} Vdc",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Standard Kabel",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Ukuran Kabel",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _feedbackController.feedbackData.value.feedback?.stdCable ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.cableSize ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Stabilizer",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Stabilizer Capacity",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.stabilizer ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.stabilizerCapacity ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Mcb",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Mcb Capacity",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _feedbackController.feedbackData.value.feedback?.mcb ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.mcbCapacity ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Surge Arrester",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Suhu Ruangan",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Grounding",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      _feedbackController
                              .feedbackData.value.feedback?.surgeArrester ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _feedbackController
                              .feedbackData.value.feedback?.roomTemperature ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _feedbackController
                              .feedbackData.value.feedback?.grounding ??
                          "Not yet",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Panel Insttallation to UPS",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Inter",
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                _feedbackController
                        .feedbackData.value.feedback?.panelInstallation ??
                    "Not yet",
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Inter",
                  fontSize: 13,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Communication Ups Batt 1",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Communication Ups Batt 2",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.commUpsBatt1 ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.commUpsBatt2 ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Communication Ups Batt 3",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Communication Ups Batt 4",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.commUpsBatt3 ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    _feedbackController
                            .feedbackData.value.feedback?.commUpsBatt4 ??
                        "Not yet",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Saran Perbaikan",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Inter",
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                _feedbackController.feedbackData.value.feedback?.reason ??
                    "Not yet",
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Inter",
                  fontSize: 13,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              _feedbackController.feedbackData.value.feedback?.photo != ""
                  ? const Text(
                      'Gambar Attachment',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    )
                  : const SizedBox(
                      width: 5,
                    ),
              _feedbackController.feedbackData.value.feedback?.photo != ""
                  ? const SizedBox(
                      height: 10,
                    )
                  : const SizedBox(
                      width: 5,
                    ),
              _feedbackController.feedbackData.value.feedback?.photo != null
                  ? Container(
                      height: 210,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: GestureDetector(
                        child: Image.network(
                          _feedbackController
                              .feedbackData.value.feedback!.photo!,
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => ImageWidget(
                              imageUrl: _feedbackController
                                  .feedbackData.value.feedback?.photo,
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox(
                      width: 5,
                    ),
              const SizedBox(
                height: 20,
              ),
              _feedbackController.feedbackData.value.feedback?.video != ""
                  ? const Text(
                      'Video Attachment',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: 14,
                      ),
                    )
                  : const SizedBox(width: 5),
              _feedbackController.feedbackData.value.feedback?.video != ""
                  ? const SizedBox(
                      height: 10,
                    )
                  : const SizedBox(width: 5),
              _feedbackController.feedbackData.value.feedback?.video != null
                  ? Container(
                      height: 210,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: VideoWidget(
                        videoUrl: _feedbackController
                            .feedbackData.value.feedback?.video,
                      ),
                    )
                  : const SizedBox(width: 5),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  _feedbackController
                          .feedbackData.value.feedback?.videoDescription ??
                      "Not yet",
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Inter",
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 100,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Close',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

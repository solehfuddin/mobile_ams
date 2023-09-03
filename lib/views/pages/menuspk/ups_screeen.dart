part of '../pages.dart';

// ignore: must_be_immutable
class UpsScreen extends StatefulWidget {
  TroubleModel? trouble;
  UpsScreen({this.trouble, Key? key}) : super(key: key);

  @override
  State<UpsScreen> createState() => _UpsScreenState();
}

class _UpsScreenState extends State<UpsScreen> {
  final _feedbackController = Get.put(FeedbackController());

  List<bool> expanded = [false, false, false, false, false];
  String upsBrand = 'APC',
      snmpCard = '-- Belum dipilih --',
      epo = '-- Belum dipilih --',
      batt1 = '-- Belum dipilih --',
      batt2 = '-- Belum dipilih --',
      batt3 = '-- Belum dipilih --',
      batt4 = '-- Belum dipilih --',
      standardKabel = '-- Belum dipilih --',
      stabilizer = '-- Belum dipilih --',
      mcb = '-- Belum dipilih --',
      surgeArrester = '-- Belum dipilih --',
      suhu = '-- Belum dipilih --',
      grounding = '-- Belum dipilih --',
      upstobatt1 = '-- Belum dipilih --',
      upstobatt2 = '-- Belum dipilih --',
      upstobatt3 = '-- Belum dipilih --',
      upstobatt4 = '-- Belum dipilih --',
      imageSelect = '',
      imageLocation = '',
      videoLocation = '',
      digitalSign = '',
      digitalTech1Sign = '',
      digitalTech2Sign = '';
  File? videoSelect;
  final format = DateFormat("dd/MM/yyyy");
  final DateTime date = DateTime.now();
  final SignatureController _signController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  final SignatureController _signTech1Controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  final SignatureController _signTech2Controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  final _upsmodelText = TextEditingController();
  final _serialnumberText = TextEditingController();
  final _factoryprodText = TextEditingController();
  final _upsvakvaText = TextEditingController();
  final _upswattText = TextEditingController();
  final _upsinputText = TextEditingController();
  final _plninputText = TextEditingController();
  final _upsOutputText = TextEditingController();
  final _loadText = TextEditingController();
  final _assesmentDateText = TextEditingController();
  final _kepalakantorText = TextEditingController();
  final _kantorText = TextEditingController();
  final _teganganBatt1Text = TextEditingController();
  final _teganganBatt2Text = TextEditingController();
  final _teganganBatt3Text = TextEditingController();
  final _teganganBatt4Text = TextEditingController();
  final _plnToPanelText = TextEditingController();
  final _detailKabelText = TextEditingController();
  final _kapasitasStabilizerText = TextEditingController();
  final _kapasitasMcbText = TextEditingController();
  final _panelToUpsText = TextEditingController();
  final _saranText = TextEditingController();
  final _fotoText = TextEditingController();
  final _videoText = TextEditingController();
  final _videoDescText = TextEditingController();
  final _signatureNameText = TextEditingController();
  final _signNameTech1Text = TextEditingController();
  final _signNameTech2Text = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void choosePicture() async {
    ImagePicker picker = ImagePicker();

    try {
      await picker
          .pickImage(
        // source: ImageSource.gallery,
        source: ImageSource.camera,
        imageQuality: 70,
        preferredCameraDevice: CameraDevice.rear,
      )
          .then(
        (value) {
          setState(() {
            imageSelect = base64Encode(
              Io.File(value!.path).readAsBytesSync(),
            );

            imageLocation = value.path.split('/').last;
            _fotoText.text = imageLocation;
          });
        },
      );
    } catch (e) {
      // print(e);
    }
  }

  void chooseVideo() async {
    ImagePicker picker = ImagePicker();

    try {
      await picker
          .pickVideo(
        // source: ImageSource.gallery,
        source: ImageSource.camera,
        maxDuration: const Duration(
          minutes: 2,
        ),
      )
          .then(
        (value) {
          setState(() {
            videoSelect = Io.File(value!.path);
            _videoText.text = videoSelect!.path.split('/').last;
          });
        },
      );
    } catch (e) {
      // print(e);
    }
  }

  void save() {
    if (imageSelect.isNotEmpty && videoSelect!.path.isNotEmpty) {
      FeedbackModel feed = FeedbackModel(
        troubleNoIndex: widget.trouble!.troubleNo,
        upsBrand: upsBrand,
        model: _upsmodelText.text,
        serialNumber: _serialnumberText.text,
        factoryProd: _factoryprodText.text,
        upsCapacity: _upsvakvaText.text,
        upsCover: _upswattText.text,
        inputUps: _upsinputText.text,
        inputPln: _plninputText.text,
        outputUps: _upsOutputText.text,
        load: _loadText.text,
        assesmentDate: date.convertStringToDb(_assesmentDateText.text),
        storeHead: _kepalakantorText.text,
        store: _kantorText.text,
        snmpCard: snmpCard == "-- Belum dipilih --" ? "" : snmpCard,
        epo: epo == "-- Belum dipilih --" ? "" : epo,
        conditionBatt1: batt1 == "-- Belum dipilih --" ? "" : batt1,
        conditionBatt2: batt2 == "-- Belum dipilih --" ? "" : batt2,
        conditionBatt3: batt3 == "-- Belum dipilih --" ? "" : batt3,
        conditionBatt4: batt4 == "-- Belum dipilih --" ? "" : batt4,
        voltageBatt1: _teganganBatt1Text.text,
        voltageBatt2: _teganganBatt2Text.text,
        voltageBatt3: _teganganBatt3Text.text,
        voltageBatt4: _teganganBatt4Text.text,
        plnInstallation: _plnToPanelText.text,
        cableSize: _detailKabelText.text,
        stdCable: standardKabel == "-- Belum dipilih --" ? "" : standardKabel,
        stabilizer: stabilizer == "-- Belum dipilih --" ? "" : stabilizer,
        mcb: mcb == "-- Belum dipilih --" ? "" : mcb,
        stabilizerCapacity: _kapasitasStabilizerText.text,
        mcbCapacity: _kapasitasMcbText.text,
        surgeArrester:
            surgeArrester == "-- Belum dipilih --" ? "" : surgeArrester,
        roomTemperature: suhu == "-- Belum dipilih --" ? "" : suhu,
        grounding: grounding == "-- Belum dipilih --" ? "" : grounding,
        panelInstallation: _panelToUpsText.text,
        commUpsBatt1: upstobatt1 == "-- Belum dipilih --" ? "" : upstobatt1,
        commUpsBatt2: upstobatt2 == "-- Belum dipilih --" ? "" : upstobatt2,
        commUpsBatt3: upstobatt3 == "-- Belum dipilih --" ? "" : upstobatt3,
        commUpsBatt4: upstobatt4 == "-- Belum dipilih --" ? "" : upstobatt4,
        saranPerbaikan: _saranText.text,
        reason: _videoDescText.text,
        photo: imageSelect,
        video: videoSelect!.path,
        videoDescription: _videoDescText.text,
        signature: digitalSign,
        signatureName: _signatureNameText.text,
        signatureTech1: digitalTech1Sign,
        nameTech1: _signNameTech1Text.text,
        signatureTech2: digitalTech2Sign,
        nameTech2: _signNameTech2Text.text,
        userInput: "System",
      );

      // ignore: use_build_context_synchronously
      _feedbackController.sendFeedback(
        context,
        feed,
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => ErrorDialog(
          "Upload photo and video is required",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.maxFinite,
        height: double.infinity,
        padding: const EdgeInsets.only(
          top: 35,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(Icons.arrow_back, size: 25),
                    onTap: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Ups Record',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      ExpansionPanelList(
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            expanded[panelIndex] = !isExpanded;
                          });
                        },
                        animationDuration: const Duration(
                          seconds: 1,
                        ),
                        children: [
                          ExpansionPanel(
                            headerBuilder: (context, isOpen) {
                              return const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Informasi Umum",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Inter",
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                            body: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 120,
                                        child: Text(
                                          'Ups Brand',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: upsBrand,
                                          items: [
                                            'APC',
                                            'VERTIV',
                                            'EATON',
                                            'SCHNEIDER',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              upsBrand = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 120,
                                        child: Text(
                                          'Model',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _upsmodelText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 120,
                                        child: Text(
                                          'Serial Number',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _serialnumberText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 120,
                                        child: Text(
                                          'Factory Prod',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _factoryprodText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    'UPS Kapasitas (VA/KVA)',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 8,
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    controller: _upsvakvaText,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'UPS Kapasitas Cover (Watt)',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 8,
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    controller: _upswattText,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Input UPS',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Input PLN',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _upsinputText,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _plninputText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Output UPS',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Load / Beban',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _upsOutputText,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _loadText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Assesment Date',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DateTimeField(
                                    format: format,
                                    controller: _assesmentDateText,
                                    onShowPicker: (context, currentValue) {
                                      return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(2010),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2050),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Kepala Kantor',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 8,
                                      ),
                                    ),
                                    keyboardType: TextInputType.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    controller: _kepalakantorText,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Kantor / Store',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 8,
                                      ),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    minLines: 3,
                                    maxLines: 4,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    controller: _kantorText,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: expanded[0],
                          ),
                          ExpansionPanel(
                            headerBuilder: (context, isOpen) {
                              return const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Detail Pengecekan",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Inter",
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                            body: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'SNMP Card',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'EPO',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: snmpCard,
                                          items: [
                                            '-- Belum dipilih --',
                                            'ADA',
                                            'TIDAK ADA',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              snmpCard = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: epo,
                                          items: [
                                            '-- Belum dipilih --',
                                            'ADA',
                                            'TIDAK ADA',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              epo = newValue!;
                                            });
                                          },
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
                                        flex: 1,
                                        child: Text(
                                          'Kondisi Batt 1',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Kondisi Batt 2',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: batt1,
                                          items: [
                                            '-- Belum dipilih --',
                                            'BAIK',
                                            'KURANG BAIK',
                                            'BURUK',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              batt1 = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: batt2,
                                          items: [
                                            '-- Belum dipilih --',
                                            'BAIK',
                                            'KURANG BAIK',
                                            'BURUK',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              batt2 = newValue!;
                                            });
                                          },
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
                                        flex: 1,
                                        child: Text(
                                          'Kondisi Batt 3',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Kondisi Batt 4',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: batt3,
                                          items: [
                                            '-- Belum dipilih --',
                                            'BAIK',
                                            'KURANG BAIK',
                                            'BURUK',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              batt3 = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: batt4,
                                          items: [
                                            '-- Belum dipilih --',
                                            'BAIK',
                                            'KURANG BAIK',
                                            'BURUK',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              batt4 = newValue!;
                                            });
                                          },
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
                                        flex: 1,
                                        child: Text(
                                          'Tegangan Batt 1',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Tegangan Batt 2',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _teganganBatt1Text,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _teganganBatt2Text,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Tegangan Batt 3',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Tegangan Batt 4',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _teganganBatt3Text,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _teganganBatt4Text,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Installasi PLN Ke Panel',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 8,
                                      ),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    minLines: 3,
                                    maxLines: 4,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    controller: _plnToPanelText,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 120,
                                        child: Text(
                                          'Detail Uk. Kabel',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _detailKabelText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 120,
                                        child: Text(
                                          'Standard Kabel',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: standardKabel,
                                          items: [
                                            '-- Belum dipilih --',
                                            'SESUAI',
                                            'TIDAK SESUAI',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              standardKabel = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Stabilizer',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'MCB',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: stabilizer,
                                          items: [
                                            '-- Belum dipilih --',
                                            'ADA',
                                            'TIDAK ADA',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              stabilizer = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: mcb,
                                          items: [
                                            '-- Belum dipilih --',
                                            'TERSEDIA',
                                            'TIDAK TERSEDIA',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              mcb = newValue!;
                                            });
                                          },
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
                                        flex: 1,
                                        child: Text(
                                          'Kapasitas Stabilizer',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Kapasitas MCB',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _kapasitasStabilizerText,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 8,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          controller: _kapasitasMcbText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Surge Arrester',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Kondisi Suhu Ruangan',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: surgeArrester,
                                          items: [
                                            '-- Belum dipilih --',
                                            'ADA',
                                            'TIDAK ADA',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              surgeArrester = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: suhu,
                                          items: [
                                            '-- Belum dipilih --',
                                            'MENDUKUNG',
                                            'TIDAK MENDUKUNG',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              suhu = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 120,
                                        child: Text(
                                          'Grounding',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: grounding,
                                          items: [
                                            '-- Belum dipilih --',
                                            'TERPASANG',
                                            'TERPASANG TIDAK TERAKOMODIR',
                                            'TERPASANG NORMAL',
                                            'TIDAK ADA',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              grounding = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Installasi Panel Ke UPS',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 8,
                                      ),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    minLines: 3,
                                    maxLines: 4,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    controller: _panelToUpsText,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Comm Ups to Batt 1',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Comm Ups to Batt 2',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: upstobatt1,
                                          items: [
                                            '-- Belum dipilih --',
                                            'CHARGING',
                                            'DISCHARGING',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              upstobatt1 = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: upstobatt2,
                                          items: [
                                            '-- Belum dipilih --',
                                            'CHARGING',
                                            'DISCHARGING',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              upstobatt2 = newValue!;
                                            });
                                          },
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
                                        flex: 1,
                                        child: Text(
                                          'Comm Ups to Batt 3',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Comm Ups to Batt 4',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: upstobatt3,
                                          items: [
                                            '-- Belum dipilih --',
                                            'CHARGING',
                                            'DISCHARGING',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              upstobatt3 = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          value: upstobatt4,
                                          items: [
                                            '-- Belum dipilih --',
                                            'CHARGING',
                                            'DISCHARGING',
                                          ].map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'Inter',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              upstobatt4 = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Saran Untuk Perbaikan',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 8,
                                      ),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    minLines: 3,
                                    maxLines: 4,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    controller: _saranText,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: expanded[1],
                          ),
                          ExpansionPanel(
                            headerBuilder: (context, isOpen) {
                              return const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Attachment Tambahan",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Inter",
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                            body: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pilih Foto',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: TextFormField(
                                          enabled: false,
                                          textCapitalization:
                                              TextCapitalization.characters,
                                          decoration: InputDecoration(
                                            hintText: 'Lokasi Foto',
                                            labelText: 'File Foto',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          controller: _fotoText,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Ink(
                                        decoration: const ShapeDecoration(
                                          color: Colors.blue,
                                          shape: CircleBorder(),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.camera_alt_outlined,
                                            color: Colors.white,
                                          ),
                                          iconSize: 27,
                                          onPressed: () {
                                            choosePicture();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Pilih Video',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // videoSelect != null
                                      //     ? SizedBox(
                                      //         width: 100,
                                      //         height: 150,
                                      //         child: VideoWidget(
                                      //           file: videoSelect,
                                      //         ),
                                      //       )
                                      //     :
                                      Flexible(
                                        child: TextFormField(
                                          enabled: false,
                                          textCapitalization:
                                              TextCapitalization.characters,
                                          decoration: InputDecoration(
                                            hintText: 'Video belum dipilih',
                                            labelText: 'File Video',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5,
                                              ),
                                            ),
                                          ),
                                          controller: _videoText,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Ink(
                                        decoration: const ShapeDecoration(
                                          color: Colors.blue,
                                          shape: CircleBorder(),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.videocam_outlined,
                                            color: Colors.white,
                                          ),
                                          iconSize: 27,
                                          onPressed: () {
                                            chooseVideo();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Deskripsi Video',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 8,
                                      ),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    minLines: 3,
                                    maxLines: 4,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    controller: _videoDescText,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: expanded[2],
                          ),
                          ExpansionPanel(
                            headerBuilder: (context, isOpen) {
                              return const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Technician Signature",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Inter",
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                            body: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nama Teknisi 1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 8,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    controller: _signNameTech1Text,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    'Ttd Teknisi 1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Signature(
                                    controller: _signTech1Controller,
                                    height: 150,
                                    backgroundColor: Colors.blueGrey.shade50,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: Colors.orange[800],
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                    ),
                                    child: const Text(
                                      'Bersihkan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    onPressed: () {
                                      _signTech1Controller.clear();
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    'Nama Teknisi 2',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 8,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    controller: _signNameTech2Text,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    'Ttd Teknisi 2',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Signature(
                                    controller: _signTech2Controller,
                                    height: 150,
                                    backgroundColor: Colors.blueGrey.shade50,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: Colors.orange[800],
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                    ),
                                    child: const Text(
                                      'Bersihkan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    onPressed: () {
                                      _signTech2Controller.clear();
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: expanded[3],
                          ),
                          ExpansionPanel(
                            headerBuilder: (context, isOpen) {
                              return const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Digital Signature",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Inter",
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                            body: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nama Penanggung Jawab',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 8,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    controller: _signatureNameText,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: const TextSpan(
                                      text: 'Dengan tanda tangan ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Segoe Ui',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' dibawah ini. ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Segoe Ui',
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black54,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              'Saya menyatakan bahwa data yang diisi sudah benar adanya dan dapat dipertanggung jawabkan sesuai ketentuan yang berlaku.',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Segoe Ui',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Signature(
                                    controller: _signController,
                                    height: 150,
                                    backgroundColor: Colors.blueGrey.shade50,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: Colors.orange[800],
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                    ),
                                    child: const Text(
                                      'Bersihkan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    onPressed: () {
                                      _signController.clear();
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: expanded[4],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_signController.isNotEmpty &&
                                  _signTech1Controller.isNotEmpty) {
                                var ttd = await _signController.toPngBytes();
                                var ttdTech1 =
                                    await _signTech1Controller.toPngBytes();
                                var ttdTech2 =
                                    await _signTech2Controller.toPngBytes();
                                digitalSign = base64Encode(ttd!);
                                digitalTech1Sign = base64Encode(ttdTech1!);

                                if (_signTech2Controller.isNotEmpty) {
                                  digitalTech2Sign = base64Encode(ttdTech2!);
                                }

                                // print(signedImage);

                                // if (imageSelect.isNotEmpty && videoSelect!.path.isNotEmpty)
                                // {
                                save();
                                // }
                                // else
                                // {
                                // showDialog(
                                //   context: context,
                                //   builder: (context) => ErrorDialog(
                                //     "Upload photo and video is required",
                                //   ),
                                // );
                                // }

                                // print(
                                //     "Assesment Date : ${date.convertStringToDb(_assesmentDateText.text)}");
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => ErrorDialog(
                                    "Please sign digital signature or Technician Signature",
                                  ),
                                );
                              }
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
                              'Save Record',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

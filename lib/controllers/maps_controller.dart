part of 'controllers.dart';

class MapsController extends GetxController {
  var nextStep = false.obs;
  var nextScreen = false.obs;
  var showContent = false.obs;

  void updateStatusTrouble(
      BuildContext context, TroubleModel? trouble, String photo) {
    showDialog(context: context, builder: (context) => const LoaderWidget());

    var formData = {
      "trouble_id": trouble?.troubleId,
      "trouble_no": trouble?.troubleNo,
      "title": "Updata ticket",
      "description": "Ticket is process by technician",
      "trouble_categories_code": trouble?.troubleCategoryCode,
      "technician_id": trouble?.technisianId,
      "customer_code": trouble?.customerCode,
      "pic_name": trouble?.picName,
      "lat": trouble?.latt,
      "long": trouble?.long,
      "address": trouble?.address,
      "area_code": trouble?.areaCode,
      "phone_number": trouble?.phoneNumber,
      "requested_time": trouble?.reqTime,
      "rowstate": "S05",
      "pr_photo": photo.isEmpty ? "" : photo,
      "is_solved": trouble?.isSolved,
      "reason": trouble?.reason,
      "user_update": trouble?.userInput,
    };

    // print(formData);

    ApiServices().apiUpdateTrouble(formData).then((value) {
      Navigator.pop(context);

      if (value.status ?? false) {
        photo.isEmpty
            ? nextStep.value = !nextStep.value
            : Navigator.pushNamed(
                context,
                '/success',
                arguments: SuccessModels(
                  "Success Upload",
                  "Successfully uploaded, you can \n create a record now in onsite menu \n on the dashboard",
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

  void takePicture(BuildContext context, TroubleModel? trouble) async {
    // XFile? imageList;
    ImagePicker picker = ImagePicker();

    try {
      await picker
          .pickImage(
            source: ImageSource.camera,
            imageQuality: 70,
            preferredCameraDevice: CameraDevice.rear,
          )
          .then(
            (value) => updateStatusTrouble(
              context,
              trouble,
              base64Encode(
                Io.File(value!.path).readAsBytesSync(),
              ),
            ),
          );
    } catch (e) {
      // print(e);
    }
  }
}

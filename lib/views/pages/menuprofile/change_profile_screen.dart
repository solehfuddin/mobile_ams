part of '../pages.dart';

// ignore: must_be_immutable
class ChangeProfileScreen extends StatefulWidget {
  UserModel? user;
  ChangeProfileScreen({this.user, super.key});

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  final _profileController = Get.put(ProfileController());
  final session = SessionServices();
  final _usernameText = TextEditingController();
  final _phoneText = TextEditingController();
  final _addressText = TextEditingController();
  List<Placemark>? _getAddress;
  String phoneNumber = "";

  @override
  void initState() {
    super.initState();
    widget.user = session.readUserSession();
    _usernameText.text = widget.user?.username ?? "Not set";
    getLocationAddress();
  }

  void getLocationAddress() async {
    LocationModels loc = session.readLocationSession();

    _getAddress = await placemarkFromCoordinates(
      loc.latitude ?? 0,
      loc.longitude ?? 0,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          height: double.infinity,
          padding: const EdgeInsets.only(
            top: 35,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                splashColor1.withOpacity(0),
                splashColor1.withOpacity(0.11),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                          'Edit Profile',
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                      enabled: false,
                      controller: _usernameText,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Phone',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 8,
                        ),
                        errorText: _profileController.isCorrectPhone.isTrue
                            ? null
                            : "Please complete phone",
                      ),
                      initialCountryCode: 'ID',
                      onChanged: (phone) {
                        phoneNumber = phone.completeNumber;
                        _profileController.checkPhone(phoneNumber);
                      },
                      disableLengthCheck: true,
                      controller: _phoneText,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Address',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                          vertical: 8,
                          horizontal: 8,
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      controller: _addressText,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'PinPoint',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: grayLightColor,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/ic_location.png',
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${_getAddress?[0].street} ${_getAddress?[0].subLocality}, ${_getAddress?[0].subAdministrativeArea}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Inter",
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 60,
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _profileController.changeProfile(
                            context,
                            phoneNumber,
                            _addressText.text,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          minimumSize: const Size(320, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Update',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

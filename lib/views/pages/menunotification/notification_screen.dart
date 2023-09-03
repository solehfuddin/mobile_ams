part of '../pages.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _notifController = Get.put(NotificationController());
  Utils myUtil = Utils();

  @override
  void initState() {
    super.initState();
    _notifController.getData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
                      'Notification',
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
                  child: _notifController.isLoading.isTrue
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey[400]!,
                          highlightColor: Colors.grey[300]!,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              height: 100,
                              width: 200,
                            ),
                          ),
                        )
                      : _notifController.notifData.isNotEmpty
                          ? ListView.builder(
                              itemCount: _notifController.notifData.length,
                              itemBuilder: (context, index) {
                                final data = _notifController.notifData[index];
                                bool isSameDate = true;
                                final String dateString = data.createdAt!;
                                final DateTime date =
                                    DateTime.parse(dateString);

                                if (index == 0) {
                                  isSameDate = false;
                                } else {
                                  final String prevDateString = _notifController
                                      .notifData[index - 1].createdAt!;
                                  final DateTime prevDate =
                                      DateTime.parse(prevDateString);
                                  isSameDate = date.isSameDate(prevDate);
                                }
                                if (index == 0 || !(isSameDate)) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        myUtil.convertDate(
                                          DateTime.parse(data.createdAt ??
                                              "'2023-01-01 00:00:00'"),
                                        ),
                                        style: const TextStyle(
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
                                        // height: 60,
                                        constraints: const BoxConstraints(
                                          maxHeight: double.infinity,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Center(
                                          child: RichText(
                                            textAlign: TextAlign.justify,
                                            text: TextSpan(
                                              text:
                                                  "${data.body ?? ''} where location at ",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Inter",
                                                fontSize: 13,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "${data.custName ?? ''} ",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Inter",
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: data.address ?? '',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Inter",
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  Container(
                                    // height: 60,
                                    constraints: const BoxConstraints(
                                      maxHeight: double.infinity,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Center(
                                      child: RichText(
                                        textAlign: TextAlign.justify,
                                        text: TextSpan(
                                          text:
                                              "${data.body ?? ''} where location at ",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Inter",
                                            fontSize: 13,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "${data.custName ?? ''} ",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Inter",
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: data.address ?? '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Inter",
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return null;
                              },
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/notfound.png',
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Data tidak ditemukan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Inter",
                                    fontSize: 17,
                                    color: warningColor,
                                  ),
                                )
                              ],
                            ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

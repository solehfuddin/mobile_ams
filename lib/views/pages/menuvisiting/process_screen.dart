part of '../pages.dart';

class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  final _troubleController = Get.put(TroubleController());
  Utils myUtil = Utils();

  @override
  void initState() {
    super.initState();
    _troubleController.getData(context, "S02");
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
              top: 0,
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
                      'Process',
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
                  child: _troubleController.isLoading.isTrue
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
                      : _troubleController.troubleData.isNotEmpty
                          ? ListView.builder(
                              itemCount: _troubleController.troubleData.length,
                              itemBuilder: (context, index) {
                                final data =
                                    _troubleController.troubleData[index];
                                bool isSameDate = true;
                                final String dateString = data.createdAt!;
                                final DateTime date =
                                    DateTime.parse(dateString);

                                if (index == 0) {
                                  isSameDate = false;
                                } else {
                                  final String prevDateString =
                                      _troubleController
                                          .troubleData[index - 1].createdAt!;
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
                                          // crate dynamic height
                                          constraints: const BoxConstraints(
                                            maxHeight: double.infinity,
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 5,
                                          ),
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
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data.custName ?? '-',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Inter",
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                data.address!,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Inter",
                                                  fontSize: 12,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    data.rowStateName!,
                                                    style: TextStyle(
                                                      color: data.rowStateName! ==
                                                              "COMPLETE"
                                                          ? completeTicketColor
                                                          : processTicketColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Inter",
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  data.rowStateName! ==
                                                          "COMPLETE"
                                                      ? const SizedBox(
                                                          width: 5,
                                                        )
                                                      : SizedBox(
                                                          width: 100,
                                                          height: 30,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator
                                                                  .pushNamed(
                                                                context,
                                                                '/detail_visiting',
                                                                arguments: data,
                                                              );
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  mainColor,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  30,
                                                                ),
                                                              ),
                                                            ),
                                                            child: const Text(
                                                              'Start Job',
                                                            ),
                                                          ),
                                                        ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ]);
                                } else {
                                  return Container(
                                    // crate dynamic height
                                    constraints: const BoxConstraints(
                                      maxHeight: double.infinity,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
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
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.custName ?? '-',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          data.address!,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Inter",
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data.rowStateName!,
                                              style: TextStyle(
                                                color: data.rowStateName! ==
                                                        "COMPLETE"
                                                    ? completeTicketColor
                                                    : processTicketColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Inter",
                                                fontSize: 14,
                                              ),
                                            ),
                                            data.rowStateName! == "COMPLETE"
                                                ? const SizedBox(
                                                    width: 5,
                                                  )
                                                : SizedBox(
                                                    width: 100,
                                                    height: 30,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          '/detail_visiting',
                                                          arguments: data,
                                                        );
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            mainColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            30,
                                                          ),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        'Start Job',
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

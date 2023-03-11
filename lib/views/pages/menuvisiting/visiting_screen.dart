part of '../pages.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [
              const Center(
                child: Text(
                  'Visit List',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                '12 November 2022',
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
                // crate dynamic height
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mcd Buaran',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Jl Bulevar Artha Gading Kav D-01, RT.018/RW.08, Klp. Gading',
                      style: TextStyle(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Process',
                          style: TextStyle(
                            color: processTicketColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
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
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                '10 November 2022',
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
                // crate dynamic height
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mcd Buaran',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Jl Bulevar Artha Gading Kav D-01, RT.018/RW.08, Klp. Gading',
                      style: TextStyle(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Completed',
                          style: TextStyle(
                            color: completeTicketColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

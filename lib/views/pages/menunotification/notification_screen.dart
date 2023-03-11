part of '../pages.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
              const SizedBox(
                height: 25,
              ),
              const Text(
                '24 Oktober 2022',
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
                  horizontal: 15,
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
                    text: const TextSpan(
                      text: 'New job on ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'MCD Artha Gading',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text:
                              ', Jl Bulevar Artha Gading Kav D-01, RT.018/RW.08, Klp. Gading',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
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
                    text: const TextSpan(
                      text: 'New job on ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'MCD Buaran',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text:
                              ', Jl Raden inten II, Duren Sawit, Kec. Duren Sawit, Kota Jakarta Timur',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                '20 Oktober 2022',
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
                  horizontal: 15,
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
                    text: const TextSpan(
                      text: 'New job on ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'MCD Artha Gading',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text:
                              ', Jl Bulevar Artha Gading Kav D-01, RT.018/RW.08, Klp. Gading',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                '2 Oktober 2022',
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
                  horizontal: 15,
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
                    text: const TextSpan(
                      text: 'New job on ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'MCD Buaran',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text:
                              ', Jl Raden inten II, Duren Sawit, Kec. Duren Sawit, Kota Jakarta Timur',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
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

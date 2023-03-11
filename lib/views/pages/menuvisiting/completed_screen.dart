part of '../pages.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
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
                    'Complete',
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

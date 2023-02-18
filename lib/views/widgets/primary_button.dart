part of 'widgets.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: mainColor,
        minimumSize: const Size(320, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      ),
      child: const Text(
        'TEST',
      ),
    );
  }
}

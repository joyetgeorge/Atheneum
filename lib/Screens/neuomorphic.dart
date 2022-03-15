import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class neuomorphic extends StatelessWidget {
  const neuomorphic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            offset: Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: Offset(6.0, 6.0),
            blurRadius: 16.0,
          ),
        ],
        color: Color(0xFF292D32),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}

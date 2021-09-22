
import 'package:flutter/material.dart';
import 'package:login_register/Screens/profilScreen/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
final ValueChanged<String> onChanged;
const RoundedPasswordField({
Key key,
this.onChanged,
}) : super(key: key);

@override
Widget build(BuildContext context) {
return TextFieldContainer(
child: TextField(
obscureText: true,
onChanged: onChanged,
cursorColor: Colors.blue,
decoration: InputDecoration(
hintText: "Password",
icon: Icon(
Icons.lock,
color: Colors.blue,
),
suffixIcon: Icon(
Icons.visibility,
color: Colors.black45,
),
border: InputBorder.none,
),
),
);
}
}
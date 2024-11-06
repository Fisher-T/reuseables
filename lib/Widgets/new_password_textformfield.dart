import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewPasswordTextFormField extends StatefulWidget {
  const NewPasswordTextFormField({super.key});

  @override
  State<NewPasswordTextFormField> createState() => _NewPasswordTextFormFieldState();
}

class _NewPasswordTextFormFieldState extends State<NewPasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    return  //-------------------------------------------------------
 // Password
 //-------------------------------------------------------
 Padding(
   padding: const EdgeInsets.symmetric(
     vertical: 5,
     horizontal: 20,
   ),
   child: TextFormField(
     textInputAction: TextInputAction.next,
     keyboardType: TextInputType.text,
     controller: _passwordTextController,
     focusNode: _passwordFocusNode,
     inputFormatters: [
       FilteringTextInputFormatter.deny(' ')
     ],
     onFieldSubmitted: (v) {
       FocusScope.of(context)
           .requestFocus(_confirmPasswordFocusNode);
     },
     validator: (input) {
       var ctr = 0;
       var msg = 'Password Missing a ';
       if (input!.isEmpty) {
         return 'Please Enter a Password';
       }
       if (input.length < 8) {
         return 'Password have a length of at least 8';
       }
       if (!validLowercase.hasMatch(input.toString()) &&
           !validUppercase.hasMatch(input.toString())) {
         msg += 'Lower and Uppercase Letter';
         ctr++;
       } else {
         if (!validLowercase.hasMatch(input.toString())) {
           msg += 'Lowercase Letter';
           ctr++;
         }
         if (!validUppercase.hasMatch(input.toString())) {
           if (ctr > 0) {
             msg += ', ';
           }
           msg += 'Uppercase Letter';
           ctr++;
         }
       }
       if (!validNumber.hasMatch(input.toString())) {
         if (ctr > 0) {
           msg += ', ';
         }
         msg += 'Number';
         ctr++;
       }
       if (!validSymbol.hasMatch(input.toString())) {
         if (ctr > 0) {
           msg += ', ';
         }
         msg += 'Symbol';
         ctr++;
       }
       if (ctr > 0) {
         return msg;
       } else {
         return null;
       }
     },
     onChanged: (input) {
       setState(() => appUser?.password = input);
     },
     onSaved: (input) => appUser?.password = input,
     obscureText: _hidePassword,
     decoration: InputDecoration(
       labelText: 'Password',
       hintText: '••••••••••••',
       prefixIcon: const Icon(Icons.lock_outline_rounded),
       suffixIcon: Material(
         color: Colors.transparent,
         child: IconButton(
           splashRadius: 20.0,
           onPressed: () {
             setState(() {
               _hidePassword = !_hidePassword;
             });
           },
           color: Theme.of(context)
               .colorScheme
               .primary
               .withAlpha(80),
           icon: Icon(
             _hidePassword
                 ? Icons.visibility_off
                 : Icons.visibility,
           ),
         ),
       ),
     ),
   ),
 ),
  }
}
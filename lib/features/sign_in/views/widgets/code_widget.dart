import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CodeWidget extends StatelessWidget{
  const CodeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 68,
                width: 64,
                child: TextField(
                  onChanged: (value){
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ]
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 68,
                width: 64,
                child: TextField(
                    onChanged: (value){
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ]
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 68,
                width: 64,
                child: TextField(
                    onChanged: (value){
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ]
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 68,
                width: 64,
                child: TextField(
                    onChanged: (value){
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ]
                ),
              ),
              SizedBox(height: 30,),
            ]
        )
    );
  }
}
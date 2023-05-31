import 'package:flutter/material.dart';
import 'package:mobilprogramlamauyg/pages/anasayfa.dart';
import 'package:mobilprogramlamauyg/pages/singinPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            // ARKAPLAN RENGİ VE LOGO
            color: const Color(0xFFFFE082),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('images/cuzdan.jpg',
                          fit: BoxFit.contain, width: 100, height: 250),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.9, // Ekran genişliği
                  height: MediaQuery.of(context).size.height *
                      0.5, // Ekran yüksekliği

                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFFE082),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: SizedBox(
                              width: 120,
                              height: 30,
                              child: Center(
                                child: Text(
                                  "Giriş Yap",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SigninPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary:Color(0xFFFFE082),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: SizedBox(
                              width: 120,
                              height: 30,
                              child: Center(
                                child: Text(
                                  "Kayıt Ol",
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 40),

                      // GİRİŞ YAP
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "E-posta",
                            labelStyle: TextStyle(fontSize: 18.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),

                      // ŞİFRE
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: "Şifre",
                            labelStyle: TextStyle(fontSize: 18.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            // ŞİFREYİ GİZLEYİP AÇMA
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                      ),
                      //ŞİFREMİ UNUTTUM BÖLÜMÜ
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 28, 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SigninPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Şifremi Unuttum",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFFFE082),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      //GİRİŞ YAP BUTONU VE YÖNLENDİRMESİ
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => anasayfa(),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFFFE082),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Giriş Yap",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
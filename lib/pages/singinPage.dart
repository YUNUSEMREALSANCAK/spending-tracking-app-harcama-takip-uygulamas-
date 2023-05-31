import 'loginpage.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // ARKAPLAN RENGİ VE LOGO
          Container(
            color: const Color(0xFFFFE082),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('images/cuzdan.jpg',
                          fit: BoxFit.contain, width: 100, height: 250)
                    ],
                  ),
                ),
                // LOGO İLE BEYAZ KUTUCUK ARASI
                SizedBox(height: 30),
                // İÇERİDEKİ GİRİŞ YAPMA KUTUCUĞU
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.9, // responsive Ekran genişliği
                  height: MediaQuery.of(context).size.height *
                      0.5, // responsive Ekran yüksekliği

                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      // GİRİŞ YAP VE KAYIT OL
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
                                  "Giriş Yap",
                                  style: TextStyle(
                                    color: Color(0xFF000000),
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
                                  "Kayıt Ol",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),
                      //  VERİ GİRİLEN KISIM
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "E-posta",
                            labelStyle: TextStyle(fontSize: 18.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Şifre",
                            labelStyle: TextStyle(fontSize: 18.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Tekrar Şifre",
                            labelStyle: TextStyle(fontSize: 18.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SigninPage(),
                            ),
                          );
                        },
                        // KAYIT OL BUTONU
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
                              "Kayıt Ol",
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
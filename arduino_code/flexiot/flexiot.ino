#define BLYNK_PRINT Serial
#define BLYNK_TEMPLATE_ID "TMPL3apmeeHsY"
#define BLYNK_TEMPLATE_NAME "LingoBytesFinal"
#define BLYNK_TEMPLATE_NAME "LingoBytesFinal"
#define BLYNK_AUTH_TOKEN "fr9QZvP8gxwYKIc7AcU7cHoAgcKBnUxK"

#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>

char ssid[] = "Guest";
char pass[] = "477177";

int flexVal;
BlynkTimer timer;

void myTimer(){
  Blynk.virtualWrite(V0, flexVal);
}

void setup() {
Serial.begin(9600);
Blynk.begin(fr9QZvP8gxwYKIc7AcU7cHoAgcKBnUxK, Guest, 477177);
timer.setInterval(1000L, myTimer);
}

void loop() {
flexVal = analogRead(A0);
Blynk.run();
timer.run();
}

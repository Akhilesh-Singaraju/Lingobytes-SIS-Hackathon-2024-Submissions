#define BLYNK_PRINT Serial
#define BLYNK_TEMPLATE_ID "TMPL3apmeeHsY" 
#define BLYNK_TEMPLATE_NAME "LingoBytesFinal" 
#define BLYNK_AUTH_TOKEN "fr9QZvP8gxwYKIc7AcU7cHoAgcKBnUxK" 

#include <ESP8266WiFi.h> 
#include <BlynkSimpleEsp8266.h> 

char ssid[] = "YourWiFiSSID"; 
char pass[] = "YourWiFiPassword"; 

int flexPin = A0; 
int flexVal; 

BlynkTimer timer; 

void myTimer() {
  flexVal = analogRead(flexPin); 
  Blynk.virtualWrite(V1, flexVal); 
}

void setup() {
  Serial.begin(9600);  
  Blynk.begin(fr9QZvP8gxwYKIc7AcU7cHoAgcKBnUxK, ssid, pass); 
  timer.setInterval(1000L, myTimer); 
}

void loop() {
  Blynk.run(); 
  timer.run(); 
}

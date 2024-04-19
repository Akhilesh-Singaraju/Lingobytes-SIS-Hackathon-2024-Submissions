#define BLYNK_PRINT Serial
#define BLYNK_AUTH_TOKEN "fTo26_BwRrJOiIhDeroObUdNwPUG7b3L" 
#define BLYNK_TEMPLATE_ID "TMPL3swmcaHA_"
#define BLYNK_TEMPLATE_NAME "LingoBytes"

#include <ESP8266WiFi.h> 
#include <BlynkSimpleEsp8266.h> 

char ssid[] = "Shaurya Raju's iPhone"; 
char pass[] = "imnotoklol"; 

int flexPin = A0; 
int flexVal; 

BlynkTimer timer; 

void myTimer() {
  Blynk.virtualWrite(A0, flexVal); 
}

void setup() {
  Serial.begin(9600);  
  Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass); 
  timer.setInterval(1000L, myTimer); 
}

void loop() {
  flexVal = analogRead(flexPin); 
  Blynk.run(); 
  timer.run(); 
  Serial.println(flexVal);
  delay(100);
}

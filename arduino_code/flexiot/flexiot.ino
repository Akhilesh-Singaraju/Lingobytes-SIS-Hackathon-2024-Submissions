#define BLYNK_PRINT Serial
#define BLYNK_TEMPLATE_ID "TMPL37vyzgzWK"
#define BLYNK_TEMPLATE_NAME "Quickstart Template"
#define BLYNK_AUTH_TOKEN "iq8-LS-2TMA9zrDZ7pf7dNjpaWndMYo-"

#include <ESP8266WiFi.h> 
#include <BlynkSimpleEsp8266.h> 

const int flexPin = A0;

char ssid[] = "Posiedon"; 
char pass[] = "198228.civ"; 

void setup()
{
  Serial.begin(115200);

  Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass);
}

void loop()
{
  Blynk.run();
  int flexValue = analogRead(flexPin);
  Blynk.virtualWrite(V0, flexValue);
  delay(1000);
}

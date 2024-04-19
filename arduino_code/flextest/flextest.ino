int flexPin = A0;
int flexVal;

void setup() {
Serial.begin(9600);
}

void loop() {
flexVal = analogRead(flexPin);
Serial.println(flexVal);
delay(100);
}

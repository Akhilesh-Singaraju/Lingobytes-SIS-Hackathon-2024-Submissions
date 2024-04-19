int flexPin1 = A0;
int flexPin2 = A1;
int flexVal1;
int flexVal2;

void setup() {
Serial.begin(9600);
}

void loop() {
flexVal1 = analogRead(flexPin1);
flexVal2 = analogRead(flexPin2)
Serial.println(flexVal1, flexVal2);
delay(100);
}

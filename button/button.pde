// Code for the big red button
//
// When sending a signal to the button to tell it to be on or off,
// the byte 'N' means oN and byte 'F' means ofF. On and off correspond
// to HIGH and LOW on pin 13 which is the LED in the button.

#define led 13
#define button 2

int led_state = LOW;

void setup() {
  pinMode(led, OUTPUT);
  pinMode(button, INPUT);
  digitalWrite(led, led_state);
  Serial.begin(9600);
}

void loop() {
  
  int button_state = digitalRead(button);
  
  if (button_state == HIGH) {
    delay(100);
    Serial.print('P');
  }
  
  // if the speaker has sent a byte back
  if (Serial.available()) {
    byte state = Serial.read();
    if (state == 'N') {
      led_state = HIGH;
    } else if (state == 'F') {
      led_state = LOW;
    }
      
    // update the state of the LED
    digitalWrite(13, led_state);
  }
}


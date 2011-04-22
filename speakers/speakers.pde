// Code for the speaker controller

// All the buttons do is send the byte 'P' to mean that the button has been pressed
// This module decides how to respond to that P by either turning the relay on or off

#define relay 2
#define led 13

int speaker_state = LOW;

void setup() {
  pinMode(relay, OUTPUT);
  pinMode(led, OUTPUT);
  digitalWrite(relay, speaker_state);
  digitalWrite(led, speaker_state);
  Serial.begin(9600);
}

void loop() {
  
  if (Serial.available()) {
    
    byte signal = Serial.read();
    
    if (signal == 'P') {
      if (speaker_state == LOW) {
        speaker_state = HIGH;
        Serial.print('N');
      } else {
        speaker_state = LOW;
        Serial.print('F');
      }
    }
    
    digitalWrite(relay, speaker_state);
    digitalWrite(led, speaker_state);
    
    delay(100);
  }
  
}

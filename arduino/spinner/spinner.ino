#include <Stepper.h>

#define STEPS 200

Stepper stepper(STEPS, 4, 5, 6, 7);
int program = 0; 

void setup()
{
  Serial.begin(9600);
  // setSpeed(x), x given in RPMs
  stepper.setSpeed(60);
}

void loop()
{
  // Quick and dirty control for four different programs
  if (Serial.available() > 0) {
    program = Serial.read();
    program -= 48;
    Serial.print("Now running program ");
    Serial.println(program);
  }
  switch (program) {
    case 0: // stop aka do nothing
      break;
    case 1: // Program 1 - Rotate
      stepper.step(STEPS);
      break;
    case 2: // Program 2 - Wiggle
      stepper.step(STEPS/8);
      stepper.step(-STEPS/8);
    case 3: // Program 3 - Wiggle
      stepper.step(STEPS/16);
      stepper.step(-STEPS/16);
    case 4: // Program 4 - Wiggle
      stepper.step(STEPS/4);
      stepper.step(-STEPS/4);
    default: // do nothing
      break;
  }
//  stepper.step(-STEPS/8);
}

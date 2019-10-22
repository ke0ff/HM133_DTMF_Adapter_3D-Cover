// OpenSCAD 2019.05
// HM133 DTMF Adapter cover, REV-001
// Joe Haas, KE0FF, 9/24/2019
// This is a cover for the HM-133 DTMF Adapter module.
//	It is a 2-piece "box" consisting of two identical pieces.  Only the prime piece is printable,
//	all other constructs are for debug and verification and should be commented out for printing.
// 9/25/19
// Added "uses" refernce to text lib
// Ref shapes "ghosted" with "%'

use <..\uxcover\char.scad>

//PCB constructs (debug)
%union(){
translate([70,6.55,6.9]) cube([17.5,16,12]);		// RJ45 body
translate([2,8.6,9]) cube([12,11.9,7.2]);			// RJ45 main opening
translate([2,11.3,6.9]) cube([12,6.5,2.1]);			// RJ45 tab opening
translate([2,1.85,5.2]) cube([87.5,25.3,1.7]);		// PCB
translate([2,7.95,1.96]) cube([4.2,12.4,3.24]);		// PGM conn
}

//prime (bottom) piece:
union(){
  difference(){
    union(){
      translate([0,0,0]) cube([90.2,29.1,10.9]);					// main body
      translate([1,1,.9]) cube([88.2,14,10.9]);						// lip1
      translate([0,28.3,10.9]) cube([90.2,.8,.9]);					// lip2
      translate([0,14,10.9]) cube([.9,15.1,.9]);					// lip2
      translate([89.3,14,10.9]) cube([.9,15.1,.9]);					// lip2
	  translate([20,-1.99,5.57]) cube([10,2,12.5]);					// tab 1
	  translate([20,0,0.57]) rotate([21.6,0,0]) cube([10,2,5.4]);	// tab 1
	  translate([59.7,-1.99,5.57]) cube([10,2,12.5]);				// tab 2
	  translate([59.7,0,0.57]) rotate([21.6,0,0]) cube([10,2,5.4]);	// tab 2

	  translate([22.5,28.8,5]) rotate([45,0,0]) cube([5,2,2]);		// catch 3
	  translate([62.2,28.8,5]) rotate([45,0,0]) cube([5,2,2]);		// catch 4
   }
    translate([1.8,1.8,5.2]) cube([86.6,25.5,9]);					// main central void
    translate([1.8,1.8,1.8]) cube([5.75,25.5,9]);					// pgm conn
    translate([1.8,4.2,1.8]) cube([86.6,20.7,9]);					// under pcb
    translate([-.1,7.4,5.3]) cube([95,14.3,9]);						// rj45 opening
	rotate([180,0,0]) translate([0,-29.1,-21.8]) union(){
	  translate([22,28.8,5]) rotate([45,0,0]) cube([6,2,2]);		// catch 3
	  translate([61.8,28.8,5]) rotate([45,0,0]) cube([6,2,2]);		// catch 4
	}
	union(){
	  translate([0,-2,17]) rotate([45,0,0]) cube([90.2,2,2]);		// tab cham
	}
	
//    translate([-10,-10,-10]) cube([50,50,50]);						// section cut (leave commented-out unless needed for debug)

// "MIC"
rotate([180,0,0]) translate([5,-23,-.29]) union(){
  translate([0,11,0]) char_M();
  translate([0,6,0]) char_I();
  translate([0,0,0]) char_C();
}

// "RIG"
rotate([0,180,0]) translate([-85,7.2,-.29]) union(){
  translate([0,11,0]) char_R();
  translate([0,6,0]) char_I();
  translate([0,0,0]) char_G();
}
  }
  translate([7.5,13.55,.31]) cube([10,2,2.4]);						// RJ45 compression rib 1
  translate([75,13.55,.31]) cube([10,2,2.4]);						// RJ45 compression rib 2
}



// top piece (exact duplicate of top piece):
//this rotation/translation mates the two pieces for a fit check:
//comment out for build
%rotate([180,0,0]) translate([0,-29.1,-21.8]) 
union(){
  difference(){
    union(){
      translate([0,0,0]) cube([90.2,29.1,10.9]);					// main body
      translate([1,1,.9]) cube([88.2,14,10.9]);						// lip1
      translate([0,28.3,10.9]) cube([90.2,.8,.9]);					// lip2
      translate([0,14,10.9]) cube([.9,15.1,.9]);					// lip2
      translate([89.3,14,10.9]) cube([.9,15.1,.9]);					// lip2
	  translate([20,-1.99,5.57]) cube([10,2,12.5]);					// tab 1
	  translate([20,0,0.57]) rotate([21.6,0,0]) cube([10,2,5.4]);	// tab 1
	  translate([59.7,-1.99,5.57]) cube([10,2,12.5]);				// tab 2
	  translate([59.7,0,0.57]) rotate([21.6,0,0]) cube([10,2,5.4]);	// tab 2

	  translate([22.5,28.8,5]) rotate([45,0,0]) cube([5,2,2]);		// catch 3
	  translate([62.2,28.8,5]) rotate([45,0,0]) cube([5,2,2]);		// catch 4
   }
    translate([1.8,1.8,5.2]) cube([86.6,25.5,9]);					// main central void
    translate([1.8,1.8,1.8]) cube([5.75,25.5,9]);					// pgm conn
    translate([1.8,4.2,1.8]) cube([86.6,20.7,9]);					// under pcb
    translate([-.1,7.4,5.3]) cube([95,14.3,9]);						// rj45 opening
	rotate([180,0,0]) translate([0,-29.1,-21.8]) union(){
	  translate([22,28.8,5]) rotate([45,0,0]) cube([6,2,2]);		// catch 3
	  translate([61.8,28.8,5]) rotate([45,0,0]) cube([6,2,2]);		// catch 4
	}
	union(){
	  translate([0,-2,17]) rotate([45,0,0]) cube([90.2,2,2]);		// tab cham
	}
	
//    translate([-10,-10,-10]) cube([50,50,50]);						// section cut (leave commented-out unless needed for debug)


// "MIC"
rotate([180,0,0]) translate([5,-23,-.29]) union(){
  translate([0,11,0]) char_M();
  translate([0,6,0]) char_I();
  translate([0,0,0]) char_C();
}

// "RIG"
rotate([0,180,0]) translate([-85,7.2,-.29]) union(){
  translate([0,11,0]) char_R();
  translate([0,6,0]) char_I();
  translate([0,0,0]) char_G();

}



  translate([7.5,13.55,.31]) cube([10,2,2.4]);						// RJ45 compression rib 1
  translate([75,13.55,.31]) cube([10,2,2.4]);						// RJ45 compression rib 2
}
}
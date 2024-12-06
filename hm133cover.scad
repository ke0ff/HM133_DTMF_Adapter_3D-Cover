// OpenSCAD 2019.05
// HM133 DTMF Adapter cover
// Joe Haas, KE0FF
// This is a cover for the HM-133 DTMF Adapter module.
//	It is a 2-piece "box" consisting of two identical pieces.  Only the prime piece is printable,
//	all other constructs are for debug and verification and should be commented out for printing.
//
//	Rev D, 12/06/24
//		Added #1 screw-holes to secure the tabs - this involved increasing the tab height to allow
//			the screws to thread into the PCB "ledge" away from the PCB edge.
//		Increased the size of the PGM socket pocket to allow clearance for LED and resistor on bottom
//			of PCB.
//		Reworked texts to improve printability
//		Increased weight of Morse elements to improve visibility
//
//	Rev C, 10/26/22
//		converted 2 tabs into one "super-tab" that extends nearly the length of the part
//		added chams to the ends of the tab
//		increased catch-tabs to 8mm (was 5)
//
//	Rev B, 8/31/22
//		Added morse "M" and "R" "etchings" at Mic and Rig ends of part
//
//	Rev A, 8/20/22
//		moved prime shape into module
//		chamfered bottom surface
//		added corner rounds
//		tweaked catch locations, added guide chams
//		added runways for catches
//		added signature text
//
//	Rev -, 9/25/19
//		Added "uses" reference to text lib
//		Ref shapes "ghosted" with "%'

//use <..\uxcover\char.scad>

main_len =	90.2;
tab_len	=	80;
tab_offs =	(main_len-tab_len)/2;
depth = 1;

//pcb();

prime();
// flip over for mockup view
//translate([0,29.1,10.9+10.9+.9]) rotate([180,0,0]) prime();

/*
txt_szz = 5;
!minkowski(convexity=10){
	translate([0,0,0]) linear_extrude(1.4) text("KE0FF", size=txt_szz);
	sphere(r=.3, $fn=16);
}*/

///////////////////////
// modules
module prime(){
idia1 = 1.4;
odia1 = 2;

	//prime (bottom) piece:
	union(){
	  difference(){
			difference(){
				union(){
					translate([0,0,0]) cube([90.2,29.1,10.9]);								// main body
					translate([1,1,.9]) cube([88.2,14,10.9]);								// lip1
					translate([0,28.3,10.9]) cube([90.2,.8,.9]);							// lip2
					translate([0,14,10.9]) cube([.9,15.1,.9]);								// lip2
					translate([89.3,14,10.9]) cube([.9,15.1,.9]);							// lip2
					translate([tab_offs,-2.99+.5,8.17]) cube([80,2.5,13.7]);				// tab
					translate([tab_offs,0,0.57]) rotate([18.13,0,0]) cube([80,3,8.005]);	// tab taper

					translate([22.5,28.9,5]) rotate([45,0,0]) cube([8,2,2]);				// catch 3
					translate([62.2,28.9,5]) rotate([45,0,0]) cube([8,2,2]);				// catch 4
				}
				// tab runway
				translate([tab_offs,29.1,2+5.57]) rotate([14,0,0]) cube([80,2,13.5]);
				// tab inside chams
				translate([tab_offs,0,10.9+10]) rotate([0,0,45]) cube([1.4,1.4,20], center=true);			// tab a
				translate([tab_offs+tab_len,0,10.9+10]) rotate([0,0,45]) cube([1.4,1.4,20], center=true);	// tab b
				// tab outside chams
				translate([tab_offs,-2.5,20]) rotate([0,0,45]) cube([1.5,1.5,40], center=true);				// tab a
				translate([tab_offs+tab_len,-2.5,20]) rotate([0,0,45]) cube([1.5,1.5,40], center=true);		// tab b

				// #1 mtg hole
				translate([20,30,5.4+1.414-3.25]) rotate([90,0,0]) cylinder(r=idia1/2, h=20, center=true, $fn=16);
				translate([73,30,5.4+1.414-3.25]) rotate([90,0,0]) cylinder(r=idia1/2, h=20, center=true, $fn=16);
				// #1 thru hole
				translate([20,-1.8,15.9+3.25]) rotate([-90,0,0]) csink(); //dd=odia1, hd=20);
				translate([73,-1.8,15.9+3.25]) rotate([-90,0,0]) csink(); //(dd=odia1, hd=20);

				translate([0,0,0]) cube([2,2,30], center=true);						// main body, corner knockouts
				translate([0,29.1,0]) cube([2,2,30], center=true);					// main body, corner knockouts
				translate([90.2,29.1,0]) cube([2,2,30], center=true);				// main body, corner knockouts
				translate([90.2,0,0]) cube([2,2,30], center=true);					// main body, corner knockouts
			}
		// bottom chams
		translate([45,0,0]) rotate([45,0,0]) cube([100,1,3], center=true);
		translate([45,29.1,0]) rotate([-45,0,0]) cube([100,1,3], center=true);
		translate([0,15,0]) rotate([0,-45,0]) cube([1,40,3], center=true);
		translate([90.2,15,0]) rotate([0,45,0]) cube([1,40,3], center=true);
		translate([1.8,1.7,5.2]) cube([86.6,25.7,9]);								// main central void
		translate([1.8,1.7,1.8]) cube([10.5,25.7,9]);								// pgm conn
		translate([1.8,4.2,1.8]) cube([86.6,20.7,9]);								// under pcb
		translate([-.1,7.4,5.3]) cube([95,14.3,9]);									// rj45 opening
		rotate([180,0,0]) translate([0,-29.1,-21.8]) union(){
		  translate([22,29.1,4.5]) rotate([45,0,0]) cube([9,2,2]);					// catch 3
		  translate([61.8,29.1,4.5]) rotate([45,0,0]) cube([9,2,2]);				// catch 4
		}
		union(){
		  translate([0,-3.3,17+3]) rotate([45,0,0]) cube([90.2,4,2]);					// tab cham
		  translate([0,.15,17+3]) rotate([20,0,0]) cube([90.2,2,3]);					// tab cham
		}
		
	//    translate([-10,-10,-10]) cube([50,50,50]);								// section cut (leave commented-out unless needed for debug)

		// "MIC"
		translate([5,14.5,.5]) rotate([180,0,90]) linear_extrude(1.4) text("MIC", size=7, font="Courier", halign="center");

/*		rotate([180,0,0]) translate([5,-23,-.5]) union(){
		translate([0,11,0]) char_M();
		translate([0,6,0]) char_I();
		translate([0,0,0]) char_C();
		}*/

		// "M"
//		translate([-.1,12.7,1.2]) rotate([90,0,90]) linear_extrude(.5) text("M", size=3.5);
		// morse "M" (at end of part)
		translate([0,29/2,3]) union(){
			translate([0,-(4.5/2)-(1.5/2),0]) rotate([90,0,0]) cylinder(r=.9, h=4.5, center=true, $fn=4);
			translate([0,(4.5/2)+(1.5/2),0]) rotate([90,0,0]) cylinder(r=.9, h=4.5, center=true, $fn=4);
		}

		// "RIG"
		translate([85,14.5,.5]) rotate([180,0,90+180]) linear_extrude(1.4) text("RIG", size=7, font="Courier", halign="center");

/*		rotate([0,180,0]) translate([-85,7.2,-.5]) union(){
			translate([0,11,0]) char_R();
			translate([0,6,0]) char_I();
			translate([0,0,0]) char_G();
		}*/
		// morse "R" (at end of part)
		translate([90.2,29/2,3]) union(){
			translate([0,-(4.5/2)-1.5-(1.5/2),0]) rotate([90,0,0]) cylinder(r=.9, h=1.5, center=true, $fn=4);
			translate([0,0,0]) rotate([90,0,0]) cylinder(r=.9, h=4.5, center=true, $fn=4);
			translate([0,+(4.5/2)+1.5+(1.5/2),0]) rotate([90,0,0]) cylinder(r=.9, h=1.5, center=true, $fn=4);
		}
	}
		// corner rounds
		translate([1,1,0]) corner();
		translate([1,29.1-1,0]) rotate([0,0,-90]) corner(cht=10.9+.9);
		translate([90.2-1,29.1-1,0]) rotate([0,0,-180]) corner2(cht=10.9+.9);
		translate([90.2-1,1,0]) rotate([0,0,-270]) corner(cht=10.9);

		translate([7.5,13.55,1.51]) cube([10,2,2.2-1]);						// RJ45 compression rib 1
		translate([75,13.55,1.51]) cube([10,2,2.2-1]);						// RJ45 compression rib 2

		// signature/revision
		translate([20,15,0]) scale([1.5,1.5,1]){
		  txt_sz = 3;
		  translate([0,(txt_sz/2)+(.2*txt_sz),.8]) linear_extrude(1.4) text("KE0FF", size=txt_sz);
		  translate([5.65+.05,(txt_sz/2)+(.2*txt_sz)-.08,.8]) rotate([0,0,-26]) cube([.3,3.5,1.4]);			

		  translate([0,-txt_sz/2,.8]) linear_extrude(1.4) text("HM133 COVER", size=txt_sz);
		  translate([0,(-txt_sz*3/2)-(.2*txt_sz),.8]) linear_extrude(1.4) text("REV D", size=txt_sz);
		}
	}
} // end prime()

module csink(dd=2, hd=3.5){
	cylinder(r=dd/2, h=20, center=true, $fn=16);
	cylinder(r1=hd/2, r2 = 0, h=hd/2, center=true, $fn=16);
}

module corner(cr=1, cht=10.9){
	difference(){
		cylinder(r=cr, h=cht, $fn=20);
		translate([1.501,0,0]) cube([3,3,30], center=true);
		translate([0,1.501,0]) cube([3,3,30], center=true);
		translate([0,-1,0]) rotate([45,0,0]) cube([10,1,3], center=true);
		translate([-1,0,0]) rotate([0,-45,0]) cube([1,10,3], center=true);
		translate([.3,.4,10.9+.5]) cube([1,1,1], center=true);
	}
} // end corner()

module corner2(cr=1, cht=10.9){
	difference(){
		cylinder(r=cr, h=cht, $fn=20);
		translate([1.5,0,0]) cube([3,3,30], center=true);
		translate([0,1.5,0]) cube([3,3,30], center=true);
		translate([0,-1,0]) rotate([45,0,0]) cube([10,1,3], center=true);
		translate([-1,0,0]) rotate([0,-45,0]) cube([1,10,3], center=true);
		translate([.4,.3,10.9+.5]) cube([1,1,1], center=true);
	}
} // end corner2()

// PCB construct (debug)
module pcb(){
	translate([.5,0,0])
	%union(){
		translate([70,6.55,6.9]) cube([17.5,16,12]);		// RJ45 body
		translate([2,8.6,9]) cube([12,11.9,7.2]);			// RJ45 main opening
		translate([2,11.3,6.9]) cube([12,6.5,2.1]);			// RJ45 tab opening
		translate([2,1.85,5.2]) cube([84.3,25.3,1.7]);		// PCB
		translate([2,7.95,1.96]) cube([4.2,12.4,3.24]);		// PGM conn
	}
} // end pcb()

// characters ///////////////////////////////////////////////////////////////////////////
lw = 1.3;

//char_M();

module char_M(){
  union(){										// "M"
	rotate([90,0,90]) seg();
//	cube([6,.8,depth]);
#	translate([2.4,3.3,0]) rotate([90,0,45]) seg(len=3.4);
	translate([2.05,3.45,0]) rotate([90,0,135]) seg(len=3.4);
//	translate([6,.8,0]) rotate([0,0,135]) cube([3.4,.8,depth]);
//	translate([5.6,5.34-.15,0]) rotate([0,0,225]) cube([3.65,.8,depth]);
	translate([4.8,0,0]) rotate([90,0,90]) seg(len=6);
//	translate([0,5-.6,0]) cube([6,.8,depth]);
  }
}

module char_I(){
  union(){										// "I"
	cube([.5,3,depth]);
	translate([0,1.3,0]) cube([6,.5,depth]);
	translate([5.5,0,0]) cube([.5,3,depth]);
  }
}

module char_C(){
   union(){										// "C"
	translate([1,3.5,0]) cube([4.3,.5,depth]);
	translate([0,1,0]) cube([.5,2,depth]);
	translate([5.8,1,0]) cube([.5,2,depth]);
	translate([0,1,0]) rotate([0,0,315]) cube([1.4,.5,depth]);
	translate([5.95,1.35,0]) rotate([0,0,225]) cube([1.4,.5,depth]);
	translate([4.95,3.66,0]) rotate([0,0,315]) cube([1.4,.5,depth]);
	translate([1,4,0]) rotate([0,0,225]) cube([1.4,.5,depth]);
  }
}

module char_CIRCLEI(){
  union(){										// ICOM "I"
	translate([0,1.3,0]) cube([5.5,.7,depth]);
	translate([8.6,1.45,0]) union(){
		difference(){
			cylinder(h=depth, d=5.5, center=false, $fn=16);
			translate([0,0,-.1]) cylinder(h=2, d=4.3, center=false, $fn=16);
		}
	}
  }
}

module char_R(){
  union(){										// "R"
	translate([0,3.5,0]) cube([6.1,.5,depth]);
	translate([3.8,0,0]) cube([1.7,.5,depth]);
	translate([6,1,0]) cube([.5,3,depth]);
	translate([2.8,1,0]) cube([.5,3,depth]);
	translate([2.8,1,0]) rotate([0,0,315]) cube([1.4,.5,depth]);
	translate([6.1,1.33,0]) rotate([0,0,225]) cube([1.4,.5,depth]);
	translate([0,0,0]) rotate([0,0,20]) cube([3.3,.5,depth]);
  }
}

module char_G(){
  union(){										// "G"
	translate([1,3.5,0]) cube([4.3,.5,depth]);
	translate([0,1,0]) cube([.5,2,depth]);
	translate([5.8,1,0]) cube([.5,2,depth]);
	translate([0,1,0]) rotate([0,0,315]) cube([1.4,.5,depth]);
	translate([5.95,1.35,0]) rotate([0,0,225]) cube([1.4,.5,depth]);
	translate([4.95,3.66,0]) rotate([0,0,315]) cube([1.4,.5,depth]);
	translate([1,4,0]) rotate([0,0,225]) cube([1.4,.5,depth]);
	translate([1,0,0]) cube([1.51,.5,depth]);
	translate([2.5,0,0]) cube([.5,2,depth]);
  }
}

//seg();
module seg(len=6){
bev = .5;

	translate([bev,0,0]) rotate([90,0,90]) cylinder(r=lw/2, h=len-(2*bev), $fn=4);
	rotate([90,0,90]) cylinder(r2=lw/2, r1=0, h=bev, $fn=4);
	translate([len-bev,0,0]) rotate([90,0,90]) cylinder(r1=lw/2, r2=0, h=bev, $fn=4);
}
// eof

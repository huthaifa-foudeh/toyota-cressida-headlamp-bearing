// =====================================================================
//  Toyota Cressida MX73 (1985-88, US) - headlamp adjuster bearing  v6
//  Most likely OEM part: Toyota 81153-22520 "Bearing, Headlamp"
//  v4: rebuilt on caliper measurements of the original part (its tip is
//      broken, so the tip length is a design choice).
//  v5: no print pause. The nut slides into a side slot after printing, so
//      the customer can fit standard M6 hardware himself.
//  v6: no inner washer. Its slot was the weakest section of the hub (right
//      at the plate, where the bending from the ball screw is highest), so it
//      is now solid; only the nut slot is left. Extra plastic (a lip pad) in
//      front of the ball makes the opening smaller (6.4 -> 6.0 mm), so the
//      ball needs about a third more force to be pulled out. The ball centre,
//      the fork and the click when fitting the ball are the same as v5.
//
//  How it works:
//   * The M6 stud bolts to the headlamp; the round pin keys into the lamp
//     bracket; the ball screw goes into the chassis.
//   * The ball screw stands at 90 deg to the stud and leaves through the
//     BALL FACE (the straight face, opposite the pin).
//   * The ball sits in a cup at the end of the fork channel. The cup rim on
//     the front of the lip pad (the lips) is smaller than the ball, so the
//     ball can not come out through the face. Only the neck passes.
//   * Behind the ball the channel is narrower than the ball and solid below,
//     so the ball cannot slide along it: no play along the screw.
//   * Fitting: neck in the neck slot, push the ball in from the fork tip
//     until it clicks into the cup (the fork opens ~0.6 mm).
//   * The stud is an M6 threaded rod screwed into a steel M6 nut. The nut
//     slides into a side slot after printing; the slot's hex end stops it
//     from turning. The nut presses on 3.2 mm of solid plastic, and a washer
//     in the recess on the plate face carries the load into the lamp.
//
//  Units: mm. Part frame: Z = 0 on the plate face (lamp side), +Z to the
//  fork tip, -X = ball face, +X = pin side. Output is rotated for printing:
//  fork tip on the bed, plate up, no supports (use a brim).
// =====================================================================

/* [1. Ball screw - measured] */
ball_d          = 8.0;    // ball diameter
neck_d          = 5.1;    // neck diameter right under the ball

/* [2. Measured on the original part] */
ball_z_meas     = 20.0;   // plate face -> far edge of the neck (sheet item A)
flange_x        = 20.0;   // plate size in the pin direction
flange_y        = 18.0;   // plate size along the edge that carries the pin
flange_t        = 2.4;    // plastic plate thickness
disc_proud      = 0.5;    // original metal disc thickness (its face stands 0.5 off the plate)
body_y          = 10.7;   // body width across the fork prongs
body_x_root     = 19.0;   // ball face -> pin-side face, at the plate
body_x_tip      = 17.5;   // same at the tip (only the pin-side face is slanted)
pin_d           = 4.0;    // round anti-rotation pin
pin_out         = 4.0;    // pin sticks out past the plate edge
pin_above       = 3.0;    // pin rises above the plate face
stud_out        = 14.0;   // stud length above the metal disc

/* [3. Ball cup, lips and fork - design] */
tip_beyond      = 4.6;    // ball centre -> fork tip (original tip is broken)
seat_clear      = 0.25;   // cup = ball_d + seat_clear
ball_depth      = 2.603;  // ball centre behind the ball face (same place as v5)
lip_d           = 6.0;    // cup opening at the front of the lip pad (v5: 6.4 on the face)
                          //   smaller = harder to pull out, but less swivel for the neck
neck_slot_w     = 5.6;    // slot in the ball face from the cup to the tip (for the neck)
snap            = 0.6;    // fork mouth = ball_d - snap (bigger = harder click)
lead            = 0.6;    // extra width right at the tip (lead-in)
lead_len        = 0.6;
waist_w         = 2.8;    // relief slot that lets the fork open (through)
pocket_w        = 5.0;    // blind pocket on the ball face (as original)
pocket_depth    = 2.0;
pocket_z0       = 5.6;    // pocket from/to, measured from the plate face
pocket_z1       = 11.2;
tip_chamfer_z   = 4.0;    // chamfer on the pin side of the tip
tip_chamfer_x   = 3.5;

/* [4. Stud hardware - fitted after printing] */
nut_af          = 10.0;   // M6 nut across flats
nut_t           = 5.0;    // M6 nut thickness
disc_d          = 12.0;   // M6 washer on the plate face, in a recess,
disc_t          = 1.6;    //   standing 0.5 off the plate like the original disc
base_t          = 3.2;    // solid plastic between the washer recess and the nut
                          //   (v5: 1.3 mm web + a slot for an inner washer)
slot_clear      = 0.3;    // sliding clearance in the side slot
stud_hole_d     = 6.4;
hub_w           = 15.2;   // hub width under the plate (around the side slot)

/* [5. Output] */
part            = "full"; // [full, fork_test]
fork_test_h     = 15.0;   // test piece: fork end only, no stud anchor

$fn = 72;
eps = 0.01;

// ---------------------------------------------------------------------
// Derived values
// ---------------------------------------------------------------------
z_seat    = ball_z_meas - neck_d / 2;          // ball centre from the plate face
z_tip     = z_seat + tip_beyond;
x_face    = -body_x_root / 2;                  // ball face (straight)
x_r_root  = body_x_root / 2;
x_r_tip   = x_face + body_x_tip;
function x_r(z) = x_r_root + (x_r_tip - x_r_root) * (z - flange_t) / (z_tip - flange_t);
r_ball    = ball_d / 2;
r_seat    = (ball_d + seat_clear) / 2;
mouth_w   = ball_d - snap;
lead_w    = mouth_w + lead;
x_cup     = x_face + ball_depth;               // ball centre (unchanged from v5)
h_front   = sqrt(r_seat * r_seat - (lip_d / 2) * (lip_d / 2));   // ball centre -> front of the lips
pad_t     = h_front - ball_depth;              // lip pad thickness in front of the ball face
x_front   = x_face - pad_t;                    // front of the lip pad
z_pad0    = z_seat - lip_d / 2 - 1.5;          // lip pad runs from here to the tip
ball_out  = r_ball - h_front;                  // ball sticks out past the lip pad
pin_x     = flange_x / 2 + pin_out - pin_d / 2;
recess    = disc_t - disc_proud;
z_nut     = recess + base_t;                   // nut slot floor: the nut sits on it
z_nut_top = z_nut + nut_t + slot_clear;
z_w0      = z_nut_top + 0.8;                   // bottom of the waist slot
stud_len  = stud_out + disc_proud + z_nut + nut_t;   // ends flush with the nut
z_apex    = z_seat - r_seat * sqrt(2);

// neck swivel before it touches the lips (ball pulled against the lips)
d_pull    = sqrt(r_ball * r_ball - (lip_d / 2) * (lip_d / 2));
swivel    = acos(neck_d / ball_d) - atan2(d_pull, lip_d / 2);

echo("v6: no inner washer, the nut slides into the side slot after printing");
echo(str("Ball centre: ", -x_cup, " mm from the stud axis, ", z_seat, " mm from the plate face, ",
         tip_beyond, " mm from the tip"));
echo(str("Lip pad: ", pad_t, " mm in front of the ball face; opening ", lip_d, " mm; lips overlap the ball by ",
         (ball_d - lip_d) / 2, " mm each side; ball sticks out ", ball_out, " mm"));
echo(str("Neck can swivel about ", swivel, " deg before it touches the lips"));
echo(str("Stud: M6 threaded rod ", stud_len, " mm long (sticks out ", stud_out, " mm past the washer)"));

assert(lip_d < ball_d - 1.0, "Cup opening must be clearly smaller than the ball");
assert(lip_d > neck_d + 0.8, "Cup opening too tight for the neck to swivel");
assert(pad_t >= 0, "Lip opening can not be bigger than the cup on the ball face");
assert(neck_slot_w > neck_d + 0.4, "Neck slot too narrow for the neck");
assert(neck_slot_w < lip_d, "Neck slot must be narrower than the cup opening");
assert(mouth_w < ball_d, "Fork mouth must be narrower than the ball");
assert((nut_af + slot_clear) / cos(30) / 2 + 1.2 <= hub_w / 2, "Hub too narrow around the nut slot");
assert(hub_w <= flange_y, "Hub wider than the plate");
assert(z_nut >= flange_t + 0.5, "Nut slot must start above the plate");
assert(z_nut_top < z_w0 - 0.7, "Nut slot runs into the waist slot");
assert(z_pad0 > pocket_z1 + 1.0, "Lip pad runs into the face pocket");
assert(z_pad0 > z_nut_top + 3.0, "Lip pad starts on the hub taper");
assert(pocket_z1 < z_apex + (x_cup - (x_face + pocket_depth)) - 0.8, "Face pocket runs into the cup");
assert(x_face + pocket_depth < -(nut_af + 0.3) / cos(30) / 2 - 1.2, "Face pocket too close to the nut");

// ---------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------
module xrect(x0, x1, yw, r, h) {          // rounded rectangle from X=x0 to X=x1, centred in Y
    translate([(x0 + x1) / 2, 0, 0])
        linear_extrude(h) offset(r) square([x1 - x0 - 2 * r, yw - 2 * r], center = true);
}
module x_extrude(x0, x1) {               // 2D (x->Y, y->Z) extruded from X=x0 to X=x1
    translate([x0, 0, 0]) rotate([90, 0, 90]) linear_extrude(height = x1 - x0) children();
}
module slab(z, yw, r = 0.6) { translate([0, 0, z]) xrect(x_face, x_r(z), yw, r, eps); }

// ---------------------------------------------------------------------
// Solids
// ---------------------------------------------------------------------
module flange() {
    xrect(-flange_x / 2, flange_x / 2, flange_y, 1.2, flange_t);
    hull() {                                              // ear that carries the pin
        translate([flange_x / 2 - 1, -pin_d / 2, 0]) cube([1, pin_d, flange_t]);
        translate([pin_x, 0, 0]) cylinder(d = pin_d, h = flange_t);
    }
    translate([pin_x, 0, -pin_above]) cylinder(d = pin_d, h = pin_above + flange_t);
    // 45 deg web under the ear so it prints without support
    w = pin_x + pin_d / 2 - x_r(flange_t);
    hull() {
        translate([x_r(flange_t) - 0.5, -pin_d / 2, flange_t - eps]) cube([w + 0.5, pin_d, eps]);
        translate([x_r(flange_t + w + 1.2) - 0.5, -pin_d / 2, flange_t + w + 1.2 - eps]) cube([eps, pin_d, eps]);
    }
}

module body() {
    difference() {
        hull() { slab(flange_t - eps, body_y); slab(z_tip, body_y); }
        // chamfer on the pin side of the tip
        x1 = x_r(z_tip) - tip_chamfer_x;  x2 = x_r(z_tip - tip_chamfer_z);
        translate([0, body_y, 0]) rotate([90, 0, 0]) linear_extrude(2 * body_y)
            polygon([[x1, z_tip + 1], [x2 + 5, z_tip + 1], [x2 + 5, z_tip - tip_chamfer_z - 5 * tip_chamfer_z / tip_chamfer_x],
                     [x2, z_tip - tip_chamfer_z], [x1, z_tip]]);
    }
    hull() {      // hub under the plate: carries the side slot for the nut
        slab(flange_t - eps, hub_w);
        slab(z_nut_top + 0.6, hub_w);
        slab(z_nut_top + 3.0, body_y);             // <= 45 deg taper, prints clean
    }
    hull() {      // 40 deg chamfer under the plate edges (no droop when printing)
        slab(flange_t - eps, flange_y - 0.4);
        slab(flange_t + 1.4, hub_w);
    }
    lip_pad();
}

module lip_pad() {       // v6: extra plastic in front of the ball -> smaller opening
    hull() {
        translate([0, 0, z_pad0])         xrect(x_face,  x_face + 2, body_y, 0.6, eps);
        translate([0, 0, z_pad0 + pad_t]) xrect(x_front, x_face + 2, body_y, 0.6, eps);  // 45 deg step
        translate([0, 0, z_tip])          xrect(x_front, x_face + 2, body_y, 0.6, eps);
    }
}

// ---------------------------------------------------------------------
// Ball cup, lips and fork
// ---------------------------------------------------------------------
module slot_2d(w, lw) {  // slot from the ball centre to the tip, with lead-in
    translate([-w / 2, z_seat]) square([w, z_tip - lead_len - z_seat + eps]);
    polygon([[-w / 2, z_tip - lead_len], [w / 2, z_tip - lead_len],
             [lw / 2, z_tip + eps], [lw / 2, z_tip + 1],
             [-lw / 2, z_tip + 1], [-lw / 2, z_tip + eps]]);
}
module roof_2d(w) {     // 45 deg roof under the channel, down to the waist (prints clean)
    polygon([[-w / 2, z_seat + eps], [w / 2, z_seat + eps],
             [waist_w / 2, z_seat - (w - waist_w) / 2], [-waist_w / 2, z_seat - (w - waist_w) / 2]]);
}
module waist_2d() {
    hull() {
        translate([0, z_seat]) circle(d = waist_w);
        translate([0, z_w0 + waist_w / 2]) circle(d = waist_w);
    }
}

module ball_cuts() {
    // cup, with a 45 deg roof towards the plate so it prints without support
    hull() {
        translate([x_cup, 0, z_seat]) sphere(r = r_seat);
        translate([x_cup, 0, z_apex]) cube(0.02, center = true);
    }
    // entry from the tip, straight down onto the cup: the round funnel lets the
    // ball pass the lips with the same small click as the mouth; at the ball
    // face it is narrower than the neck slot, so the lips stay whole
    translate([x_cup, 0, z_seat]) cylinder(d = mouth_w, h = z_tip - lead_len - z_seat + eps);
    translate([x_cup, 0, z_tip - lead_len]) cylinder(d1 = mouth_w, d2 = lead_w, h = lead_len + eps);
    translate([x_cup, 0, z_tip]) cylinder(d = lead_w, h = 1);
    // lips: in the ball face only a neck slot runs from the cup to the tip
    x_extrude(x_face - 1, x_cup + eps) slot_2d(neck_slot_w, neck_slot_w + lead);
    // fork channel behind the lips, through to the pin-side face; narrower
    // than the ball, so the ball can not slide along it
    x_extrude(x_cup, x_r_root + 2) { slot_2d(mouth_w, lead_w); roof_2d(mouth_w); }
    // relief slot that lets the fork open
    x_extrude(x_face - 1, x_r_root + 2) waist_2d();
}

module face_pocket() {   // blind pocket on the ball face
    rr = min(pocket_w, pocket_z1 - pocket_z0) / 2 - 0.01;
    translate([x_face, 0, 0]) rotate([90, 0, 90])
        linear_extrude(height = 2 * pocket_depth, center = true)
            translate([0, (pocket_z0 + pocket_z1) / 2])
                offset(r = rr) square([pocket_w - 2 * rr, pocket_z1 - pocket_z0 - 2 * rr], center = true);
}

module stud_anchor() {
    translate([0, 0, -pin_above - 1]) cylinder(d = stud_hole_d, h = z_nut + pin_above + 1);
    translate([0, 0, -1]) cylinder(d = disc_d + 0.4, h = recess + 1);                    // outer washer recess
    translate([0, 0, recess - eps]) cylinder(d1 = stud_hole_d + 1.0, d2 = stud_hole_d, h = 0.5);
    // side slot for the nut, open to +Y, hex end on the stud axis
    // (flats facing X, so the nut can not turn once it sits at the end)
    hull() for (y = [0, 20]) translate([0, y, z_nut]) rotate([0, 0, 30])
        cylinder(d = (nut_af + slot_clear) / cos(30), h = nut_t + slot_clear, $fn = 6);
}

// ---------------------------------------------------------------------
module bearing_part_frame(anchor = true) {
    difference() {
        union() { flange(); body(); }
        ball_cuts();
        face_pocket();
        if (anchor) stud_anchor();
    }
}

module print_orientation() {     // fork tip on the bed, plate up
    translate([0, 0, z_tip]) rotate([180, 0, 0]) children();
}

if (part == "full") {
    print_orientation() bearing_part_frame();
} else {
    intersection() {
        print_orientation() bearing_part_frame(anchor = false);
        translate([-50, -50, 0]) cube([100, 100, fork_test_h]);
    }
}

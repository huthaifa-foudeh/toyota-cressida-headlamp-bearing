// =====================================================================
//  Toyota Cressida - front seat headrest plate (Toyota 71922-30060)
//  3D-printable replacement, reverse-engineered from photos and caliper
//  measurements of a damaged original (Nov 2026).
//
//  Frame (mm):
//    x : along the long axis; the part is mirror-symmetric about x = 0
//    y : 0 at the straight edge, positive toward the curved edge
//    z : 0 at the visible front face, positive toward the back side
//  Print with the front face DOWN (as modelled). The part is 236.2 mm
//  long: on a 220 x 220 bed rotate it 45 deg (footprint ~204 x 204 mm).
// =====================================================================

/* [Output] */
variant = "original";      // [original, reinforced, fit_check]
// Thin bridge over each screw recess so the hole prints face-down.
// Push it out with a 4.5 mm drill or a small screwdriver after printing.
sacrificial_layer = true;
sacrificial_t     = 0.4;
with_pins         = true;

/* [Measured on the original] */
plate_t       = 2.2;   // plate thickness
lip_h         = 2.7;   // total height at the perimeter lip
lip_w         = 1.5;   // perimeter lip width (estimated from photos)
front_chamfer = 1.0;   // 45 deg chamfer on the front face edges (replaces the moulded radius)

slot_len      = 58.5;  // slot opening, tip to tip
slot_w        = 13.5;  // slot opening width
rim_h         = 5.6;   // slot rim height from the front face
rim_wall      = 2.0;   // slot rim wall thickness

boss_d        = 16.0;  // screw boss outer diameter
boss_h        = 5.6;   // screw boss height from the front face
hole_d        = 4.6;   // screw hole
cbore_d       = 9.6;   // screw-head recess on the front face
cbore_depth   = 3.5;

pin_span      = 5.0;   // cross pin, tip to tip
pin_arm       = 1.5;   // cross pin arm thickness
pin_h         = 10.5;  // cross pin height from the front face

/* [Positions (from photos)] */
hole_pos = [[ 94.20, 29.73], [ 34.66, 49.89], [-34.66, 49.89], [-94.20, 29.73]];
slot_x   = 74.40;      // slot centres at x = +/- slot_x
slot_y0  = 9.00;       // slot tip nearest the straight edge
pin_pos  = [[ 54.20, 27.90], [-54.20, 27.90]];

/* [Reinforced variant] */
r_plate_t = 3.0;       // thicker plate (back side only; front face and edge height unchanged)
r_fill_h  = 4.0;       // solid band across the plate at each slot (where the original cracked)
r_gusset  = 1.2;       // 45 deg collar at the base of bosses, rims and pins
// Everything added stays at least 1.6 mm below the contact plane z = 5.6.

/* [Fit-check template] */
fc_t   = 1.6;          // template thickness
fc_clr = 0.5;          // radial clearance around the loose cut-outs
fc_loc_clr = 0.3;      // radial clearance on the two locating (outer) bosses

$fa = 4;
$fs = 0.3;
eps = 0.01;

// Outline traced from photos, then corrected after the first printed fit-check:
// ends +0.3 mm, corner fillets 9.0 / 5.0 mm, straight edge 0.3 mm further out
// toward the ends (unchanged at the middle; width at x = 0 stays 76.79 mm)
outline_pts = [
  [0.012, -0.000],
  [-27.192, -0.022],
  [-54.412, -0.089],
  [-81.492, -0.199],
  [-109.092, -0.356],
  [-109.692, -0.332],
  [-110.292, -0.267],
  [-110.892, -0.162],
  [-111.472, -0.021],
  [-112.052, 0.162],
  [-112.612, 0.379],
  [-113.152, 0.631],
  [-113.692, 0.927],
  [-114.092, 1.178],
  [-114.466, 1.440],
  [-114.826, 1.720],
  [-115.172, 2.018],
  [-115.510, 2.340],
  [-115.813, 2.660],
  [-116.105, 3.000],
  [-116.384, 3.360],
  [-116.649, 3.740],
  [-116.885, 4.120],
  [-117.107, 4.520],
  [-117.302, 4.920],
  [-117.481, 5.340],
  [-117.635, 5.760],
  [-117.765, 6.180],
  [-117.877, 6.620],
  [-117.981, 7.160],
  [-118.050, 7.700],
  [-118.085, 8.240],
  [-118.087, 8.840],
  [-118.054, 11.400],
  [-117.992, 13.940],
  [-117.901, 16.500],
  [-117.783, 19.040],
  [-117.600, 22.140],
  [-117.375, 25.240],
  [-117.108, 28.340],
  [-116.799, 31.440],
  [-116.448, 34.540],
  [-116.055, 37.640],
  [-115.620, 40.740],
  [-115.143, 43.840],
  [-114.539, 47.420],
  [-113.884, 50.980],
  [-113.172, 54.540],
  [-112.406, 58.100],
  [-111.731, 61.040],
  [-111.089, 63.680],
  [-110.947, 64.120],
  [-110.771, 64.560],
  [-110.561, 65.000],
  [-110.328, 65.420],
  [-110.089, 65.800],
  [-109.832, 66.168],
  [-109.552, 66.529],
  [-109.253, 66.880],
  [-108.934, 67.220],
  [-108.605, 67.540],
  [-108.252, 67.853],
  [-107.892, 68.144],
  [-107.512, 68.422],
  [-107.132, 68.674],
  [-106.752, 68.900],
  [-106.352, 69.113],
  [-105.952, 69.300],
  [-105.552, 69.461],
  [-105.152, 69.598],
  [-104.752, 69.708],
  [-104.352, 69.793],
  [-102.812, 70.050],
  [-98.912, 70.672],
  [-95.452, 71.189],
  [-91.952, 71.679],
  [-88.512, 72.130],
  [-85.012, 72.560],
  [-81.452, 72.968],
  [-77.852, 73.353],
  [-73.672, 73.766],
  [-69.412, 74.152],
  [-65.052, 74.511],
  [-60.612, 74.844],
  [-56.072, 75.151],
  [-51.432, 75.431],
  [-46.692, 75.686],
  [-41.872, 75.914],
  [-36.912, 76.118],
  [-31.872, 76.294],
  [-26.732, 76.445],
  [-21.492, 76.569],
  [-16.192, 76.665],
  [-10.832, 76.734],
  [-5.432, 76.776],
  [-0.012, 76.790],
  [5.412, 76.776],
  [10.812, 76.735],
  [16.172, 76.665],
  [21.492, 76.569],
  [26.732, 76.445],
  [31.872, 76.294],
  [36.912, 76.118],
  [41.872, 75.914],
  [46.692, 75.686],
  [51.432, 75.431],
  [56.072, 75.151],
  [60.612, 74.844],
  [65.052, 74.511],
  [69.412, 74.152],
  [73.672, 73.766],
  [77.852, 73.353],
  [81.452, 72.968],
  [85.012, 72.560],
  [88.512, 72.130],
  [91.952, 71.679],
  [95.452, 71.189],
  [98.912, 70.672],
  [102.812, 70.050],
  [104.352, 69.793],
  [104.752, 69.708],
  [105.152, 69.598],
  [105.552, 69.461],
  [105.952, 69.300],
  [106.352, 69.113],
  [106.752, 68.900],
  [107.132, 68.674],
  [107.512, 68.422],
  [107.892, 68.144],
  [108.252, 67.853],
  [108.605, 67.540],
  [108.934, 67.220],
  [109.253, 66.880],
  [109.552, 66.529],
  [109.832, 66.168],
  [110.089, 65.800],
  [110.328, 65.420],
  [110.561, 65.000],
  [110.771, 64.560],
  [110.947, 64.120],
  [111.089, 63.680],
  [111.731, 61.040],
  [112.406, 58.100],
  [113.172, 54.540],
  [113.884, 50.980],
  [114.539, 47.420],
  [115.143, 43.840],
  [115.620, 40.740],
  [116.055, 37.640],
  [116.448, 34.540],
  [116.799, 31.440],
  [117.108, 28.340],
  [117.375, 25.240],
  [117.600, 22.140],
  [117.783, 19.040],
  [117.901, 16.500],
  [117.992, 13.940],
  [118.054, 11.400],
  [118.087, 8.840],
  [118.085, 8.240],
  [118.050, 7.700],
  [117.981, 7.160],
  [117.877, 6.620],
  [117.765, 6.180],
  [117.635, 5.760],
  [117.481, 5.340],
  [117.302, 4.920],
  [117.107, 4.520],
  [116.885, 4.120],
  [116.649, 3.740],
  [116.384, 3.360],
  [116.105, 3.000],
  [115.813, 2.660],
  [115.510, 2.340],
  [115.172, 2.018],
  [114.826, 1.720],
  [114.466, 1.440],
  [114.092, 1.178],
  [113.692, 0.927],
  [113.152, 0.631],
  [112.612, 0.379],
  [112.052, 0.162],
  [111.472, -0.021],
  [110.892, -0.162],
  [110.292, -0.267],
  [109.692, -0.332],
  [109.092, -0.356],
  [81.492, -0.199],
  [54.412, -0.089],
  [27.212, -0.022]
];

// ---------------------------------------------------------------------
module outline2d() polygon(outline_pts);
module inner2d()   offset(delta = -lip_w) outline2d();

module slot2d(grow = 0, sx = 0) {
    r = slot_w / 2 + grow;
    hull() for (yy = [slot_y0 + slot_w / 2, slot_y0 + slot_len - slot_w / 2])
        translate([sx, yy]) circle(r = r);
}
module slots2d(grow = 0) for (s = [-1, 1]) slot2d(grow, s * slot_x);

// Prism of a convex 2D child with a 45 deg chamfer along its bottom edge
module chamfered_prism(h, c) {
    hull() {
        linear_extrude(eps) offset(delta = -c) children();
        translate([0, 0, c]) linear_extrude(h - c) children();
    }
}

module pin(reinforced = false) {
    tip = reinforced ? 0.4 : 0;
    for (a = [0, 90]) rotate(a) hull() {
        translate([-pin_span / 2, -pin_arm / 2, 0]) cube([pin_span, pin_arm, pin_h - tip]);
        translate([-pin_span / 2 + tip, -pin_arm / 2, 0]) cube([pin_span - 2 * tip, pin_arm, pin_h]);
    }
    if (reinforced)   // tapered collar, ends 0.6 mm below the contact plane
        translate([0, 0, r_plate_t - eps]) cylinder(d1 = 7.4, d2 = pin_span + 0.2, h = 2.0);
}

module cutouts() {
    for (s = [-1, 1]) {
        // slot opening + front chamfer
        translate([0, 0, -1]) linear_extrude(rim_h + 2) slot2d(0, s * slot_x);
        hull() {
            translate([0, 0, -eps]) linear_extrude(eps) slot2d(front_chamfer, s * slot_x);
            translate([0, 0, front_chamfer]) linear_extrude(eps) slot2d(0, s * slot_x);
        }
    }
    for (p = hole_pos) translate(p) {
        translate([0, 0, -eps]) cylinder(d = cbore_d, h = cbore_depth + eps);
        translate([0, 0, -eps]) cylinder(d1 = cbore_d + 0.8, d2 = cbore_d, h = 0.4);
        z0 = sacrificial_layer ? cbore_depth + sacrificial_t : cbore_depth - eps;
        translate([0, 0, z0]) cylinder(d = hole_d, h = boss_h + 10);
    }
}

module body_original() {
    difference() {
        union() {
            chamfered_prism(plate_t, front_chamfer) outline2d();
            translate([0, 0, plate_t - eps])
                linear_extrude(lip_h - plate_t + eps) difference() { outline2d(); inner2d(); }
            linear_extrude(rim_h) difference() { slots2d(rim_wall); slots2d(0); }
            for (p = hole_pos) translate(p) cylinder(d = boss_d, h = boss_h);
            if (with_pins) for (p = pin_pos) translate(p) pin(false);
        }
        cutouts();
    }
}

module body_reinforced() {
    difference() {
        union() {
            // edge band keeps the original 2.7 mm edge height, inside is thicker
            chamfered_prism(lip_h, front_chamfer) outline2d();
            linear_extrude(r_plate_t) inner2d();
            // slot rims: same contact footprint, plus base collars
            linear_extrude(rim_h) difference() { slots2d(rim_wall); slots2d(0); }
            for (s = [-1, 1]) hull() {
                translate([0, 0, r_plate_t - eps]) linear_extrude(eps) slot2d(rim_wall + r_gusset, s * slot_x);
                translate([0, 0, r_plate_t + r_gusset]) linear_extrude(eps) slot2d(rim_wall, s * slot_x);
            }
            // solid band from each slot rim to both plate edges
            linear_extrude(r_fill_h) intersection() {
                inner2d();
                for (s = [-1, 1])
                    translate([s * slot_x - (slot_w / 2 + rim_wall), -50]) square([slot_w + 2 * rim_wall, 200]);
            }
            for (p = hole_pos) translate(p) {
                cylinder(d = boss_d, h = boss_h);
                translate([0, 0, r_plate_t - eps]) cylinder(d1 = boss_d + 2 * r_gusset, d2 = boss_d, h = r_gusset);
            }
            if (with_pins) for (p = pin_pos) translate(p) pin(true);
        }
        cutouts();
    }
}

// Thin frame that drops over the ORIGINAL part's back side. It is located
// by the two outer bosses only (close-fitting round hole at -x, close-fitting
// slot at +x), so it cannot slide; the other cut-outs are loose. Any edge
// of the original that shows outside this frame is a real difference.
module fit_check() {
    pin_c  = 2 * norm([pin_span / 2, pin_arm / 2]);
    ring   = 2.5;     // wall around each cut-out
    bar    = 4.0;     // connecting bar width
    rb_loc = boss_d / 2 + fc_loc_clr;
    function is_outer(p) = abs(p[0]) > 60;
    linear_extrude(fc_t) difference() {
        union() {
            difference() { outline2d(); offset(delta = -3) outline2d(); }
            slots2d(rim_wall + fc_clr + ring);
            for (p = hole_pos) translate(p) circle(d = boss_d + 2 * (fc_clr + ring));
            if (with_pins) for (p = pin_pos) translate(p) circle(d = pin_c + 2 * (fc_clr + ring));
            intersection() {
                outline2d();
                union() {
                    translate([-200, hole_pos[0][1] - bar / 2]) square([400, bar]);
                    translate([-slot_x, hole_pos[1][1] - bar / 2]) square([2 * slot_x, bar]);
                    translate([-bar / 2, -1]) square([bar, 100]);
                }
            }
        }
        slots2d(rim_wall + fc_clr);
        for (p = hole_pos) translate(p) {
            if (!is_outer(p)) circle(d = boss_d + 2 * fc_clr);
            else if (p[0] < 0) circle(r = rb_loc);
            else hull() for (dx = [-1.5, 1.5]) translate([dx, 0]) circle(r = rb_loc);
        }
        if (with_pins) for (p = pin_pos) translate(p) circle(d = pin_c + 2 * fc_clr);
    }
}

if (variant == "original")        body_original();
else if (variant == "reinforced") body_reinforced();
else if (variant == "fit_check")  fit_check();

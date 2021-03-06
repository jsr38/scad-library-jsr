// *************************************************************************
/*
This file is part of scad-library-jsr.

scad-library-jsr is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

scad-library-jsr is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with scad-library-jsr.  If not, see <http://www.gnu.org/licenses/>.
*/
// *************************************************************************


// TODO: convert to polyhole()
module screw_hole(radius, height, cs, cylinder_faces = 50) {

    cs_r = 2.0; // mm
    cs_h = 2.0; // mm

    union() {
        if (cs == true) {
            cylinder(r1 = radius, r2 = radius + cs_r, h = cs_h, center = true, $fn = cylinder_faces);
        }
        cylinder(r = radius, h = height, center = true, $fn = cylinder_faces);
    }

}


module screw_holes(pitch_length, pitch_width, pos_vec = "undef", radius, height, cs = false) {
 
    union() {
        if (pos_vec == "undef") {
            for (i = [0:1]) {
                for (j = [0:1]) {
                    translate([j * pitch_length, i * pitch_width, 0]) {
                        screw_hole(radius, height, cs);
                    }
                }
            }
        } else {
            for (i = pos_vec) {
                translate([i[0], i[1], 0]) {
                    screw_hole(radius, height, cs);
                }
            }
        }
    }
    
}
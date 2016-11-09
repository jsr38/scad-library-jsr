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
module iec_mains_inlet_cutout_2d(mains_inlet_width = 27.0,
                                mains_inlet_height = 19.0,
                                mains_inlet_rotation_angle = 0,
                                mains_inlet_mount_hole_pitch = 45.0) {
    // The mains inlet
    
    rotated_height = mains_inlet_height 
                        * cos(mains_inlet_rotation_angle)
                        + mains_inlet_width 
                        * sin(mains_inlet_rotation_angle);
    translate([0,
                (rotated_height) / 2
                    - mains_inlet_height * cos(mains_inlet_rotation_angle),
               0]) {
        rotate([0, 0, -mains_inlet_rotation_angle]) {
            union() {
                square([mains_inlet_width, mains_inlet_height]);
                translate([-(mains_inlet_mount_hole_pitch - mains_inlet_width)/2,
                            mains_inlet_height/2,
                            0])
                    circle(radius = 1.55);
                translate([(mains_inlet_mount_hole_pitch + mains_inlet_width)/2,
                            mains_inlet_height/2,
                            0])
                    cylinder(radius = 1.55);
            }
        }
    }
}

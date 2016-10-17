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
along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
*/
// *************************************************************************

module stand_off(r1 = 1.55, r2 = 2.95, h = 2.5) {
$fn = 50;
    
    difference() {
        cylinder(r2 = 2.95, h = 2.5);
        cylinder(r1 = 1.55, h = 2.5);
    }
}
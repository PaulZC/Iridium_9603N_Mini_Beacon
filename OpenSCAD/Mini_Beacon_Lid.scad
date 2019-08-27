// Simple Lid for the Iridium Mini Beacon Cover

$fn=90; // fragments
wall = 2.0; // cover wall thickness
thickness = 2.0; // lid end thickness
internal_width = 55.0; // internal width (X) of the cover
internal_depth = 30.0; // internal depth (Y) of the cover
gap = 0.3; // clearance gap (per side)
insert_height = 3.0; // extra height for the lid insert
internal_corner_radius = 1.0; // radius of the internal corner cylinder

sma_r = 3.75; // radius of the hole for the sma connector
sma_x_offset = -7.0; // X offset of the hole for the sma connector w.r.t. the X center of the void
sma_y_offset = 4.4; // y offset of the hole for the sma connector w.r.t. the Y center of the void
sma_wall_thickness = 3.0; // wall thickness around the SMA connectors

battery_support_width = 20.0; // Width (X) of the battery support
battery_support_depth = 2.0; // Depth (Y) of the battery support
battery_support_insertion = 9.0; // Insertion height (Z) from cover lip
battery_support_x_offset = 5.0;
battery_support_y_offset = -7.0;

if (gap > internal_corner_radius) echo("Error! Gap cannot be greater than the internal corner radius!");

width = internal_width + (2 * wall); // lid external width (X)
depth = internal_depth + (2 * wall); // lid external depth (Y)

total_height = wall + insert_height; // total height of the lid

sma_x = (width / 2) + sma_x_offset; // x position of the sma connector
sma_y = (depth / 2) + sma_y_offset; // y position of the sma connector

external_corner_radius = internal_corner_radius + wall; // external corner radius

module outer()
{
    translate([external_corner_radius, external_corner_radius, 0])
        minkowski() {
            cube([(width - (2 * external_corner_radius)), (depth - (2 * external_corner_radius)), (thickness / 2)]);
            cylinder(h=(thickness / 2), r=external_corner_radius);
        }
}

module inner()
// Thicker than required to avoid zero thickness joints
{
    translate([external_corner_radius, external_corner_radius, 0])
        minkowski() {
            cube([(width - (2 * external_corner_radius)), (depth - (2 * external_corner_radius)), (total_height / 2)]);
            cylinder(h=(total_height / 2), r=(internal_corner_radius - gap));
        }
}

module recess()
// Thicker than required to avoid zero thickness joints
{
    translate([(internal_corner_radius + wall + wall), (internal_corner_radius + wall + wall), sma_wall_thickness])
        minkowski() {
            cube([(width - (2 * (wall + wall + internal_corner_radius))), (depth - (2 * (wall + wall + internal_corner_radius))), (total_height / 2)]);
            cylinder(h=(total_height / 2), r=internal_corner_radius);
        }
}

module battery_support()
{
    translate([((width / 2) + battery_support_x_offset - (battery_support_width / 2)), ((depth / 2) + battery_support_y_offset - (battery_support_depth / 2)), 0]) {
        cube([battery_support_width, battery_support_depth, (battery_support_insertion + thickness)]);
    }
}

module lid()
{
    union() {
        outer();
        inner();
     }
}

module sma()
// Cylinder is taller than required to avoid zero thickness skins
{
    translate([sma_x, sma_y, -1]) {
        cylinder(h=(total_height + 2),r=sma_r);
    }
}

module pcb_slot()
// Cube is taller amd wider than required to avoid zero thickness skins
{
    translate([0, (sma_y - sma_r), sma_wall_thickness]) {
        cube([width, (sma_r * 2), total_height]);
    }
}

module finished_lid()
{
    union() {
        difference() {
            lid();
            sma();
            recess();
            pcb_slot();
        }
        battery_support();
    }
}

finished_lid();

$fn=10;

module drawer_air_hole(width,length,heighth){
	translate([width/2,length-5,heighth/2]){
		rotate([-90,0,0]){
			hull(){
				translate([0,heighth/4,0]){
					cylinder(h=10,d=20);
				}
				translate([0,-heighth/4,0]){
					cylinder(h=10,d=20);
				}
			}
		}
	}
}

module drawer_case_1(width, length, heighth){
	difference(){
		cube([width, length, heighth]);
		translate([(width*.05)/2,-.1,(heighth*.05)/2]){
			scale([1,1,.48]){
				cube([width-(width*.05),length-(length*.025)+.1,heighth-(heighth*.05)]);
				translate([0,0,heighth]){
					cube([width-(width*.05),length-(length*.025)+.1,heighth-(heighth*.05)]);
				}
			}
		}
	}
}

module drawer_case(width,length,heighth){
	difference(){
		drawer_case_1(width,length,heighth);
		drawer_air_hole(width,length,heighth);
	}

}

module drawer_shell(width, length, heighth){
	d_width = width-(width*.05);
	d_length = length-(length*.025)+.1;
	d_heighth = heighth-(heighth*.05);
	difference(){
		scale([1,1,.48]){
			cube([d_width, d_length, d_heighth]);
		}
		translate([(d_width*.05)/2,(d_length*.025),(d_heighth*.05)/2]){
			scale([.95,.95,.95]){
				cube([d_width, d_length,d_heighth*.48]);
			}
		}
	}
}

module drawer_handle(width,length,heighth){
	difference(){
		difference(){	
			cube([width*.25,length*.10,heighth*.30]);
			translate([width*.025,-.1,-.1]){
				cube([width*.20,length*.20,heighth*.25]);
			}
		}
		translate([-2,length*.10,0]){
			rotate([135,0,0]){
				cube([width,length*.15,heighth*.30]);
			}
		}
	}

}

module drawer(width,length,heighth){
	translate([0,10,0]){
		drawer_shell(width,length,heighth);
		translate([width*.35,-length*.10,heighth*.05]){
			drawer_handle(width,length,heighth);
		}
	}
}

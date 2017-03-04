use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib::abs qw(../../task2);

use Unit;
use Unit::Art;
use Unit::Plane;
use Unit::Ship;
use Unit::Tank;

use Weapon;
use Weapon::Cannon;
use Weapon::Missile;
use Weapon::Machinegun;
use Weapon::Torpedo;

require_ok( 'Unit' );
my $test_unit = Unit->new(
		name   => "Unit101",
		speed  => "200",
		health => "1000",
		armor  => "200",
);
ok($test_unit, "summon new unit");	
ok($test_unit->prepared, "unit prepares to battle automaticaly");
ok($test_unit->fly, "unit can fly");
ok($test_unit->sail, "unit can sail");	
ok($test_unit->ride, "unit can ride on ground");	
ok($test_unit->move, "unit can move");	

$test_unit->{speed} = 0;
ok(!$test_unit->sail, "unit can't sail with 0 speed");	
ok(!$test_unit->ride, "unit can't ride on ground with 0 speed");	
ok(!$test_unit->move, "unit can't move with 0 speed");	
ok(!$test_unit->fly, "unit with 0 speed can't fly, so it falls down and dies");

ok(!$test_unit->fly, "destroyed unit cantt fly");
ok(!$test_unit->sail, "destroyed unit can't sail");	
ok(!$test_unit->ride, "destroyed unit can't ride on ground");	
ok(!$test_unit->move, "destroyed unit can't move");	



require_ok( 'Unit::Art' );
my $test_art = Unit::Art->new(
		name   => "Unit102",
		speed  => "200",
		health => "1000",
		armor  => "200",
);
ok($test_art, "summot test art");
ok($test_art->prepared, "art prepares to battle automaticaly");
ok($test_art->move, "art can move");
ok($test_art->ride, "art can ride on ground");
ok(!$test_art->fly, "an attempt to make art fly causes its destruction");
$test_art->{health} = 500; 					# Let's make it back to life!
ok(!$test_art->sail, "an attempt to make art swim causes its destruction too");
ok(!$test_art->aim_cannon, "dead art can't aim");
ok(!$test_art->recharge_cannon, "dead art can't recharge");
ok(!$test_art->shoot_cannon, "and dead art can't shoot");



require_ok( 'Unit::Plane' );
my $test_plane = Unit::Plane->new(
		name   => "Unit103",
		speed  => "200",
		health => "1000",
		armor  => "200",
);
ok($test_plane, "summot test plane");
ok($test_plane->prepared, "plane prepares to battle automaticaly");
ok($test_plane->move, "plane can move");
ok($test_plane->fly, "plane can surely fly");
ok(!$test_plane->sail, "our type of plane can't swim");
$test_plane->{health} = 1000; 				 # Now we get our plane up from the bottom;
ok(!$test_plane->ride, "plane crashes on land");
$test_plane->{health} = 1000;  				 # Some more necromancy;
$test_plane->{speed} = 0;					 # Destroy it's engines;
ok(!$test_plane->move, "plane crashes without moving ability");
$test_plane->{health} = 1000;  				 # Some more necromancy;
ok(!$test_plane->fly, "plane crashes without moving ability anyway");
ok(!$test_plane->aim_machinegun, "dead plane can not aim");
ok(!$test_plane->aim_missile, "dead plane can not aim");
ok(!$test_plane->shoot_machinegun(50), "dead plane can not shoot");
ok(!$test_plane->shoot_missile, "dead plane can not shoot");
ok(!$test_plane->recharge_machinegun, "dead plane can not recharge");



require_ok( 'Unit::Ship' );
my $test_ship = Unit::Ship->new(
		name   => "Unit104",
		speed  => "200",
		health => "1000",
		armor  => "200",
);
ok($test_ship, "summon test ship");
ok($test_ship->prepared, "unit prepares to battle automaticaly");
ok($test_ship->move, "ship can move");
ok($test_ship->sail, "ship can move on water");
ok(!$test_ship->ride, "ship crashes on land");
$test_ship->{health} = 500; 				# Some repair;
ok(!$test_ship->fly, "sea ships can't fly, except flying dutchman, but this is not the case");
ok(!$test_ship->aim_cannon, "dead ship can't aim");
ok(!$test_ship->aim_torpedo, "dead ship can not aim");
ok(!$test_ship->recharge_cannon, "dead ship can't recharge");
ok(!$test_ship->shoot_cannon, "dead ship can't shoot");
ok(!$test_ship->shoot_torpedo, "dead ship can not shoot, captain Jack Sparrow");



require_ok( 'Unit::Tank' );
my $test_tank = Unit::Tank->new(
		name   => "Unit105",
		speed  => "200",
		health => "1000",
		armor  => "200",
);
ok($test_tank, "summon test tank");
ok($test_tank->prepared, "tank prepares to battle automaticaly");
ok($test_tank->move, "tank can move");
ok($test_tank->ride, "tank can ride on ground");
ok(!$test_tank->sail, "tank can not swim");
$test_tank->{health} = 2000; 			  # Looks even better than before!
ok(!$test_tank->fly, "tank can not fly");
ok(!$test_tank->aim_cannon, "dead tank can't aim");
ok(!$test_tank->recharge_cannon, "dead tank can't recharge");
ok(!$test_tank->shoot_cannon, "and dead tank can't shoot");
ok(!$test_tank->aim_machinegun, "dead tank can not aim");
ok(!$test_tank->shoot_machinegun(50), "dead tank can not shoot");
ok(!$test_tank->recharge_machinegun, "dead tank can not recharge");



done_testing();
1;
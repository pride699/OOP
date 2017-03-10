use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib::abs qw(../../../task2);

use Unit;
use Unit::Plane;

use Weapon;
use Weapon::Missile;
use Weapon::Machinegun;


require_ok( 'Unit::Plane' );
require_ok( 'Weapon::Machinegun' );
require_ok( 'Weapon::Missile' );

my $beta_test_plane = Unit::Plane->new( name => "Unit103b");
my $test_plane = Unit::Plane->new(
		name   => "Unit103",
		speed  => "200",
		health => "1000",
		armor  => "200",
);

ok($test_plane, "summot test plane");
ok($beta_test_plane, "summot test plane with default fields");

isa_ok($beta_test_plane, 'Unit::Plane', "is it realy plane");
isa_ok($test_plane, 'Unit::Plane', "is it realy plane");
isa_ok($test_plane->weapon1, 'Weapon::Machinegun', "plane's weapon 1 is realy a Machinegun");
isa_ok($test_plane->weapon2, 'Weapon::Missile', "plane's weapon 2 is realy a Missile");

is($test_plane->name, 'Unit103', "check actual name field");
is($test_plane->speed, '200', "check actual speed field");
is($test_plane->health, '1000', "check actual health field");
is($test_plane->armor, '200', "check actual armor field");

 ### "plane realy can do all battle plane things"
can_ok($test_plane, qw(move ride fly sail aim_missile shoot_missile 
	aim_machinegun recharge_machinegun shoot_machinegun prepare take_damage));

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

done_testing();
1;
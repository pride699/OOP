use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib::abs qw(../../../task2);

use Unit;
use Unit::Ship;

use Weapon;
use Weapon::Cannon;
use Weapon::Torpedo;

require_ok( 'Unit::Ship' );
require_ok( 'Weapon::Cannon' );
require_ok( 'Weapon::Torpedo' );

my $beta_test_ship = Unit::Ship->new( name => "Unit104b",);
my $test_ship = Unit::Ship->new(
		name   => "Unit104",
		speed  => "200",
		health => "1000",
		armor  => "200",
);
ok($test_ship, "summon test ship");
ok($beta_test_ship, "summon test ship with default stats");

isa_ok($beta_test_ship, 'Unit::Ship', "is it realy ship");
isa_ok($test_ship, 'Unit::Ship', "is it realy ship");
isa_ok($test_ship->weapon1, 'Weapon::Cannon', "ship's weapon 1 is realy a Cannon");
isa_ok($test_ship->weapon2, 'Weapon::Torpedo', "ship's weapon 2 is realy a Torpedo");

is($test_ship->name, 'Unit104', "check actual name field");
is($test_ship->speed, '200', "check actual speed field");
is($test_ship->health, '1000', "check actual health field");
is($test_ship->armor, '200', "check actual armor field");

 ### "plane realy can do all battle plane things"
can_ok($test_ship, qw(move ride fly sail aim_torpedo shoot_torpedo 
	aim_cannon recharge_cannon shoot_cannon prepare take_damage));


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


done_testing();
1;
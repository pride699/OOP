use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib::abs qw(../../../task2);

use Unit;
use Unit::Tank;

use Weapon;
use Weapon::Cannon;
use Weapon::Machinegun;


require_ok( 'Unit::Tank' );
require_ok( 'Weapon::Cannon' );
require_ok( 'Weapon::Machinegun' );

my $beta_test_tank = Unit::Tank->new(name => "Unit105b",);
my $test_tank = Unit::Tank->new(
		name   => "Unit105",
		speed  => "200",
		health => "1000",
		armor  => "200",
);
ok($beta_test_tank, "summon test tank with default fields");
ok($test_tank, "summon test tank");

isa_ok($beta_test_tank, 'Unit::Tank', "is it realy tank");
isa_ok($test_tank, 'Unit::Tank', "is it realy tank");
isa_ok($test_tank->weapon1, 'Weapon::Machinegun', "tank's weapon 1 is realy a Machinegun");
isa_ok($test_tank->weapon2, 'Weapon::Cannon', "tank's weapon 2 is realy a Cannon");

is($test_tank->name, 'Unit105', "check actual name field");
is($test_tank->speed, '200', "check actual speed field");
is($test_tank->health, '1000', "check actual health field");
is($test_tank->armor, '200', "check actual armor field");

 ### "tank realy can do all battle tank things"
can_ok($test_tank, qw(move ride fly sail aim_cannon recharge_cannon shoot_cannon 
	aim_machinegun recharge_machinegun shoot_machinegun prepare take_damage));

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
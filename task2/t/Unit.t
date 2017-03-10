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

my $beta_test_unit = Unit->new( name => "Unit101b");
my $test_unit = Unit->new(
		name   => "Unit101",
		speed  => "200",
		health => "1000",
		armor  => "200",
);
ok($test_unit, "summon new unit");	
ok($beta_test_unit, "summon new unit with default stats");	
isa_ok($test_unit, 'Unit', "test unit is realy Unit");
isa_ok($beta_test_unit, 'Unit', "test unit is realy Unit");

is($test_unit->name, 'Unit101', "check actual name field");
is($test_unit->speed, '200', "check actual speed field");
is($test_unit->health, '1000', "check actual health field");
is($test_unit->armor, '200', "check actual armor field");

 ### "unit realy can do all basic battle unit things"
can_ok($test_unit, qw(move ride fly sail  prepare take_damage));


ok($test_unit->prepared, "unit prepares to battle automaticaly");
ok($test_unit->move, "unit can move");	
ok(!$test_unit->fly, "abstract unit can't fly");
ok(!$test_unit->sail, "abstract unit can't sail");	
ok(!$test_unit->ride, "abstract unit can't ride on ground");	

$test_unit->{speed} = 0;
ok(!$test_unit->sail, "unit can't sail with 0 speed");	
ok(!$test_unit->ride, "unit can't ride on ground with 0 speed");	
ok(!$test_unit->move, "unit can't move with 0 speed");	
ok(!$test_unit->fly, "unit with 0 speed can't fly, so it falls down and dies");

ok(!$test_unit->fly, "destroyed unit cantt fly");
ok(!$test_unit->sail, "destroyed unit can't sail");	
ok(!$test_unit->ride, "destroyed unit can't ride on ground");	
ok(!$test_unit->move, "destroyed unit can't move");	


##### 2nd argument "1" in take_damage(200,1) was added to manualy simulate crit strike.
##### It is calculated randomly if empty, rand(10), where "9" executes crit damage scenario
$test_unit->{health} = 1000;		#because unit was destroyed previously
$test_unit->take_damage(200,1);
is($test_unit->health, '800', "health correctly decreases after taking damage");
$test_unit->{health} = 0;			#Let's shoot dead unit
$test_unit->take_damage(200);
is($test_unit->health, '0', "health can't fall below 0");

$test_unit->{health} = 1000;		#because unit was destroyed previously
$test_unit->take_damage(200,9);		#Here goes crit! "9"
is($test_unit->health, '0', "unit suffers critical damage and dies in certain conditions");

done_testing();
1;
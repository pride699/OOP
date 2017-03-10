use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib::abs qw(../../../task2);

use Unit;
use Unit::Art;

use Weapon;
use Weapon::Cannon;

require_ok( 'Unit::Art' );
require_ok( 'Weapon::Cannon' );
my $beta_test_art = Unit::Art->new(name => "Unit102b",);
my $test_art = Unit::Art->new(
		name   => "Unit102",
		speed  => "200",
		health => "1000",
		armor  => "200",
);
ok($beta_test_art, "summon test art with default fields");
ok($test_art, "summon test art");

isa_ok($beta_test_art, 'Unit::Art', "is it realy art");
isa_ok($test_art, 'Unit::Art', "is it realy art");
isa_ok($test_art->weapon1, 'Weapon::Cannon', "art's weapon is realy a Cannon");

is($test_art->name, 'Unit102', "check actual name field");
is($test_art->speed, '200', "check actual speed field");
is($test_art->health, '1000', "check actual health field");
is($test_art->armor, '200', "check actual armor field");

 ### "art realy can do all battle art things"
can_ok($test_art, qw(move ride fly sail aim_cannon recharge_cannon shoot_cannon prepare take_damage));

ok($test_art->prepared, "art prepares to battle automaticaly");
ok($test_art->move, "art can move");
ok($test_art->ride, "art can ride on ground");
ok(!$test_art->fly, "an attempt to make art fly causes its destruction");
$test_art->{health} = 500; 					# Let's make it back to life!
ok(!$test_art->sail, "an attempt to make art swim causes its destruction too");
ok(!$test_art->aim_cannon, "dead art can't aim");
ok(!$test_art->recharge_cannon, "dead art can't recharge");
ok(!$test_art->shoot_cannon, "and dead art can't shoot");

done_testing();
1;
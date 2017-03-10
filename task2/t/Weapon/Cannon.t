use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib::abs qw(../../../task2);
use Weapon;
use Weapon::Cannon;

require_ok('Weapon::Cannon');

my $beta_test_cannon = Weapon::Cannon->new;
my $test_cannon = Weapon::Cannon->new( ammo => 100,);

ok( $test_cannon, "create test Cannon ");
ok( $beta_test_cannon, "create test Cannon with default ammo");

isa_ok($beta_test_cannon, 'Weapon::Cannon', "is it realy Cannon");
isa_ok($test_cannon, 'Weapon::Cannon', "is it realy Cannon");

is($test_cannon->ammo, '100', "check actual ammo");
is($test_cannon->aimed, '0', "cannon is unaimed");
is($test_cannon->charged, '0', "cannon is uncharged");

##cannon can do all what it's expected to
can_ok($test_cannon, qw(aim shoot recharge));

$test_cannon->recharge;
is($test_cannon->ammo, '99', "ammo amount correctly decreases after recharge");
is($test_cannon->charged, '1', "cannon correctly charges after recharge");
ok(!$test_cannon->shoot, "cannon can not shoot unaimed");


$test_cannon->aim;
ok($test_cannon->shoot, "cannon can shoot aimed");
is($test_cannon->charged, '0', "cannon correctly loses charge after shooting");


$test_cannon->{ammo} = 0;
ok( !$test_cannon->recharge, "cannon can't recharge without ammo" );
ok( !$test_cannon->shoot, "cannon can't shoot without ammo");

done_testing();
1;
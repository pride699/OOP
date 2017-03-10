use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib::abs qw(../../../task2);
use Weapon;
use Weapon::Machinegun;


require_ok('Weapon::Machinegun');

my $beta_test_machinegun = Weapon::Machinegun->new;
my $test_machinegun = Weapon::Machinegun->new( ammo => "5000", 
									  belt_capacity => "250",);

ok( $test_machinegun, "create test machinegun ");
ok( $beta_test_machinegun, "create test machinegun with default stats");

isa_ok($beta_test_machinegun, 'Weapon::Machinegun', "is it realy machinegun");
isa_ok($test_machinegun, 'Weapon::Machinegun', "is it realy machinegun");

is($test_machinegun->ammo, '5000', "check actual ammo");
is($test_machinegun->belt_capacity, '250', "check actual belt_capacity");
is($test_machinegun->aimed, '0', "machinegun is unaimed");
is($test_machinegun->belt_charge, '0', "machinegun is uncharged");

##machinegun can do all what it's expected to
can_ok($test_machinegun, qw(aim shoot recharge));

##usual aim, recharge and shoot issues
ok (!$test_machinegun->shoot(50), "attempt to shoot unaimed, uncharged");
ok ($test_machinegun->aim, "aim test machinegun");
ok (!$test_machinegun->shoot(50), "attempt to shoot aimed, uncharged");
ok ($test_machinegun->recharge, "recharge test machinegun");
is($test_machinegun->ammo, '4750', "ammo amount correctly decreases after recharge");
ok (!$test_machinegun->shoot(600), "attempt to shoot more than belt capacity at once");
$test_machinegun->{ammo} = 0;
ok ($test_machinegun->shoot(250), "shoot test machinegun");
ok (!$test_machinegun->recharge, "attempt to recharge without ammo");

##additional recharge issues
$test_machinegun->{ammo} = 5000;
$test_machinegun->{belt_charge} = 150;   #belt is no fully loaded
$test_machinegun->recharge;
is($test_machinegun->ammo, '4900', "recharge took only 100 ammo from main amount, not 250");
is($test_machinegun->belt_charge, '250', "belt is correctly charged on full capacity - 250");


$test_machinegun->{ammo} = 30;			 #ammo amount is not enough to make full recharge
$test_machinegun->{belt_charge} = 150;   #belt is no fully loaded
$test_machinegun->recharge;
is($test_machinegun->ammo, '0', "recharge took only exicting 30 ammo from main amount with low ammo warning, not 100 as before");
is($test_machinegun->belt_charge, '180', "belt is correctly charged on remaining 30 ammo");


done_testing();
1;
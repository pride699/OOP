use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib::abs qw(../../task2);
use Weapon;
use Weapon::Cannon;
use Weapon::Missile;
use Weapon::Machinegun;
use Weapon::Torpedo;


require_ok( 'Weapon' );
my $test_weapon = Weapon->new;
ok( $test_weapon, "create test Weapon ");

require_ok('Weapon::Cannon');
my $test_cannon = Weapon::Cannon->new;
ok( $test_cannon, "create test Cannon ");
$test_cannon->{ammo} = 0;
$test_cannon->{aimed} = 0;
ok( !$test_cannon->recharge, "recharge without ammo" );

require_ok('Weapon::Machinegun');
my $test_machinegun = Weapon::Machinegun->new;
ok ($test_machinegun, "create test machinegun");
ok (!$test_machinegun->shoot(50), "attempt to shoot unaimed, uncharged");
ok ($test_machinegun->aim, "aim test machinegun");
ok (!$test_machinegun->shoot(50), "attempt to shoot aimed, uncharged");
ok ($test_machinegun->recharge, "recharge test machinegun");
ok (!$test_machinegun->shoot(600), "attempt to shoot more than belt capacity at once");
$test_machinegun->{ammo} = 0;
ok ($test_machinegun->shoot(60), "shoot test machinegun");
ok (!$test_machinegun->recharge, "attempt to recharge without ammo");

require_ok('Weapon::Missile');
my $test_missile = Weapon::Missile->new;
ok ($test_missile, "create test missile");
ok (!$test_missile->shoot, "shoot unaimed");
ok ($test_missile->aim, "aim test missile");
ok ($test_missile->shoot, "shoot test missile");
$test_missile->{ammo} = 0;
ok (!$test_missile->shoot, "shoot test missile with empty bay");

require_ok('Weapon::Torpedo');
my $test_torpedo = Weapon::Torpedo->new;
ok ($test_torpedo, "create test torpedo");
ok (!$test_torpedo->shoot, "shoot unaimed");
ok ($test_torpedo->aim, "aim test torpedo");
ok ($test_torpedo->shoot, "shoot test torpedo");
$test_torpedo->{ammo} = 0;
ok (!$test_torpedo->shoot, "shoot test torpedo with empty bay");


















done_testing();

1;
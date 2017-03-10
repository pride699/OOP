use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib::abs qw(../../../task2);
use Weapon;
use Weapon::Missile;

require_ok('Weapon::Missile');

my $beta_test_missile = Weapon::Missile->new;
my $test_missile = Weapon::Missile->new( ammo => 500,);

ok( $test_missile, "create test missile ");
ok( $beta_test_missile, "create test missile with default ammo");

isa_ok($beta_test_missile, 'Weapon::Missile', "is it realy missile");
isa_ok($test_missile, 'Weapon::Missile', "is it realy missile");

is($test_missile->ammo, '500', "check actual ammo");
is($test_missile->aimed, '0', "missile is unaimed");

##missile can do all what it's expected to
can_ok($test_missile, qw(aim shoot));

ok (!$test_missile->shoot, "shoot unaimed");
ok ($test_missile->aim, "aim test missile");
ok ($test_missile->shoot, "shoot test missile");
is($test_missile->ammo, '499', "ammo amount correctly decreaes after shoot");

$test_missile->{ammo} = 0;
ok (!$test_missile->shoot, "shoot test missile with empty bay");

done_testing();
1;
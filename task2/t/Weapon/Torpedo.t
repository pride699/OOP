use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib::abs qw(../../../task2);
use Weapon;
use Weapon::Torpedo;

require_ok('Weapon::Torpedo');

my $beta_test_torpedo = Weapon::Torpedo->new;
my $test_torpedo = Weapon::Torpedo->new( ammo => 500,);

ok( $test_torpedo, "create test torpedo ");
ok( $beta_test_torpedo, "create test torpedo with default ammo");

isa_ok($beta_test_torpedo, 'Weapon::Torpedo', "is it realy torpedo");
isa_ok($test_torpedo, 'Weapon::Torpedo', "is it realy torpedo");

is($test_torpedo->ammo, '500', "check actual ammo");
is($test_torpedo->aimed, '0', "torpedo is unaimed");

##torpedo can do all what it's expected to
can_ok($test_torpedo, qw(aim shoot));

ok (!$test_torpedo->shoot, "shoot unaimed");
ok ($test_torpedo->aim, "aim test torpedo");
ok ($test_torpedo->shoot, "shoot test torpedo");
is($test_torpedo->ammo, '499', "ammo amount correctly decreaes after shoot");

$test_torpedo->{ammo} = 0;
ok (!$test_torpedo->shoot, "shoot test torpedo with empty bay");

done_testing();
1;
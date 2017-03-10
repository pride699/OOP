use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib::abs qw(../../task2);
use Weapon;



require_ok( 'Weapon' );
my $test_weapon = Weapon->new;
ok( $test_weapon, "create test Weapon ");
isa_ok($test_weapon, 'Weapon', test_weapon is realy a Weapon);

done_testing();

1;
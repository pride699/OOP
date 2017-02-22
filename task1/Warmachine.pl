use Unit;
use Data::Dumper;

#making various units to test data validation and output
my $captain = Unit->new();

$captain->name("James Kirk");
$captain->rank("Captain");
$captain->spec("Commander");
$captain->duty_time("900");
$captain->vehicle("Enterprise");

print Dumper $captain;

my $hero = Unit->new();

$hero->name("Akhmed");
$hero->rank("699");
$hero->spec("suicide bomber");
$hero->duty_time("we serve forever!");
$hero->vehicle("Toyota Land Cruiser");

print Dumper $hero;

my $droid = Unit->new();
$droid->name("R2-D2");
$droid->rank(":*** :-)"); 

print Dumper $droid;

print Dumper $hero->spec;
print Dumper $hero->duty_time;
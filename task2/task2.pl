use Moose;
use Weapons::Weapon;
use Units::Tank;
use Units::Ship;
use Units::Art;
use Units::Plane;
use Data::Dumper;

my $abrams = Units::Tank->new(
	name   => 'Abrams',
	speed  => '100',
	armor  => '50',
	health => '4000',
);

my $flying_dutchman = Units::Ship->new(
	name   => 'Flying Dutchman',
	speed  => '1000',
	armor  => '500',
	health => '2500',
);

my $satan = Units::Art->new(
	name   => 'Satan',
	speed  => '50',
	armor  => '50',
	health => '1800',
);

my $stealth = Units::Plane->new(
	name   => 'Stealth',
	speed  => '8000',
	armor  => '200',
	health => '2000',
);

$flying_dutchman->prepare;
$flying_dutchman->move;
$flying_dutchman->take_damage(1500);
$flying_dutchman->move;
$flying_dutchman->weapon2->aim;
$flying_dutchman->weapon2->shoot;





















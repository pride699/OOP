use Moose;
use Weapons::Weapon;
use Units::Unit;
use Units::Unit::Tank;
use Units::Unit::Ship;
use Units::Unit::Art;
use Units::Unit::Plane;
use Data::Dumper;

my $abrams = Units::Unit::Tank->new(
	name   => 'Abrams',
	speed  => '100',
	armor  => '50',
	health => '4000',
);

my $flying_dutchman = Units::Unit::Ship->new(
	name   => 'Flying Dutchman',
	speed  => '1000',
	armor  => '500',
	health => '2500',
);

my $satan = Units::Unit::Art->new(
	name   => 'Satan',
	speed  => '50',
	armor  => '50',
	health => '1800',
);

my $stealth = Units::Unit::Plane->new(
	name   => 'Stealth',
	speed  => '8000',
	armor  => '200',
	health => '2000',
);

$flying_dutchman->prepare;
$flying_dutchman->move;
$flying_dutchman->take_damage(40);
$flying_dutchman->move;
$flying_dutchman->move;
$flying_dutchman->move;
$flying_dutchman->move;

$flying_dutchman->weapon2->aim;
$flying_dutchman->weapon2->shoot;

$flying_dutchman->Units::Unit::Tank::roll;

$flying_dutchman->move;
$flying_dutchman->move;

$abrams->prepare;
$abrams->weapon1->aim;
$abrams->recharge_mg;
$abrams->shoot_mg(50);
$abrams->take_damage(4200);
$abrams->weapon1->aim;

$abrams->shoot_mg(50);


























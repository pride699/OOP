use Moose;
use Weapon;
use Unit;
use Unit::Tank;
use Unit::Ship;
use Unit::Plane;
use Unit::Art;
use Data::Dumper;

my $abrams = Unit::Tank->new(
	name   => 'Abrams',
	speed  => '100',
	armor  => '50',
	health => '4000',
);

my $flying_dutchman = Unit::Ship->new(
	name   => 'Flying Dutchman',
	speed  => '1000',
	armor  => '500',
	health => '2500',
);

my $satan = Unit::Art->new(
	name   => 'Satan',
	speed  => '50',
	armor  => '50',
	health => '1800',
);

my $stealth = Unit::Plane->new(
	name   => 'Stealth',
	speed  => '800',
	armor  => '200',
	health => '2000',
);

# $flying_dutchman->prepare;
# $flying_dutchman->move;
# $flying_dutchman->take_damage(40);
# $flying_dutchman->move;
# $flying_dutchman->move;
# $flying_dutchman->move;
# $flying_dutchman->move;

# $flying_dutchman->weapon2->aim;
# $flying_dutchman->weapon2->shoot;

# $flying_dutchman->Units::Unit::Tank::roll;

# $flying_dutchman->move;
# $flying_dutchman->move;

$abrams->prepare;
$abrams->aim_mg;
$abrams->recharge_mg;
$abrams->shoot_mg(50);
$abrams->move;
$abrams->weapon1->aim;

$abrams->shoot_mg(50);
# $abrams->take_damage(200);
$abrams->move;
$abrams->shoot_cannon;
$abrams->aim_cannon;
$abrams->shoot_cannon;
$abrams->recharge_cannon;
$abrams->shoot_cannon;
$abrams->Unit::Plane::move;
$abrams->move;



# $abrams->Unit::Ship::move;
# $abrams->move;

# $stealth->prepare;
# $stealth->move;
# $stealth->take_damage(500);
# # $stealth->take_damage(500);
# # $stealth->Unit::Ship::move;
# $stealth->move;




























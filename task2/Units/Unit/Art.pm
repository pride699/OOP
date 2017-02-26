package Units::Unit::Art;

use Moose;
use Weapons::Weapon::Cannon;

extends 'Units::Unit';


has 'weapon1' => (
	is => 'ro',
	isa => 'Weapons::Weapon',
	builder => '_install_w1',
	handles => {
		recharge_cannon => 'recharge',
		shoot_cannon    => 'shoot',
	},
);

sub _install_w1 {
	my $weapon1 = Weapons::Weapon::Cannon->new( ammo => '50' );
	return $weapon1;
}


after 'prepare' => sub {
	my $self = shift;

	print ("In position! Weapons online!\n");
 
	return $self->prepared(1);
};

 sub move {
	my $self = shift;

	if ( $self->check_status == 0) {
		return;
	};
	if ( $self->prepared == 0) {
		print ("We are not prepared for battle! \n");
		return;
	};
	if ( $self->speed <= 0) {
		print ("We are immobilized\n");
		return;
	};
	if ( $self->isa('Units::Unit::Ship')) {
		print ("Oh no! It's ground!\n");
		$self->health(0);
		return;
	};
	if ( $self->isa('Units::Unit::Plane')) {
		print ("Oh no! It's ground!\n");
		$self->health(0);
		return;
	};
	print ("Changing position!\n");
};


1;
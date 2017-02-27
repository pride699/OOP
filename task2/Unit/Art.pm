package Unit::Art;

use Moose;
use Weapon::Cannon;

extends 'Unit';


has 'weapon1' => (
	is => 'ro',
	isa => 'Weapon',
	builder => '_install_w1',
	handles => {
		recharge_cannon => 'recharge',
		shoot_cannon    => 'shoot',
	},
);

sub _install_w1 {
	my $weapon1 = Weapon::Cannon->new( ammo => '50' );
	return $weapon1;
}


after 'prepare' => sub {
	my $self = shift;

	print ("In position! Weapons online!\n");
 
	return $self->prepared(1);
};

 sub move {
	my $self = shift;

	# if ( $self->check_status == 0) {
	# 	return;
	# };
	# if ( $self->prepared == 0) {
	# 	print ("We are not prepared for battle! \n");
	# 	return;
	# };
	# if ( $self->speed <= 0) {
	# 	print ("We are immobilized\n");
	# 	return;
	# };
	return if !$self->SUPER::move; 

	if ( $self->isa('Unit::Ship')) {
		print ("Oh no! It's ground!\n");
		$self->health(0);
		return;
	};
	if ( $self->isa('Unit::Plane')) {
		print ("Oh no! It's ground!\n");
		$self->health(0);
		return;
	};
	print ("Changing position!\n");
};


1;
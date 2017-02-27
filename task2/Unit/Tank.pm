package Unit::Tank;


use Moose;
use Weapon::Machinegun;
use Weapon::Cannon;

extends 'Unit';

has 'weapon1' => (
	is => 'ro',
	isa => 'Weapon::Machinegun',
	builder => '_install_w1',
	handles => {
		recharge_mg => 'recharge',
		shoot_mg    => 'shoot',
	},
);

has 'weapon2' => (
	is => 'ro',
	isa => 'Weapon::Cannon',
	builder => '_install_w2',
	handles => {
		recharge_cannon => 'recharge',
		shoot_cannon    => 'shoot',
	},
);

sub _install_w1 {
	my $weapon1 = Weapon::Machinegun->new( ammo => '5000', belt_capacity => '100' );
	return $weapon1;
}

sub _install_w2 {
	my $weapon2 = Weapon::Cannon->new( ammo => '50' );
	return $weapon2;
}


after 'prepare' => sub {
	my $self = shift;

	print ("Forward!\n");
	
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
	print ("Lets roll!\n");
}


1;
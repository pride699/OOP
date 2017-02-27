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
		aim_mg		=> 'aim',
	},
);

has 'weapon2' => (
	is => 'ro',
	isa => 'Weapon::Cannon',
	builder => '_install_w2',
	handles => {
		recharge_cannon => 'recharge',
		shoot_cannon    => 'shoot',
		aim_cannon		=> 'aim',
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

	return if !$self->SUPER::move; 
	
	foreach ( qw/Ship Plane/ ) {
		if ( $self->isa("Unit::$_") ) {
			print ("Oh no! It's ground!\n");
		$self->health(0);
		return;
		};
	};

	print ("Lets roll!\n");
}


1;
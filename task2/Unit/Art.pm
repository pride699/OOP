package Unit::Art;

use Moose;
use Weapon::Cannon;

extends 'Unit';


has 'weapon1' => (
	is => 'ro',
	isa => 'Weapon::Cannon',
	builder => '_install_w1',
	handles => {
		recharge_cannon => 'recharge',
		shoot_cannon    => 'shoot',
		aim_cannon		=> 'aim',

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

	return if !$self->SUPER::move; 

	foreach ( qw/Ship Plane/ ) {
		if ( $self->isa("Unit::$_") ) {
			print ("Oh no! It's ground!\n");
		$self->health(0);
		return;
		};
	};

	print ("Changing position!\n");
};


1;
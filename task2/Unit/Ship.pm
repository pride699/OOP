package Unit::Ship;

use Moose;
use Weapon::Cannon;
use Weapon::Torpedo;

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

has 'weapon2' => (
	is => 'ro',
	isa => 'Weapon::Torpedo',
	builder => '_install_w2',
	handles => {
		shoot_torpedo  => 'shoot',
		aim_torpedo	   => 'aim',

	},
);

sub _install_w1 {
	my $weapon1 = Weapon::Cannon->new( ammo => '200' );
	return $weapon1;
}

sub _install_w2 {
	my $weapon2 = Weapon::Torpedo->new( ammo => '50' );
	return $weapon2;
}

after 'prepare' => sub {
	my $self = shift;

	print ("Fair wind!\n");
	
	return $self->prepared(1);
};

sub move {
	my $self = shift;
	
	return if !$self->SUPER::move; 
	
	foreach ( qw/Tank Plane Art/ ) {
		if ( $self->isa("Unit::$_") ) {
			print ("We are drowning!\n");
		$self->health(0);
		return;
		};
	};

	print ("Fair wind!\n");
};


1;
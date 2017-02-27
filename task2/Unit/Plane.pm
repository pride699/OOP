package Unit::Plane;

use Moose;
use Weapon::Machinegun;
use Weapon::Missle;

extends 'Unit';

has 'weapon1' => (
	is => 'ro',
	isa => 'Weapon',
	builder => '_install_w1',
	handles => {
		recharge_mg => 'recharge',
		shoot_mg    => 'shoot',
		aim_mg		=> 'aim',
	},
);

has 'weapon2' => (
	is => 'ro',
	isa => 'Weapon',
	builder => '_install_w2',
	handles => {
		shoot_missle    => 'shoot',
		aim_missle		=> 'aim',

	},
);

sub _install_w1 {
	my $weapon1 = Weapon::Machinegun->new( ammo => '7000', belt_capacity => '300' );
	return $weapon1;
}

sub _install_w2 {
	my $weapon2 = Weapon::Missle->new( ammo => '20' );
	return $weapon2;
}

after 'prepare' => sub {
	my $self = shift;

	print ("Up to the sky!\n");
	
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
	if ( $self->speed <= 0 ) {
		print ("Our engines are destroyed!\n");
		$self->health(0);
		return;
	};
	
	foreach ( qw/Tank Ship Art/ ) {
		if ( $self->isa("Unit::$_") ) {
			print ("It seems we are blown up!\n");
		$self->health(0);
		return;
		};
	};
	
	print ("Yay! Reminds me of PERL Harbor!\n");
};


1;
package Units::Unit::Plane;

use Moose;
use Weapons::Weapon::Machinegun;
use Weapons::Weapon::Missle;

extends 'Units::Unit';

has 'weapon1' => (
	is => 'ro',
	isa => 'Weapons::Weapon',
	builder => '_install_w1',
	handles => {
		recharge_mg => 'recharge',
		shoot_mg    => 'shoot',
	},
);

has 'weapon2' => (
	is => 'ro',
	isa => 'Weapons::Weapon',
	builder => '_install_w2',
	handles => {
		shoot_missle    => 'shoot',
	},
);

sub _install_w1 {
	my $weapon1 = Weapons::Weapon::Machinegun->new( ammo => '7000', belt_capacity => '300' );
	return $weapon1;
}

sub _install_w2 {
	my $weapon2 = Weapons::Weapon::Missle->new( ammo => '20' );
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
	if ( $self->isa('Units::Unit::Tank')) {
		print ("It seems we are blown up!\n");
		$self->health(0);
		return;
	};
	if ( $self->isa('Units::Unit::Ship')) {
		print ("It seems we are blown up!\n");
		$self->health(0);
		return;
	};
	if ( $self->isa('Units::Unit::Art')) {
		print ("It seems we are blown up!\n");
		$self->health(0);
		return;
	};
	
	print ("Yay! Reminds me of PERL Harbor!\n");
};


1;
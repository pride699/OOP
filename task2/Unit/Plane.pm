package Unit::Plane;

use Moose;
use Weapon::Machinegun;
use Weapon::Missile;

extends 'Unit';

has 'weapon1' => (
	is => 'ro',
	isa => 'Weapon::Machinegun',
	builder => '_install_w1',
	handles => {
		_recharge_machinegun => 'recharge',
		_shoot_machinegun    => 'shoot',
		_aim_machinegun		 => 'aim',
	},
);

has 'weapon2' => (
	is => 'ro',
	isa => 'Weapon::Missile',
	builder => '_install_w2',
	handles => {
		_shoot_missile  => 'shoot',
		_aim_missile	=> 'aim',

	},
);

sub _install_w1 {
	my $weapon1 = Weapon::Machinegun->new( ammo => '7000', belt_capacity => '300' );
	return $weapon1;
}

sub _install_w2 {
	my $weapon2 = Weapon::Missile->new( ammo => '20' );
	return $weapon2;
}

after 'prepare' => sub {
	my $self = shift;

	print ("Up to the sky!\n");
	
	return $self->prepared(1);
};

sub move {
	my $self = shift;
	
	if ( $self->check_health == 0) {
		return 0;
	};
	
	if ( $self->speed <= 0 ) {
		print ("Our engines are destroyed!\n");
		$self->health(0);
		return 0;
	};
	
	print ("Yay! Reminds me of PERL Harbor!\n");
	return 1;
};

sub ride {
	my $self = shift;

	return if !$self->Unit::move; 

	print ("We are falling!\n");
	$self->health(0);
	return 0;
}

sub sail {
	my $self = shift;
	
	return if !$self->Unit::move; 
	
	print ("We are drowning!\n");
	$self->health(0);
	return 0;

}

sub shoot_machinegun {
	my $self = shift;
	return if ( !$self->check_health );
	$self->_shoot_machinegun;
}

sub aim_machinegun {
	my $self = shift;
	return if ( !$self->check_health );
	$self->_aim_machinegun;
}

sub recharge_machinegun {
	my $self = shift;
	return if ( !$self->check_health );
	$self->_recharge_machinegun;
}

sub shoot_missile {
	my $self = shift;
	return if ( !$self->check_health );
	$self->_shoot_missile;
}

sub aim_missile{
	my $self = shift;
	return if ( !$self->check_health );
	$self->_aim_missile;
}


1;
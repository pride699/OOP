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
		_recharge_cannon => 'recharge',
		_shoot_cannon    => 'shoot',
		_aim_cannon		 => 'aim',

	},
);

has 'weapon2' => (
	is => 'ro',
	isa => 'Weapon::Torpedo',
	builder => '_install_w2',
	handles => {
		_shoot_torpedo  => 'shoot',
		_aim_torpedo	=> 'aim',

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

	print ("Pull the anchor!\n");
	
	return $self->prepared(1);
};

sub move {
	my $self = shift;
	
	return if !$self->SUPER::move; 
	
	print ("Fair wind!\n");
	return 1;
};

sub ride {
	my $self = shift;

	return if !$self->Unit::move; 

	print ("We are running aground!\n");
	$self->health(0);
	return 0;
}

sub fly {
	my $self = shift;
	
	return if !$self->Unit::move; 
	
	print ("It seems we are blown up!\n");
	$self->health(0);
	return 0;

}

sub shoot_cannon {
	my $self = shift;
	return if ( !$self->check_health );
	$self->_shoot_cannon;
}

sub aim_cannon {
	my $self = shift;
	return if ( !$self->check_health );
	$self->_aim_cannon;
}

sub recharge_cannon {
	my $self = shift;
	return if ( !$self->check_health );
	$self->_recharge_cannon;
}

sub shoot_torpedo {
	my $self = shift;
	return if ( !$self->check_health );
	$self->_shoot_torpedo;
}

sub aim_torpedo {
	my $self = shift;
	return if ( !$self->check_health );
	$self->_aim_torpedo;
}


1;
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
		_recharge_machinegun => 'recharge',
		_shoot_machinegun    => 'shoot',
		_aim_machinegun		 => 'aim',
	},
);

has 'weapon2' => (
	is => 'ro',
	isa => 'Weapon::Cannon',
	builder => '_install_w2',
	handles => {
		_recharge_cannon => 'recharge',
		_shoot_cannon    => 'shoot',
		_aim_cannon		 => 'aim',
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
	
	print ("Lets roll!\n");
	return 1;
}

sub ride {
	my $self = shift;

	return if !$self->Unit::move; 

	print ("Lets ride!\n");
	return 1;
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




1;
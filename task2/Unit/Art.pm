package Unit::Art;

use Moose;
use Weapon::Cannon;

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

	print ("Changing position!\n");
	return 1;
};

sub sail {
	my $self = shift;
	
	return if !$self->Unit::move; 
	
	print ("We are drowning!\n");
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

1;
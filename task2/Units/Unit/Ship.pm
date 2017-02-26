package Units::Unit::Ship;

use Moose;
use Weapons::Weapon::Cannon;
use Weapons::Weapon::Torpedo;

extends 'Units::Unit';


has 'weapon1' => (
	is => 'ro',
	isa => 'Weapons::Weapon',
	builder => '_install_w1',
	handles => {
		recharge_cannon => 'recharge',
		shoot_cannon    => 'shoot',
	},
);

has 'weapon2' => (
	is => 'ro',
	isa => 'Weapons::Weapon',
	builder => '_install_w2',
	handles => {
		shoot_torpedo  => 'shoot',
	},
);

sub _install_w1 {
	my $weapon1 = Weapons::Weapon::Cannon->new( ammo => '200' );
	return $weapon1;
}

sub _install_w2 {
	my $weapon2 = Weapons::Weapon::Torpedo->new( ammo => '50' );
	return $weapon2;
}

after 'prepare' => sub {
	my $self = shift;

	print ("Fair wind!\n");
	
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
	if ( $self->speed <= 0) {
		print ("We are immobilized\n");
		return;
	};
	if ( $self->isa('Units::Unit::Tank')) {
		print ("We are drowning!\n");
		$self->health(0);
		return;
	};
	if ( $self->isa('Units::Unit::Plane')) {
		print ("We are drowning!\n");
		$self->health(0);
		return;
	};
	if ( $self->isa('Units::Unit::Art')) {
		print ("We are drowning!\n");
		$self->health(0);
		return;
	};
	print ("Fair wind!\n");
};


1;
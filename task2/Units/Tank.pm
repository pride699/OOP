package Units::Tank;


use Moose;
use Weapons::Machinegun;
use Weapons::Cannon;

extends 'Units::Unit';

has 'weapon1' => (
	is => 'ro',
	isa => 'Weapons::Weapon',
	builder => '_install_w1',
);

has 'weapon2' => (
	is => 'ro',
	isa => 'Weapons::Weapon',
	builder => '_install_w2',
);

sub _install_w1 {
	my $weapon1 = Weapons::Machinegun->new( ammo => '5000', belt_capacity => '100' );
	return $weapon1;
}

sub _install_w2 {
	my $weapon2 = Weapons::Cannon->new( ammo => '50' );
	return $weapon2;
}


after 'prepare' => sub {
	my $self = shift;

	print ("Forward!\n");
	
	return $self->prepared(1);
};

after 'move' => sub  {
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
	print ("Lets roll!\n");
};


1;
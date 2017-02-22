package Units::Art;

use Moose;
use Weapons::Cannon;

extends 'Units::Unit';


has 'weapon1' => (
	is => 'ro',
	isa => 'Weapons::Weapon',
	builder => '_install_w1',
);

sub _install_w1 {
	my $weapon1 = Weapons::Cannon->new( ammo => '50' );
	return $weapon1;
}


after 'prepare' => sub {
	my $self = shift;

	print ("In position! Weapons online!\n");
 
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
	print ("Changing position!\n");
};


1;
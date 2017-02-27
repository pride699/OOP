package Weapon::Missle;

use Moose;

extends 'Weapon';


sub shoot {
	my $self = shift;
	
	
	if ( !$self->aimed ) {
		print ("We can't shoot just anywhere!\n");
		return;
	};
	if ($self->ammo > 0 ) {
		print ("For great justice! \n");
		$self->ammo( $self->ammo - 1 );
	} else {
		print ("Missle bay is empty! \n");
	};
}

1;
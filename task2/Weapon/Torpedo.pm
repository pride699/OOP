package Weapon::Torpedo;


use Moose;

extends 'Weapon';


sub shoot {
	my $self = shift;
	
	
	if ( !$self->aimed ) {
		print ("We can't shoot just anywhere!\n");
		return 0;
	};
	if ( $self->ammo > 0 ) {
		print ("Yarr! Parrrley! \n");
		$self->ammo( $self->ammo - 1 );
		return 1;
	} else {
		print ("No torpedos left! \n");
		return 0;
	};
}

1;
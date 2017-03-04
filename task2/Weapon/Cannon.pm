package Weapon::Cannon;

use Moose;

extends 'Weapon';


has 'charged' => (
	is  	=> 'rw',
	isa 	=> 'Bool',
	default => '0',
);


sub recharge {
	my $self = shift;
	
	if ( $self->charged == 0 ) {
		if ( $self->ammo == 0 ) {
			print ("We're out if ammo sir, fall back! \n");
			return 0;
		} else {
			$self->charged(1);
			$self->ammo( $self->ammo -1 );
			print ("Cannon is charged! \n");
			return 1;
		}
	} else {
		print ("Cannon is ready to fire! \n");
		return 0;
	};
}

sub shoot {
	my $self = shift;
	
	
	if ( !$self->aimed ) {
		print ("We can't shoot just anywhere!\n");
		return 0;
	};
	if ( $self->charged == 1 ) {
		print ("Fire! \n");
		$self->charged(0);
		return 1;
	} else {
		print ("We need recharge, sir! \n");
		return 0;
	};
}

1;

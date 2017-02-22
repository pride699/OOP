package Weapons::Cannon;

use Moose;

extends 'Weapons::Weapon';

has 'ammo' => (
	is  	=> 'rw',
	isa 	=> 'Int',
	default => '50',

);

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
		} else {
			$self->charged(1);
			$self->ammo( $self->ammo -1 );
			print ("Cannon is charged! \n");
		}
	} else {
		print ("Cannon is ready to fire! \n");
	};
}

sub shoot {
	my $self = shift;
	
	
	if ( !$self->aimed ) {
		print ("We can't shoot just anywhere!\n");
		return;
	};
	if ( $self->charged == 1 ) {
		print ("Fire! \n");
		$self->charged(0);
	} else {
		print ("We need recharge, sir! \n");
	};
}

1;

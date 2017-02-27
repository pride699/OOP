
package Weapon;

use Moose;

has 'aimed' => (
	is 		=> 'rw',
	isa 	=> 'Bool',
	default => '0',
);

has 'ammo' => (
	is  	=> 'rw',
	isa 	=> 'Int',
	default => '50',

);

sub aim {
	my $self = shift;
	print ("Taget aquired!\n");
	$self->aimed(1);

}

1;
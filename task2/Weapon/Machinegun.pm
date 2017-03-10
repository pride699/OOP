package Weapon::Machinegun;


use Moose;

extends 'Weapon';


has '+ammo' => (
	default => '5000',
);

has 'belt_capacity' => (
	is  	=> 'ro',
	isa 	=> 'Int',
	default => '100',
);

has 'belt_charge' => (
	is  	=> 'rw',
	isa 	=> 'Int',
	default => '0',
);


sub check_ammo {
	my $self = shift;
	
	if ( $self->ammo < ($self->belt_capacity - $self->belt_charge) ) {
		print ("We are running out of ammo! \n Just ", $self->ammo, " left  , and enemys are still alive \n for some reason...\n");
		return ($self->ammo);
	} 
	else {
		return ($self->belt_capacity - $self->belt_charge);
	};
}


sub recharge {
	my $self = shift;
	
	if ( $self->belt_charge == $self->belt_capacity ) {
		print("We're ready to feed them some metal! \n");
		return 0;
	} 
	else {
		if ( $self->ammo == 0 ) {
			print ("We are out of ammo! Use the remaining ", $self->belt_charge, " and fall back to base!\n");
			return 0;
		} 
		else {
			$self->ammo( $self->ammo - $self->check_ammo );
			$self->belt_charge( $self->belt_charge + $self->check_ammo );
			print ("Machinegun is recharged!\n");
			return 1;
		};
	};
}

sub shoot {
	my ( $self, $amount ) = @_;

	if ( !$self->aimed ) {
		print ("We can't shoot just anywhere!\n");
		return 0;
	}; 
	if ( $self->belt_charge < $amount ) {
		print ("Can't shoot $amount, just ", $self->belt_charge , " ammo left!\n");
		return 0;
	} 
	else {
		print ("Let's show them democracy!!\n");
		$self->belt_charge( $self->belt_charge - $amount );
		return 1;
	};
}

1;

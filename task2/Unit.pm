package Unit;

use Moose;
use Weapon;

has 'name' => (
	is  	 => 'ro',
	isa 	 => 'Str',
	required => '1',
);

has 'speed' => (
	is  	=> 'rw',
	isa 	=> 'Num',
);

has 'armor' => (
	is  	=> 'ro',
	isa 	=> 'Int',
);

has 'health' => (
	is  	=> 'rw',
	isa 	=> 'Int',
);

has 'prepared' => (
	is 		=> 'rw',
	builder => 'prepare',
);

sub prepare {
	my $self = shift;

}

sub move {
	my $self = shift;

	if ( $self->check_health == 0) {
		return 0;
	} 
	elsif ( $self->speed <= 0) {
		print ("We are immobilized\n");
		return 0;
	} 
	else {
		return 1;
	};
}

sub ride {
	my $self = shift;

	return if !$self->Unit::move; 

	print ("We are running aground!\n");
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

sub sail {
	my $self = shift;
	
	return if !$self->Unit::move; 
	
	print ("We are drowning!\n");
	$self->health(0);
	return 0;

}

sub check_health {
	my $self = shift;

	if ( $self->health <= 0 ) {
		print ("Unit is destroyed x_x \n");
		$self->speed(0);
		return 0;
	} 
	else {
		return 1;
	};

}

sub take_damage {
	my ( $self, $amount ) = @_;
	my $crit_chance = int(rand(10));

	return if $self->check_health == 0;

	if ( $crit_chance == 9 ) {
		print ("Critical damage! Leave unit immediately! \n");
		$self->health(0);

	} 
	else {
		print ("We are under attack! \n");
		$self->health( $self->health - $amount );
		$self->speed( $self->speed - $amount);
		$self->weapon1->aimed(0);
		$self->weapon2->aimed(0);
		
	};

}

1;
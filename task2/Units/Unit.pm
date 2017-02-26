package Units::Unit;

use Moose;
use Weapons::Weapon;
# use Units::Unit::Tank;
# use Units::Unit::Plane;
# use Units::Unit::Ship;
# use Units::Unit::Art;



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
	isa 	=> 'Bool',
	default => '0',
);

sub prepare {
	my $self = shift;
	
	if ( $self->check_status == 0 ) {
		return $self->prepared(0);
	};
	if ( $self->prepared == 1 ) {
		print ("We are already in battle!\n");
	};
}

sub move {
	my $self = shift;
}

sub check_status {
	my $self = shift;

	if ( $self->health <= 0 ) {
		print ("Unit is destroyed x_x \n");
		$self->speed(0);
		return 0;
	} else {
		return 1;
	};

}

sub take_damage {
	my ( $self, $amount ) = @_;
	my $crit_chance = int(rand(10));

	return if $self->check_status == 0;

	if ( $crit_chance == 9 ) {
		print ("Critical damage! Leave unit immediately! \n");
		$self->health(0);

	} else {
		print ("We are under attack! \n");
		$self->health( $self->health - $amount );
		$self->speed( $self->speed - $amount);
		$self->weapon1->aimed(0);
		$self->weapon2->aimed(0);
		
	};

}

1;
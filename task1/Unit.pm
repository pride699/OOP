package Unit;
use Data::Dumper;



sub new {
	my $class = shift;
	my $self = {
			name 	  => "",
			rank 	  => "",
			spec 	  => "",
			duty_time => "",
			vehicle   => "",
	};
	bless ( $self, $class );
	return $self;

}

sub name {
	my ( $self, $name ) = @_;
	
	if ( $name ) {
		# print Dumper $name;
		if ( $name =~ /^[a-z ,.'-]+$/i ) {
			$self->{name} = $name;
		} else {
			$self->{name} = "Nameless hero";
		};
		
	};
	return $self->{name};
}

sub rank {
	my ( $self, $rank ) = @_;
	
	if ( $rank ) {
		if ( $rank =~ /[\w]+/) {
			$self->{rank} = $rank;
		} else {
			$self->{rank} = "Private";
		};
		
	};
	return $self->{rank};
}

sub spec {
	my ( $self, $spec ) = @_;
	my @spec_table = ("Commander", "Engineer", "Aimer", "Charger", "Radist");
	my $count;
	
	if ( $spec ) {
		# print Dumper $spec;
		foreach ( @spec_table ) {
			# print Dumper $_;
			if ( $spec eq $_ ) {
				$self->{spec} = $spec;
				$count++;			
			};
		};
	$self->{spec} = "Cannon fodder" if (!$count);
	};
	return $self->{spec};
}

sub duty_time {
	my ( $self, $duty_time ) = @_;
	
	if ( $duty_time ) {
		# print Dumper $duty_time;
		if ( $duty_time  =~ /\d+/) {
			$self->{duty_time} = $duty_time;
		} else {
			$self->{duty_time} = "0";
		};
		
	};
	return $self->{duty_time};
}

sub vehicle {
	my ( $self, $vehicle ) = @_;
	
	if ( $vehicle ) {
		$self->{vehicle} = $vehicle;
	};
	return $self->{vehicle};
}


sub AUTOLOAD {
	my $self = shift or return undef;
	( my $method = $AUTOLOAD ) =~ s{.*::}{};
	
	if ( exists $self->{$method} ) {
		my $accessor = sub {
			my $closureSelf = shift;
			if ( @_ ) {
				return $closureSelf->{$method} = shift;
			}
			return $closureSelf->{$method};
		};

		SYMBOL_TABLE_HACQUERY: {
			no strict qw{refs};
			*$AUTOLOAD = $accessor;
		}
		unshift @_, $self;
		goto &$AUTOLOAD;
	}
}

1;
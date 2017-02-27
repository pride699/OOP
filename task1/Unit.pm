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




sub AUTOLOAD {
	my $self = shift or return undef;
	( my $method = $AUTOLOAD ) =~ s{.*::}{};
	
	if ( exists $self->{$method} ) {
		my $accessor = sub {
			my ( $closureSelf, $data ) = @_;
			
			if ( _valid_data( $method, $data ) ) {
				return $closureSelf->{$method} = $data;
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

sub _valid_data {
	my ( $method, $data ) = @_;

	if ( !data ) {
		return 0;
	};
	if ( $method eq 'name') {
		if ( $data =~ /^[a-z ,.'-]+$/i ) {
			return 1;
		} else {
			return 0;
		}
	};
	if ( $method eq 'rank') {
		if ( $data =~ /[\w]+/ ) {
			return 1;
		} else {
			return 0;
		}
	};
	if ( $method eq 'spec') {
		my @spec_table = ("Commander", "Engineer", "Aimer", "Charger", "Radist");
		my $count;
		foreach ( @spec_table ) {
			if ( $data eq $_ ) {
				$count++;			
			};
		};
		if ( !$count ) {
			return 0;
		} else {
			return 1;
		};
	};
	if ( $method eq 'duty_time') {
		if ( $data =~ /\d+/ ) {
			return 1;
		} else {
			return 0;
		}
	};
	if ( $method eq 'vehicle') {
		return 1;	
	};
}


1;
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
	( my $method = $AUTOLOAD ) =~ s/.*:://;
	
	if ( exists $self->{$method} ) {
		my $accessor = sub {
			my ( $closure_self, $data ) = @_;
			
			if ( _valid_data( $method, $data ) ) {
				return $closure_self->{$method} = $data;
			}
			return $closure_self->{$method};
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

	return 0 if !$data;

	my %valid_table = (
		name 	  => "^[a-z ,.'-]+\$",
		rank 	  => "[\\w]+",
		duty_time => "\\d+",
		vehicle	  => ".+",
	);

	foreach ( keys(%valid_table) ) {
		if ( $method eq $_) {
			if ( $data =~ /$valid_table{$_}/i ) {
				return 1;
			} else {
				return 0;
			};
		} elsif ( $method eq 'spec') {
			my @spec_table = ("Commander", "Engineer", "Aimer", "Charger", "Radist");
			my $count;
			foreach ( @spec_table ) {
				if ( $data eq $_ ) {
					return 1;		
				} else {
					$count++;
				};
			};
			return 0 if $count;
		};
	};
}


1;
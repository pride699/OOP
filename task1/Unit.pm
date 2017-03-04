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
	my ( $self, $data ) = @_;
	( my $method = $AUTOLOAD ) =~ s/.*:://;

	if ( exists $self->{$method} ) {
		if ( _valid_data( $method, $data ) ) {
			return $self->{$method} = $data;
		};
		return $self->{$method};
	};

}

sub _valid_data {
	my ( $method, $data ) = @_;

	return 0 if !$data;

	my %valid_table = (
		name 	  => "^[a-z ,.'-]+\$",
		rank 	  => "[\\w]+",
		duty_time => "\\d+",
		vehicle	  => ".+",
		spec 	  => "(Commander)|(Engineer)|(Aimer)|(Charger)|(Radist)",
	);

	if ( $data =~ /$valid_table{$method}/i ) {
		return 1;
	} else {
		return 0;
	};
}

1;
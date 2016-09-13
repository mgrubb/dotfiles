<+bit:header+>

package <+PERL PKG+>;
use SAT::Class
	version => 3.14159,
	base => 'SAT::Base',
	debug => 0,
;

sub init
{
	my ($self, $config) = @_;
	#$self->configure($config);
<+CURSOR+>

	return $self;
}

1;
# vim:<+g:defmodeline+>:

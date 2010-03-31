
package Test::Skip ;
#use base ;

use strict;
use warnings ;
use Carp ;

BEGIN 
{
#~ use Exporter ;
#~ use vars qw ($VERSION @ISA @EXPORT_OK @EXPORT_OK %EXPORT_TAGS);
#~ @ISA = qw(Exporter);
#~ @EXPORT_OK   = qw ();
#~ %EXPORT_TAGS = (all => [@EXPORT_OK]);

use Sub::Exporter -setup => 
	{
	exports => [ qw() ],
	groups  => 
		{
		all  => [ qw() ],
		}
	};
	
use vars qw ($VERSION);
$VERSION     = '0.01_1';
}

#-------------------------------------------------------------------------------

use English qw( -no_match_vars ) ;

use Readonly ;
Readonly my $EMPTY_STRING => q{} ;

use Carp qw(carp croak confess) ;

#-------------------------------------------------------------------------------

=head1 NAME

Test::Skip - Framework to skip tests under certain conditions

=head1 SYNOPSIS

  use Test::Skip
  	{
	comment => 'test XXX under linux and XP',

	has =>
		{
		executables => [ 'some_binary', 'another_binary' ],
		modules => ['IPC::Run', ['Data::TreeDumper' => 0.36 ]] ,
		os => [ 'linux', ['Win32' => 'XP']]
		},

	has_no => 
		{
		modules => 
			{
			comment => 'Safe is too old!',
			modules => ['Safe' => '<2.26'] 
			},
		}
	}

  #---------------------------------------------------

  use Test::Skip qw(:skip_all_test) ;
  skip_all_test_unless 'modules' => 'IPC::Run, 'no IPC::Run, needed for test xxx' ;

  #---------------------------------------------------

  use Test::Skip qw(:skip_test) ;  # Test::Block style

  skip_test  \%pre_requisits 
  	{
	# many tests in this block 
	} ;

  skip_test  \%pre_requisits
        {
	# many tests in this block
	} ;


=head1 DESCRIPTION

* As of version 0.01_1, this is a placeholder. Please give feedback on the API *

This module implements a framework wich run plugins that verify certain conditions
and skips tests.

=head1 DOCUMENTATION

=head1 SUBROUTINES/METHODS

=cut


#-------------------------------------------------------------------------------

1 ;

=head1 BUGS AND LIMITATIONS

None so far.

=head1 AUTHOR

	Nadim ibn hamouda el Khemir
	CPAN ID: NKH
	mailto: nadim@cpan.org

=head1 COPYRIGHT AND LICENSE

Copyright 2009 Nadim Khemir.

This program is free software; you can redistribute it and/or
modify it under the terms of either:

=over 4

=item * the GNU General Public License as published by the Free
Software Foundation; either version 1, or (at your option) any
later version, or

=item * the Artistic License version 2.0.

=back

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Test::Skip

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Test-Skip>

=item * RT: CPAN's request tracker

Please report any bugs or feature requests to  L <bug-test-skip@rt.cpan.org>.

We will be notified, and then you'll automatically be notified of progress on
your bug as we make changes.

=item * Search CPAN

L<http://search.cpan.org/dist/Test-Skip>

=back

=head1 SEE ALSO

L<Test::Skip::UnlessExistsExecutable>, L<Test::Requires>

=cut

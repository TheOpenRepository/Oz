#!/usr/bin/perl

use strict;
BEGIN {
	$|  = 1;
	$^W = 1;
}

use File::Spec::Functions ':ALL';
use Test::More tests => 5;
use Oz::Script;





#####################################################################
# Constructor Tests

SCOPE: {
	# Create from a string
	my $scalar_ref = Oz::Script->new( \qq~{Show "Hello World!"}\n~ );
	isa_ok( $scalar_ref, 'Oz::Script' );
	is( $scalar_ref->text, qq~{Show "Hello World!"}\n~, '->text ok' );

	# Create from a file
	my $name = catfile( qw{ t data expression.oz } );
	ok( -f $name, 'Found expression.oz' );
	my $file = Oz::Script->new( $name );
	isa_ok( $file, 'Oz::Script' );
	is_deeply( $file, $scalar_ref, "It doesn't matter where scripts come from" );
}

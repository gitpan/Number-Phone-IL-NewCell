# This Perl Module convert OLD Cellular phone numbers in Israel
# To The new number for April 2004 change.
# Author: Oded S. Resnik
#
# IF YOU USE THIS PROGRAM , YOU DO THIS AT YOUR OWN RISK !!!!
#
# Copyright (c) 2003 RAZ Information Systems All rights reserved.
#
#       You may use and distribute under the terms of either the 
#       GNU General Public License or the Artistic License, 
#       as specified in the Perl README file.
#
#############################################################################
package Number::Phone::IL::NewCell; 
use strict ;
use Exporter;
use vars qw(@EXPORT_OK $VERSION  %ARGS);
$VERSION = '0.2';

@EXPORT_OK = qw(Old2New new);

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
        my %args = @_;
	my $self = \%args; 
        $self->{Result} = [];
	bless ($self, $class);
	return $self;
}
 
my $OldPrix2New ={
		'054'=>'054-4',
		'055'=>'054-5',
		'066'=>'054-6',
		'067'=>'054-7',
		'050'=>'050-5',
		'051'=>'050-7',
		'056'=>'050-6',
		'068'=>'050-8',
		'057'=>'057-7',
		'052'=>'052-2',
		'053'=>'052-3',
		'058'=>'052-8',
		'064'=>'052-4',
		'065'=>'052-5'}
;
sub Old2New {
 my $class = shift;
 my $oldnum = shift;
 my ($prefix,$thenum, $tail) = $oldnum =~ /^\D?(\d{3})\D?(\d{6})(.*)/;
 my ($lead,$delim) = $oldnum =~ /(^\D?)\d{3}(\D?)\d{6}.*/;
 $class->{result} = $oldnum;
 if (my $newPref = $$OldPrix2New{"$prefix"}) {
	$newPref =~ s/\-/$delim/;
 	$class->{result} = $lead . $newPref . $thenum .$tail;
 	}
 }
1;
__END__

=head1 NAME

 Number::Phone::IL::NewCell - New cellular phone numbers in Israel.

=head1 SYNOPSIS

        use Number::Phone::IL::NewCell;

        my $a=Number::Phone::IL::NewCell->new;

        $a->Old2New('055-1231456');

=head1 DESCRIPTION

This modules can be used to replace cellular phone numbers
according to April 2004 scheme in Israel.

=head1 METHODS

=over 4

=item 1

Old2New(oldnumber)

This method assigns the old cellular phone number to the object.

=head1 PROPERTIES

=over 4

=item 1

$->{result}

The result of number conversion. If the number was not identified as a valid
number according to the Scheme the old number will be in the result.


=item 2

$OldPrix2New a hash reference to the number change scheme.

=head1 BUGS

This program was poorly tested !!!! 

As this is a run once program, I don't think that I will fix bugs or
release new versions.

If you need treatment for international prefix like +972-56-444222
you may use programs and module conributed by Shlomi Fish.

B<IF YOU USE THIS PROGRAM, YOU DO THIS AT YOUR OWN RISK !!!.>

Make backup before you run this program !!!!

=head1 AUTHOR

Oded S. Resnik RAZ Information Systems, B<razinf@cpan.org>, B<raz@raz.co.il>.

=head1 COPYRIGHT

Copyright (c) 2004 RAZ Information Systems Ltd.
http://www.raz.co.il/

This package is distributed under the same terms as Perl itself, see the
Artistic License on Perl's home page.

=cut


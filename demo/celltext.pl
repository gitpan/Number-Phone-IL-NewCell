#!/usr/bin/perl
##################################################################
# This is a demo program for a perl Module that 
# convert OLD Cellular phone numbers in Israel To The new number.
# (C) RAZ Information Systems LTD. 2004
# Author: Oded S. Resnik
# This module is a free software and can be used and distributed
# Under the same terms as PERL it self.
#
# IF YOU USE THIS PROGRAM , YOU DO THIS AT YOUR OWN RISK !!!!
#
##################################################################
use Number::Phone::IL::NewCell;
# Search numbers in text
my $a=Number::Phone::IL::NewCell->new;
while (<STDIN>) {
	if (/\d{5}/) {
		 my $line = $_;
			 $line =~s/(\D0[5|6|7])/~NuMb~$1/g;
			foreach (split('~NuMb~',$line)) {
					$a->Old2New($_);
					print $a->{result};
				};
		} else {print;};
	};

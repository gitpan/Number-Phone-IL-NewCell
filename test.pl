# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..7\n"; }
END {print "not ok 1\n" unless $loaded;}
use Number::Phone::IL::NewCell qw(Old2New);
$loaded = 1;
print "ok 1\n";

my $tests = ['067444555', '058555444', '055-777444','(052)333444',  
	'059 77555', '(054)12345'];

my $test = 1;
my $a=Number::Phone::IL::NewCell->new;

foreach (@$tests) {
	print "old: @$tests[$test-1] New: ";
	$a -> Old2New(@$tests[$test-1]);
	print $a->{result};
	print ".\n";
	$test++;
	print "ok $test\n";
};
######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

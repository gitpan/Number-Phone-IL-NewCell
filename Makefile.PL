use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

sub MY::postamble {
        package MY;
        shift->SUPER::postamble . <<'MAKE';
distdir : README

README : NewCell.pm
	@$(PERL) -MPod::Text -e "pod2text('$<');" > $@

MAKE
}

WriteMakefile(
    'NAME'	=> 'Number::Phone::IL::NewCell',
    'VERSION_FROM' => 'NewCell.pm', # finds $VERSION
    'dist' => {'COMPRESS' => 'gzip --best --force'},
);

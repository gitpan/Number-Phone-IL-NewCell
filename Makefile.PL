use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

sub MY::install 
{
	package MY;
	my $inherited = shift->SUPER::install;
	$inherited . <<'MAKE';
DOC_DATA = $(VENDORPREFIX)/share/doc/$(DISTVNAME)

MAKE
}
#######################################
sub MY::postamble {
	package MY;
	my $NotUnix;
	foreach (qw(in32 vms os390 os2 dos amiga mac))
		{
        	$NotUnix = 1 if ($^O =~ /$_/);
		}
	if ($NotUnix){;
        	shift->SUPER::postamble . <<'MAKE';

# Non Unix like 
distdir : README

README : NewCell.pm
	@$(PERL) -MPod::Text -e "pod2text('$<');" >$@

MAKE
	} else {
               shift->SUPER::postamble . <<'MAKE';

# Unix like
doc_install ::
        $(MKPATH) $(DOC_DATA)
        $(MOD_INSTALL) contrib $(DOC_DATA)/contrib
        $(MOD_INSTALL) docs $(DOC_DATA)/
        $(MKPATH) docs
        $(PERLRUN) -MPod::Text -e "pod2text('NewCell.pm');" > docs/README
        $(MOD_INSTALL) demo $(DOC_DATA)/demo

distdir : README

README : NewCell.pm
        @$(PERL) -MPod::Text -e "pod2text('$<');" >$@

MAKE
	}
}

WriteMakefile(
    'NAME'	=> 'Number::Phone::IL::NewCell',
    'VERSION_FROM' => 'NewCell.pm', # finds $VERSION
    'dist' => {'COMPRESS' => 'gzip --best --force'},
);

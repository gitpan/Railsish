
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Railsish',
  NAME      => 'Railsish',
  AUTHOR    => 'Liu\ Kang\-min\ \<gugod\@gugod\.org\>',
  ABSTRACT  => 'A web application framework.',
  VERSION   => '0.20',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'mit') : ()),
  PREREQ_PM    => {
    "Binding" => '0.04',
    "Module::Refresh" => '0.13',
    "Template" => '2.20',
    "Devel::Symdump" => '0',
    "Path::Router" => '0.06',
    "Perl6::Junction" => '1.4000',
    "Mouse" => '0.19',
    "HTTP::Engine" => '0.1.4',
    "File::Spec::Functions" => '0',
    "JSON" => '0',
    "UNIVERSAL::require" => '0',
  },
);

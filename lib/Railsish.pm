package Railsish;
our $VERSION = '0.10';

# ABSTRACT: A web application framework.

use strict;
use warnings;

use HTTP::Engine::Response;
use UNIVERSAL::require;
use Module::Refresh;

my $app_package;

sub import {
    $app_package = caller;

    no strict;
    for (qw(handle_request)) {
        *{"$app_package\::$_"} = \&$_;
    }
}

sub app_root {
    $ENV{APP_ROOT}
}

sub handle_request {
    {
        require Module::Refresh;
        Module::Refresh->refresh;
    };

    &dispatch;
}

sub dispatch {
    my $request = shift;
    my $response = HTTP::Engine::Response->new;

    my $path = $request->request_uri;

    my ($controller) = $path =~ m{^/(\w+)}s;
    $controller ||= 'welcome';

    my $controller_class = $app_package . "::" . ucfirst($controller) . "Controller";
    $controller_class->require or die $@;

    $controller_class->dispatch($request, $response);

    return $response;
}

1;



__END__
=head1 NAME

Railsish - A web application framework.

=head1 VERSION

version 0.10

=head1 DESCRIPTION

This is a web app framework that is still very experimental.

=head1 AUTHOR

  Liu Kang-min <gugod@gugod.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2009 by Liu Kang-min <gugod@gugod.org>.

This is free software, licensed under:

  The MIT (X11) License

=head1 EXAMPLE

At this moment, see t/SimpleApp for how to use this web framework.


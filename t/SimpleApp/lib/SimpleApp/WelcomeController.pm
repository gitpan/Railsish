package SimpleApp::WelcomeController;
our $VERSION = '0.10';

use strict;
use warnings;

use Railsish::Controller;

sub index {
    render(title => "Welcome");
}

sub here {
    our $answer = 42;
    render;
}

1;


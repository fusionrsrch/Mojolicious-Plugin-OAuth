# ABSTRACT: Mojolicious Plugin for OAuth provider 

use strict;
use warnings;

package Mojolicious::Plugin::OAuth;
use Mojo::Base 'Mojolicious::Plugin';
 
sub register {
    my ($self, $app, $conf) = @_;
 
    # Magic here! :)

    $app->routes->add_shortcut(
        rest_routes => sub {
# 
#                               GET      /oauth/authorize/:code(.:format)                       doorkeeper/authorizations#show
#           oauth_authorization GET      /oauth/authorize(.:format)                             doorkeeper/authorizations#new
#                               POST     /oauth/authorize(.:format)                             doorkeeper/authorizations#create
#                               PATCH    /oauth/authorize(.:format)                             doorkeeper/authorizations#update
#                               PUT      /oauth/authorize(.:format)                             doorkeeper/authorizations#update
#                               DELETE   /oauth/authorize(.:format)                             doorkeeper/authorizations#destroy
#                   oauth_token POST     /oauth/token(.:format)                                 doorkeeper/tokens#create
#                  oauth_revoke POST     /oauth/revoke(.:format)                                doorkeeper/tokens#revoke
#            oauth_applications GET      /oauth/applications(.:format)                          doorkeeper/applications#index
#                               POST     /oauth/applications(.:format)                          doorkeeper/applications#create
#         new_oauth_application GET      /oauth/applications/new(.:format)                      doorkeeper/applications#new
#        edit_oauth_application GET      /oauth/applications/:id/edit(.:format)                 doorkeeper/applications#edit
#             oauth_application GET      /oauth/applications/:id(.:format)                      doorkeeper/applications#show
#                               PATCH    /oauth/applications/:id(.:format)                      doorkeeper/applications#update
#                               PUT      /oauth/applications/:id(.:format)                      doorkeeper/applications#update
#                               DELETE   /oauth/applications/:id(.:format)                      doorkeeper/applications#destroy
# oauth_authorized_applications GET      /oauth/authorized_applications(.:format)               doorkeeper/authorized_applications#index
#  oauth_authorized_application DELETE   /oauth/authorized_applications/:id(.:format)           doorkeeper/authorized_applications#destroy
#              oauth_token_info GET      /oauth/token/info(.:format)                            doorkeeper/token_info#show
# 

            my $routes = shift;
            my $auth_namespace = 'Mojolicious::Plugin::OAuth::Authorizations';
            my $auth_short_name = 'authorizations';
            my $token_namespace = 'Mojolicious::Plugin::OAuth::Tokens';
            my $token_short_name = 'tokens';
            my $app_namespace = 'Mojolicious::Plugin::OAuth::Applications';
            my $app_short_name = 'applications';
            my $authapp_namespace = 'Mojolicious::Plugin::OAuth::AuthorizedApplications';
            my $authapp_short_name = 'authorized_applications';

            $routes->get('/oauth/authorize/:code')->to(action => 'show', namespace => $auth_namespace)->name("${auth_short_name}::show");
            $routes->get('/oauth/authorize')->to(action => 'new', namespace => $auth_namespace)->name("${auth_short_name}::new");
            $routes->post('/oauth/authorize')->to(action => 'create', namespace => $auth_namespace)->name("${auth_short_name}::create");
            $routes->patch('/oauth/authorize')->to(action => 'update', namespace => $auth_namespace)->name("${auth_short_name}::update");
            $routes->put('/oauth/authorize')->to(action => 'update', namespace => $auth_namespace)->name("${auth_short_name}::update");
            $routes->delete('/oauth/authorize')->to(action => 'destroy', namespace => $auth_namespace)->name("${auth_short_name}::destroy");

            $routes->post('/oauth/token')->to(action => 'create', namespace => $token_namespace)->name("${token_short_name}::create");
            $routes->post('/oauth/revoke')->to(action => 'revoke', namespace => $token_namespace)->name("${token_short_name}::revoke");
            $routes->get('/oauth/token/info')->to(action => 'show', namespace => $token_namespace)->name("${token_short_name}::show");

            $routes->get('/oauth/applications')->to(action => 'index', namespace => $app_namespace)->name("${app_short_name}::index");
            $routes->post('/oauth/applications')->to(action => 'create', namespace => $app_namespace)->name("${app_short_name}::create");
            $routes->get('/oauth/applications/new')->to(action => 'new', namespace => $app_namespace)->name("${app_short_name}::new");
            $routes->get('/oauth/applications/:id/edit')->to(action => 'edit', namespace => $app_namespace)->name("${app_short_name}::edit");
            $routes->get('/oauth/applications/:id')->to(action => 'show', namespace => $app_namespace)->name("${app_short_name}::show");
            $routes->patch('/oauth/applications/:id')->to(action => 'update', namespace => $app_namespace)->name("${app_short_name}::update");
            $routes->put('/oauth/applications/:id')->to(action => 'update', namespace => $app_namespace)->name("${app_short_name}::update");
            $routes->delete('/oauth/applications/:id')->to(action => 'destroy', namespace => $app_namespace)->name("${app_short_name}::destroy");

            $routes->get('/oauth/authorized_applications')->to(action => 'index', namespace => $authapp_namespace)->name("${authapp_short_name}::index");
            $routes->delete('/oauth/authorized_applications/:id')->to(action => 'destroy', namespace => $authapp_namespace)->name("${authapp_short_name}::destroy");

            return;

        }
    );
}

1;

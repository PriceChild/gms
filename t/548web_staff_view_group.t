use lib qw(t/lib);
use GMSTest::Common;
use GMSTest::Database;
use Test::More;

need_database 'staff';

use ok 'Test::WWW::Mechanize::Catalyst' => 'GMS::Web';

my $ua = Test::WWW::Mechanize::Catalyst->new;

$ua->get_ok("http://localhost/", "Check root page");

$ua->get_ok("http://localhost/login", "Check login page works");
$ua->content_contains("Login to GMS", "Check login page works");

$ua->submit_form(
    fields => {
        username => 'staff',
        password => 'staffer01'
    }
);

$ua->content_contains("You are now logged in as staff", "Check we can log in");

$ua->get_ok("http://localhost/staff", "Staff page works");

$ua->get_ok("http://localhost/staff/38/view");

$ua->content_contains ("<h2>group122</h2>", "View group page works");
$ua->content_contains ("<tr> <td>Type</td>              <td>informal</td> </tr>");
$ua->content_contains ("<tr> <td>URL</td>               <td>http://group122.example</td> </tr>");
$ua->content_contains ("<tr> <td>Status</td>            <td>pending_web</td> </tr>");
$ua->content_contains ("<tr> <td>Verification URL</td>  <td>http://group122.example/fgkyobfk.txt</td> </tr>");
$ua->content_contains ("<tr> <td>Verification token</td><td>eubatkisggkd</td> </tr>");
$ua->content_contains ("<tr> <td>DNS pointing to freenode.net</td> <td>freenode-yfaynqp.group122.example</td> </tr>");

$ua->content_lacks ("Historical/Inactive Contacts", "Staff don't see historical/inactive contacts");

done_testing;

package GMS::Schema::Result::CloakNamespace;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

GMS::Schema::Result::CloakNamespace

=cut

__PACKAGE__->table("cloak_namespaces");

=head1 ACCESSORS

=head2 group_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 namespace

  data_type: 'character varying'
  is_nullable: 0
  size: 32

=cut

__PACKAGE__->add_columns(
  "group_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "namespace",
  { data_type => "character varying", is_nullable => 0, size => 32 },
);
__PACKAGE__->set_primary_key("group_id", "namespace");
__PACKAGE__->add_unique_constraint("cloak_namespaces_namespace_key", ["namespace"]);

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<GMS::Schema::Result::Group>

=cut

__PACKAGE__->belongs_to("group", "GMS::Schema::Result::Group", { id => "group_id" }, {});


# Created by DBIx::Class::Schema::Loader v0.06000 @ 2010-03-30 20:57:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rxsfjYEvqEFgD2cnV77qYA

__PACKAGE__->belongs_to('group', 'GMS::Schema::Result::Group', 'group_id');

# You can replace this text with custom content, and it will be preserved on regeneration
1;

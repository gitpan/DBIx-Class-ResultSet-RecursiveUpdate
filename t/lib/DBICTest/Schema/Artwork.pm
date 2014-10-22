package # hide from PAUSE
    DBICTest::Schema::Artwork;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('cd_artwork');
__PACKAGE__->add_columns(
  'cd_id' => {
    data_type => 'integer',
  },
);
__PACKAGE__->set_primary_key('cd_id');
__PACKAGE__->belongs_to('cd', 'DBICTest::Schema::CD', 'cd_id');
__PACKAGE__->has_many('images', 'DBICTest::Schema::Image', 'artwork_id');

__PACKAGE__->has_many('artwork_to_artist', 'DBICTest::Schema::Artwork_to_Artist', 'artwork_cd_id');
__PACKAGE__->many_to_many('artists', 'artwork_to_artist', 'artist');

__PACKAGE__->resultset_class( __PACKAGE__ . '::ResultSet');

package DBICTest::Schema::Artwork::ResultSet;

use base qw( DBIx::Class::ResultSet::RecursiveUpdate );


1;

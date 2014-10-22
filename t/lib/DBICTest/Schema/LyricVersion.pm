package # hide from PAUSE
    DBICTest::Schema::LyricVersion;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('lyric_versions');
__PACKAGE__->add_columns(
  'id' => {
    data_type => 'integer',
    is_auto_increment => 1,
  },
  'lyric_id' => {
    data_type => 'integer',
    is_foreign_key => 1,
  },
  'text' => {
    data_type => 'varchar',
    size => 100,
  },
);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to('lyric', 'DBICTest::Schema::Lyrics', 'lyric_id');

__PACKAGE__->resultset_class( __PACKAGE__ . '::ResultSet');

package DBICTest::Schema::LyricVersion::ResultSet;

use base qw( DBIx::Class::ResultSet::RecursiveUpdate );


1;

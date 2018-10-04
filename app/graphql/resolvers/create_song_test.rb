require 'test_helper'

class Resolvers::CreateSongTest < ActiveSupport::TestCase
  def Resolvers::CreateSong.new.call(nil, args, {})
end

test 'creating new link' do
  song = perform(
    name: 'Blood Tears',
    band: 'Blind Guardian',
  )

  assert song.persisted?
  assert_equal song.name, 'Blood Tears'
  assert_equal song.band, 'Blood Tears'
end
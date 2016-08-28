require 'rails_helper'

class TestUploader < CarrierWave::Uploader::Base
  include ApplicationUploader
end

describe ApplicationUploader do
  it { expect { class NotAnUploader; include ApplicationUploader; end }.to raise_error 'must be included in a CarrierWave uploader' }
end

describe TestUploader do
  include CarrierWave::Test::Matchers

  let(:model)    { FactoryGirl.create(:article_post) }
  let(:file)     { Rails.root.join('spec', 'support', 'assets', 'featured_image.png') }
  let(:uploader) { TestUploader.new(model) }

  before { File.open(file) { |f| uploader.store!(f) } }
  after  { uploader.remove! }

  describe '#store_dir' do
    subject { uploader.store_dir }
    it      { is_expected.to eql "uploads/test/article/post//#{model.id}" }
  end
end

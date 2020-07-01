require 'spec_helper'

RSpec.describe 'Trello::Schema::Attribute::Base' do

  let(:attribute) { Trello::Schema::Attribute::Base.new(name: name, options: options, serializer: serializer) }

  describe '#name' do
    let(:options) { nil }
    let(:serializer) { Trello::Schema::Serializer::Default }

    context 'when name is a symbol' do
      let(:name) { :name }

      it 'directly return the name' do
        expect(attribute.name).to eq(:name)
      end
    end

    context 'when name is a string' do
      let(:name) { 'name' }

      it 'directly return the symbolize name' do
        expect(attribute.name).to eq(:name)
      end
    end
  end

  describe '#readlonly?' do
    let(:name) { :name }
    let(:serializer) { Trello::Schema::Serializer::Default }

    context 'when does not explict pass readonly parameter' do
      let(:options) { nil }

      it 'return false' do
        expect(attribute.readonly?).to eq(false)
      end
    end

    context 'when does explict pass readonly parameter' do
      context 'and readonly is true' do
        let(:options) { { readonly: true } }

        it 'return true' do
          expect(attribute.readonly?).to eq(true)
        end
      end

      context 'and readonly is false' do
        let(:options) { { readonly: false } }

        it 'return false' do
          expect(attribute.readonly?).to eq(false)
        end
      end

      context 'and readonly is not a boolean' do
        let(:options) { { readonly: 'other' } }

        it 'return false' do
          expect(attribute.readonly?).to eq(false)
        end
      end
    end
  end

  describe '#update_only?' do
    let(:name) { :name }
    let(:serializer) { Trello::Schema::Serializer::Default }

    context 'when does not explict pass update_only parameter' do
      let(:options) { nil }

      it 'return false' do
        expect(attribute.update_only?).to eq(false)
      end
    end

    context 'when does explict pass update_only parameter' do
      context 'and update_only is true' do
        let(:options) { { update_only: true } }

        it 'return true' do
          expect(attribute.update_only?).to eq(true)
        end
      end

      context 'and update_only is false' do
        let(:options) { { update_only: false } }

        it 'return false' do
          expect(attribute.update_only?).to eq(false)
        end
      end

      context 'and update_only is not a boolean' do
        let(:options) { { update_only: 'other' } }

        it 'return false' do
          expect(attribute.update_only?).to eq(false)
        end
      end
    end
  end

  describe '#create_only?' do
    let(:name) { :name }
    let(:serializer) { Trello::Schema::Serializer::Default }

    context 'when does not explict pass create_only parameter' do
      let(:options) { nil }

      it 'return false' do
        expect(attribute.create_only?).to eq(false)
      end
    end

    context 'when does explict pass create_only parameter' do
      context 'and create_only is true' do
        let(:options) { { create_only: true } }

        it 'return true' do
          expect(attribute.create_only?).to eq(true)
        end
      end

      context 'and create_only is false' do
        let(:options) { { create_only: false } }

        it 'return false' do
          expect(attribute.create_only?).to eq(false)
        end
      end

      context 'and create_only is not a boolean' do
        let(:options) { { create_only: 'other' } }

        it 'return false' do
          expect(attribute.create_only?).to eq(false)
        end
      end
    end
  end

  describe '#remote_key' do
    let(:name) { :date_create_utc }
    let(:serializer) { double('serializer') }

    context 'when explict pass in remote_key' do
      context 'and remote_key is a string' do
        let(:options) { { remote_key: 'dateCreateUTC' } }

        it 'directly return the stringify remote_key' do
          expect(attribute.remote_key).to eq('dateCreateUTC')
        end
      end

      context 'and remote_key is a symbol' do
        let(:options) { { remote_key: :dateCreateUTC } }

        it 'directly return the stringify remote_key' do
          expect(attribute.remote_key).to eq('dateCreateUTC')
        end
      end
    end

    context 'when does not explict pass in remote_key' do
      let(:options) { {} }

      it 'return the stringify name' do
        expect(attribute.remote_key).to eq('date_create_utc')
      end
    end
  end

  describe '#build_attributes' do
    let(:name) { :date_create_utc }
    let(:serializer) { double('serializer') }
    let(:options) { nil }

    it 'will raise exception' do
      expect{ attribute.build_attributes({}, {}) }.to raise_error('Need override')
    end
  end

  describe '#build_payload_for_create' do
    let(:name) { :date_create_utc }
    let(:serializer) { double('serializer') }
    let(:options) { nil }

    it 'will raise exception' do
      expect{ attribute.build_payload_for_create({}, {}) }.to raise_error('Need override')
    end
  end

  describe '#build_payload_for_update' do
    let(:name) { :date_create_utc }
    let(:serializer) { double('serializer') }
    let(:options) { nil }

    it 'will raise exception' do
      expect{ attribute.build_payload_for_update({}, {}) }.to raise_error('Need override')
    end
  end

end

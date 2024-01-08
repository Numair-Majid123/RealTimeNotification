# spec/controllers/triggers_controller_spec.rb

require 'rails_helper'

RSpec.describe TriggersController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { trigger: { body: 'Test Body', to: '1234567890' } } }

      before do
        allow_any_instance_of(Twilio::REST::Client).to receive_message_chain(:messages, :create)
      end

      it 'creates a new trigger' do
        expect do
          post :create, params: valid_params
        end.to change(Trigger, :count).by(1)

        expect(response).to have_http_status(:success)
      end

      it 'sets a success flash message' do
        post :create, params: valid_params
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { trigger: { body: '', to: '123' } } }

      it 'does not create a new trigger' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Trigger, :count)

        expect(flash[:alert]).to include('Validation failed: Body can\'t be blank')
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'sets an error flash message' do
        post :create, params: invalid_params
        expect(flash[:alert]).to be_present
      end
    end

    context 'when TwilioError occurs' do
      let(:error_params) { { trigger: { body: 'Test Body', to: '1234567890' } } }

      before do
        allow_any_instance_of(Twilio::REST::Client).to receive_message_chain(:messages,
                                                                             :create).and_raise(Twilio::REST::TwilioError.new('Twilio error message'))
      end

      it 'does not create a new trigger' do
        expect do
          post :create, params: error_params
        end.not_to change(Trigger, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'sets a Twilio error flash message' do
        post :create, params: error_params
        expect(flash[:alert]).to include('Twilio error message')
      end
    end
  end
end

require 'spec_helper'

describe ResponsesController do
  describe '#show' do
    let(:form) { Form.create! }

    it 'loads' do
      get :new, form_id: form.id
      response.should be_success
    end
  end
end

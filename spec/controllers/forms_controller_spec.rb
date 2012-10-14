require 'spec_helper'

describe FormsController do
  describe '#show' do
    let(:form) { Form.create! }

    it 'loads' do
      get :show, id: form.id
      response.should be_success
    end
  end
end

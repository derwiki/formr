class ResponsesController < ApplicationController
  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responses }
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @response = Response.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/new
  # GET /responses/new.json
  def new
    raise Exception if (form_id = params[:form_id]).nil?
    #TODO turn this to eager load at the model layer
    @form = Form.where(id: form_id).includes(:questions => :answers).first
    @response = Response.new form: @form

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/1/edit
  def edit
    @response = Response.find(params[:id])
  end

  # POST /responses
  # POST /responses.json
  #   Parameters: {"utf8"=>"✓", "authenticity_token"=>"1A4ITpgU7XNO869yhEptM4Hf0QZEmCsiYjzLtZxGEsc=", "response"=>{"1"=>{"choices"=>"2"}, "28"=>{"choices"=>"112"}, "29"=>{"choices"=>"114"}, "30"=>{"choices"=>"119"}, "31"=>{"choices"=>"123"}, "32"=>{"choices"=>"127"}}, "commit"=>"Create Response"}
  def create
    raise Exception if (resp = params[:response]).nil?
    raise Exception if (form_id = params[:form_id]).nil?
    # create [question_id, answer_id] tuples for each Choice
    ActiveRecord::Base.transaction do
      @response = Response.create!(form_id: params[:form_id], user_id: viewer_id)
      resp.each do |question_id, x|
        Choice.create! response_id: @response.id, question_id: question_id,
                       answer_id: x['choices']
      end
    end

    respond_to do |format|
      if @response.save
        format.html { redirect_to request.referer, notice: 'Response was successfully created.' }
        format.json { render json: @response, status: :created, location: @response }
      else
        format.html { render action: "new" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /responses/1
  # PUT /responses/1.json
  def update
    @response = Response.find(params[:id])

    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to responses_url }
      format.json { head :no_content }
    end
  end

private

  def viewer_id
    1
  end
end

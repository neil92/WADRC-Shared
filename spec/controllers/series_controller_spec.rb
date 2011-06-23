require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe SeriesController do

  def mock_series(stubs={})
    @mock_series ||= mock_model(Series, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all series as @series" do
      Series.stub_chain(:search, :relation, :page) { [mock_series] }
      get :index
      assigns(:series).should eq([mock_series])
    end
  end

  describe "GET show" do
    it "assigns the requested series as @series" do
      Series.stub(:find).with("37") { mock_series }
      get :show, :id => "37"
      assigns(:series).should be(mock_series)
    end
  end

  describe "GET new" do
    it "assigns a new series as @series" do
      Series.stub(:new) { mock_series }
      get :new
      assigns(:series).should be(mock_series)
    end
  end

  describe "GET edit" do
    it "assigns the requested series as @series" do
      Series.stub(:find).with("37") { mock_series }
      get :edit, :id => "37"
      assigns(:series).should be(mock_series)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created series as @series" do
        Series.stub(:new).with({'these' => 'params'}) { mock_series(:save => true) }
        post :create, :series => {'these' => 'params'}
        assigns(:series).should be(mock_series)
      end

      it "redirects to the created series" do
        Series.stub(:new) { mock_series(:save => true) }
        post :create, :series => {}
        response.should redirect_to(series_url(mock_series))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved series as @series" do
        Series.stub(:new).with({'these' => 'params'}) { mock_series(:save => false) }
        post :create, :series => {'these' => 'params'}
        assigns(:series).should be(mock_series)
      end

      it "re-renders the 'new' template" do
        Series.stub(:new) { mock_series(:save => false) }
        post :create, :series => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested series" do
        Series.stub(:find).with("37") { mock_series }
        mock_series.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :series => {'these' => 'params'}
      end

      it "assigns the requested series as @series" do
        Series.stub(:find) { mock_series(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:series).should be(mock_series)
      end

      it "redirects to the series" do
        Series.stub(:find) { mock_series(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(series_url(mock_series))
      end
    end

    describe "with invalid params" do
      it "assigns the series as @series" do
        Series.stub(:find) { mock_series(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:series).should be(mock_series)
      end

      it "re-renders the 'edit' template" do
        Series.stub(:find) { mock_series(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested series" do
      Series.stub(:find).with("37") { mock_series }
      mock_series.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the series list" do
      Series.stub(:find) { mock_series }
      delete :destroy, :id => "1"
      response.should redirect_to(series_index_url)
    end
  end

end
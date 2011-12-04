require 'test_helper'

class PacketsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Packet.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Packet.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Packet.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to packet_url(assigns(:packet))
  end

  def test_edit
    get :edit, :id => Packet.first
    assert_template 'edit'
  end

  def test_update_invalid
    Packet.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Packet.first
    assert_template 'edit'
  end

  def test_update_valid
    Packet.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Packet.first
    assert_redirected_to packet_url(assigns(:packet))
  end

  def test_destroy
    packet = Packet.first
    delete :destroy, :id => packet
    assert_redirected_to packets_url
    assert !Packet.exists?(packet.id)
  end
end

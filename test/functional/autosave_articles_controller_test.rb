require 'test_helper'

class AutosaveArticlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:autosave_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create autosave_article" do
    assert_difference('AutosaveArticle.count') do
      post :create, :autosave_article => { }
    end

    assert_redirected_to autosave_article_path(assigns(:autosave_article))
  end

  test "should show autosave_article" do
    get :show, :id => autosave_articles(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => autosave_articles(:one).id
    assert_response :success
  end

  test "should update autosave_article" do
    put :update, :id => autosave_articles(:one).id, :autosave_article => { }
    assert_redirected_to autosave_article_path(assigns(:autosave_article))
  end

  test "should destroy autosave_article" do
    assert_difference('AutosaveArticle.count', -1) do
      delete :destroy, :id => autosave_articles(:one).id
    end

    assert_redirected_to autosave_articles_path
  end
end

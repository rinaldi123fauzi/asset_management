require 'test_helper'

class SiteProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_project = site_projects(:one)
  end

  test "should get index" do
    get site_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_site_project_url
    assert_response :success
  end

  test "should create site_project" do
    assert_difference('SiteProject.count') do
      post site_projects_url, params: { site_project: { name: @site_project.name } }
    end

    assert_redirected_to site_project_url(SiteProject.last)
  end

  test "should show site_project" do
    get site_project_url(@site_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_project_url(@site_project)
    assert_response :success
  end

  test "should update site_project" do
    patch site_project_url(@site_project), params: { site_project: { name: @site_project.name } }
    assert_redirected_to site_project_url(@site_project)
  end

  test "should destroy site_project" do
    assert_difference('SiteProject.count', -1) do
      delete site_project_url(@site_project)
    end

    assert_redirected_to site_projects_url
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.delete_all
Article.delete_all

@user1 = User.create! :email => 'one@communityguides.eu', :password => '123456', :fullname => 'User One Admin', :country_id => '1', :weburl => 'http://www.communityguides.eu', :shortbio => 'Short biography of Admin'
@user1.confirm!
@user2 = User.create! :email => 'two@communityguides.eu', :password => '123456', :fullname => 'User Two', :country_id => '2', :weburl => 'http://www.communityguides.eu', :shortbio => 'Short biography of User2'
@user2.confirm!

@article = @user1.articles.create! :title => 'Article No. 1', :state => 1, :message => '', :version => 'Version Info', :changelog => 'Changelog', :submitted => Time.now, :accepted => Time.now + 2.day, :teaser => "CommunityGuides", :body => "h1. Article 1"
@article = @user1.articles.create! :title => 'Article No. 2', :state => 1, :message => '', :version => 'Version Info', :changelog => 'Changelog', :submitted => Time.now, :accepted => Time.now + 2.day, :teaser => "CommunityGuides", :body => "h1. Article 2"
@article = @user1.articles.create! :title => 'Article No. 3', :state => 2, :message => '', :version => 'Version Info', :changelog => 'Changelog', :submitted => Time.now, :accepted => Time.now + 2.day, :teaser => "CommunityGuides", :body => "h1. Article 3"
@article = @user1.articles.create! :title => 'Article No. 4', :state => 3, :message => '', :version => 'Version Info', :changelog => 'Changelog', :submitted => Time.now, :accepted => Time.now + 2.day, :teaser => "CommunityGuides", :body => "h1. Article 4"
@article = @user1.articles.create! :title => 'Article No. 5', :state => 4, :message => '', :version => 'Version Info', :changelog => 'Changelog', :submitted => Time.now, :accepted => Time.now + 2.day, :teaser => "CommunityGuides", :body => "h1. Article 5"



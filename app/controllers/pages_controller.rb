class PagesController < ApplicationController
  def home
    @blogs = Blog.all
    @skils = Skill.all
  end

  def about
    @skils = Skill.all
  end

  def contact
  end
end

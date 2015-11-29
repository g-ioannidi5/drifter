class DrifterController < ApplicationController
  def index
    @post = Post.new
  end
  
  def home
    @post = Post.new
  end

  def about
  end

  def profile
  end

  def beenTo
  end

  def wishTo
  end
end

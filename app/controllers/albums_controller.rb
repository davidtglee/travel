class AlbumsController < ApplicationController
  def index
    @albums = Album.all

    render("albums/index.html.erb")
  end

  def show
    @album = Album.find(params[:id])

    render("albums/show.html.erb")
  end

  def new
    @album = Album.new

    render("albums/new.html.erb")
  end

  def create
    @album = Album.new

    @album.user_id = params[:user_id]

    save_status = @album.save

    if save_status == true
      redirect_to("/albums/#{@album.id}", :notice => "Album created successfully.")
    else
      render("albums/new.html.erb")
    end
  end

  def edit
    @album = Album.find(params[:id])

    render("albums/edit.html.erb")
  end

  def update
    @album = Album.find(params[:id])

    @album.user_id = params[:user_id]

    save_status = @album.save

    if save_status == true
      redirect_to("/albums/#{@album.id}", :notice => "Album updated successfully.")
    else
      render("albums/edit.html.erb")
    end
  end

  def destroy
    @album = Album.find(params[:id])

    @album.destroy

    if URI(request.referer).path == "/albums/#{@album.id}"
      redirect_to("/", :notice => "Album deleted.")
    else
      redirect_to(:back, :notice => "Album deleted.")
    end
  end
end

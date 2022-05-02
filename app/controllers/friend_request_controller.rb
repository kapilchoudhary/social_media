class FriendRequestController < ApplicationController
  before_action :require_login 

  def send_request
    if user_persent?(params)
      friend = FriendRequest.new(requestor_id:current_user.id, receiver_id:params[:receiver_id])
      if friend.save
        render json: {message: "Request has sent"}
      else
        render json: {errors: friend.errors.messages}
      end
    else
      render json: {message: "This user is not persent"}
    end
  end

  def accept_request
    request = FriendRequest.find(params[:id])
    if request
      request.update(status: true)
      render json: {message: "Request has accepted"}
    else
      render json: {message: "There have a no friend request"}
    end
  end

  def remove_request
    FriendRequest.find(params[:1]).destroy
    render = json: {message: "Successfully Remove"}
  end

  def my_friends
    request = current_user&.friend_receiver.where(status: true)
    if request
      render json: {receiver: request.map{|friend| FriendRequestorSerializer.new(friend)}}
    else
      render json: {message: "Friends are persent "}
    end
  end

  def panding_request
    request = current_user&.friend_receiver.where(status: false)
    if request
      render json: {receiver: request.map{|friend| FriendRequestorSerializer.new(friend)}}
    else
      render json: {message: "No Friends Request are persent "}
    end
  end

  private

  def user_persent?(params)
    user = User.find(params[:receiver_id])
    if User.find(params[:receiver_id])
      true
    else
      false
    end
  end

end

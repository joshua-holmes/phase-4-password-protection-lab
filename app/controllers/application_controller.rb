class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  private

  def record_not_found e
    render json: { error: e.message }, status: :not_found
  end

  def invalid_record e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  # def authorized
  #   unless session.include? :user_id
  #   return render json: { error: "Not Authorized" }, status: :unauthorized
  # end

end

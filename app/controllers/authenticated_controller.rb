# Base class for any controller that requires sign in
class AuthenticatedController < ApplicationController
  before_filter :authenticate_user!
end

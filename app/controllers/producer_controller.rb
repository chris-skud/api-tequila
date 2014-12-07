class ProducerController < ApplicationController

  def index
    @producers = Producer.all
    render json: @producers, root: :producers, each_serializer: ProducerSerializer

  end
end

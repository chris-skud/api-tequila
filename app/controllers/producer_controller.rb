class ProducerController < ApplicationController

  def index
    producers = Producer.all
    render json: producers, root: :producers, each_serializer: ProducerSerializer
  end

  def show
    producer = Producer.find_by(id: params[:id])

    if producer
      render json: producer
    else
      not_found
    end
  end

  def create
    producer = Producer.create(producer_params)
    render status: :created, json: producer
  end

  private

  def producer_params
    params.require(:producer).permit(:name, :nom, :dot, :address, :telephone)
  end
end

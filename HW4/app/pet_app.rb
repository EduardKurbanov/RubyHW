require 'erb'
require 'rack'
require_relative 'pet_interaction'

class Application
  attr_reader :request, :path
  attr_accessor :pet_interaction

  def call(env)
    @request = Rack::Request.new(env)
    @path = request.path

    response.finish
  end

  def response
    case path
    when '/'
      rack_response('start_page.html.erb')
    when '/create_pet'
      name = request.params['name']

      return rack_response_redirect if name.nil? || name.length.zero?

      @pet_interaction = PetInteraction.new(name)
      rack_response_redirect('/main')
    when '/main'
      return rack_response_redirect if pet_interaction.nil?

      rack_response('main.html.erb')
    when '/study'
      return rack_response_redirect if pet_interaction.nil?
      pet_interaction.study
      p pet_interaction.is_pet_alive
      if pet_interaction.is_pet_alive == false
          rack_response_redirect('/pet_pass_away')
      else
          rack_response_redirect('/main')
      end
    when '/sleep'
      return rack_response_redirect if pet_interaction.nil?
      pet_interaction.dream
      rack_response_redirect('/main')
    when '/walk'
      return rack_response_redirect if pet_interaction.nil?
      pet_interaction.stroll
      if pet_interaction.is_pet_alive == false
          rack_response_redirect('/pet_pass_away')
      else
          rack_response_redirect('/main')
      end
    when '/clean'
      return rack_response_redirect if pet_interaction.nil?
      pet_interaction.cleaning
      rack_response_redirect('/main')
    when '/toilet'
      return rack_response_redirect if pet_interaction.nil?
      pet_interaction.go_to_the_toilet
      rack_response_redirect('/main')
    when '/feed'
      return rack_response_redirect if pet_interaction.nil?
      pet_interaction.feed
      if pet_interaction.is_pet_alive == false
          rack_response_redirect('/pet_pass_away')
      else
          rack_response_redirect('/main')
      end
    when '/pet_pass_away'
      @pet_interaction = nil
      rack_response('pet_pass_away.html.erb')
    when'/exit'
      @pet_interaction = nil
      rack_response_redirect('/')
    else
      rack_response_redirect('/main')
    end
  end

  def rack_response(filename)
    Rack::Response.new(render(filename))
  end

  def render(filename)
    ERB.new(File.read("./app/views/#{filename}")).result(binding)
  end

  def rack_response_redirect(new_path = '/')
    Rack::Response.new do |response|
      response.redirect(new_path)
    end
  end
end
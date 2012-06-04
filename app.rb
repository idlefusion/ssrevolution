require 'rubygems'
require 'sinatra'
require 'hominid' # MailChimp

configure do

  # MailChimp configuration: ADD YOUR OWN ACCOUNT INFO HERE!
  set :mailchimp_api_key, "b5570879d08eed0513f6e19fef313059-us4"
  set :mailchimp_list_name, "Info"

end

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/backpacklove' do
  File.read(File.join('public', 'backpacklove.html'))
end

get '/contact' do
  File.read(File.join('public', 'contact.html'))
end

get '/testimonial' do
  File.read(File.join('public', 'contact.html'))
end

post '/signup' do
  email = params[:email]
  unless email.nil? || email.strip.empty?
    mailchimp = Hominid::API.new(settings.mailchimp_api_key)
    list_id = mailchimp.find_list_id_by_name(settings.mailchimp_list_name)
    raise "Unable to retrieve list id from MailChimp API." unless list_id
    mailchimp.list_subscribe(list_id, email, {}, 'html', false, true, true, false)
  end
  "Success."
end

not_found do
  File.read(File.join('public', '404.html'))
end
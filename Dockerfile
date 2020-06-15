FROM ruby:2.6

RUN apt-get update -qq && apt-get install -y nodejs

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler
RUN bundle install
COPY . .

ENV RAILS_ENV production 
# Init script
# COPY init.sh /
# RUN chmod +x /init.sh
# ENTRYPOINT [ "/init.sh" ]

EXPOSE 3011
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
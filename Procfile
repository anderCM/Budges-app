release: chmod +x bin/rails
web: rake db:migrate && rake db:seed && rails db:fixtures:load && bin/rails server -b 0.0.0.0 -p ${PORT:-3000} & bin/rails tailwindcss:watch
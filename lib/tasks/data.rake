# -*- coding: utf-8 -*-
namespace :data do
  desc "Import initial data from previous production environment by directly executing SQL"
  task import_data: :environment do
    # problem_short.sql は kadaikanris テーブルの insert文だけとする
    sql_file = Rails.root.join("db", "problem_kadaikanris.sql")

    unless File.exist?(sql_file)
      puts "Error: problem_short.sql is not found at #{sql_file}"
      exit 1
    end

    ActiveRecord::Base.connection.execute("TRUNCATE TABLE kadaikanris;")
    puts "kadaikanris table truncated."

    # ActiveRecord::Base.connection.execute(sql_file.read)
    puts "root password=#{ENV['MYSQL_ROOT_PASSWORD']}"
    `mysql -u root -ppassword #{ENV['MYSQL_ROOT_PASSWORD']} --default-character-set=utf8mb4 < #{sql_file}`
    puts "problem_kadaikanrisa.sql imported successfully into kadaikanris table."
  end

end

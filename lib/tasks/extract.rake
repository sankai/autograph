namespace :extract do
  # descの記述は必須
  desc "Extract Autographs"
  # :environment は モデルにアクセスするのに必須
  task :extract => :environment do
    # 処理を記述
    Autograph.all().each do | o |
      puts o.name + ' ' + o.created_at.to_s + ' ' + o.updated_at.to_s
    end
  end
end

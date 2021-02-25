# frozen_string_literal: true

print '開発環境のデータをすべて削除して初期データを投入します。よろしいですか？[Y/n]: ' # rubocop:disable Rails/Output
unless $stdin.gets.chomp == 'Y'
  puts '中止しました。' # rubocop:disable Rails/Output
  return
end

User.destroy_all
Company.destroy_all


company_aaa = Company.create!(name: "株式会社aaa")
company_bbb = Company.create!(name: "bbb株式会社")
company_eee = Company.create!(name: "株式会社eee")
company_admin = Company.create!(name: "株式会社admin")

company_aaa.users.create!(email: 'aaa@aaa', password: 'password', postal_code: '111-111', address: 'tokyo', self_introduction: '自己紹介', company_admin: true)
company_aaa.users.create!(email: 'bbb@aaa', password: 'password', postal_code: '111-111', address: 'tokyo', self_introduction: '自己紹介')
company_aaa.users.create!(email: 'ccc@aaa', password: 'password', postal_code: '111-111', address: 'tokyo', self_introduction: '自己紹介')
company_bbb.users.create!(email: 'aaa@bbb', password: 'password', postal_code: '111-111', address: 'tokyo', self_introduction: '自己紹介', company_admin: true)
company_bbb.users.create!(email: 'bbb@bbb', password: 'password', postal_code: '111-111', address: 'tokyo', self_introduction: '自己紹介')
company_bbb.users.create!(email: 'ccc@bbb', password: 'password', postal_code: '111-111', address: 'tokyo', self_introduction: '自己紹介')
company_eee.users.create!(email: 'eee@eee', password: 'password', postal_code: '111-111', address: 'tokyo', self_introduction: '自己紹介')
company_admin.users.create!(email: 'admin@example.jp', password: 'password', admin: true)

def picture_file(name)
  File.open(Rails.root.join("db/seeds/#{name}"))
end

Book.destroy_all

Book.create!(
  title: 'Ruby超入門',
  memo: 'Rubyの文法の基本をやさしくていねいに解説しています。',
  author: '五十嵐 邦明',
  picture: picture_file('cho-nyumon.jpg')
)

Book.create!(
  title: 'チェリー本',
  memo: 'プログラミング経験者のためのRuby入門書です。',
  author: '伊藤 淳一',
  picture: picture_file('cherry-book.jpg')
)

Book.create!(
  title: '楽々ERDレッスン',
  memo: '実在する帳票から本当に使えるテーブル設計を導く画期的な本！',
  author: '羽生 章洋',
  picture: picture_file('erd.jpg')
)

50.times do
  Book.create!(
    title: Faker::Book.title,
    memo: Faker::Book.genre,
    author: Faker::Book.author,
    picture: picture_file('no-image.png')
  )
end

puts '初期データの投入が完了しました。' # rubocop:disable Rails/Output

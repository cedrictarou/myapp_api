ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# 追加
# gem 'minitest-reporters' setup
require 'minitest/reporters'
Minitest::Reporters.use!
# ここまで

class ActiveSupport::TestCase # rubocop:disable Style/ClassAndModuleChildren
  # プロセスが分岐した直後に呼び出す
  parallelize_setup do |worker| # rubocop:disable Lint/UnusedBlockArgument
    load "#{Rails.root}/db/seeds.rb"
  end
  # ここまで
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # アクティブユーザーを返す
  def active_user
    User.find_by(activated: true)
  end

  # Add more helper methods to be used by all tests here...
end

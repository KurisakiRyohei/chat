class User < ApplicationRecord
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  PASSWORD_FORMAT = /\A[a-zA-Z0-9_-]{9,}\Z/

  attr_accessor :session_id
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :msgs
  has_many :unread_msgs

  validates :name, presence: true

  validates :email,
    presence: true,
    format: EMAIL_FORMAT,
    uniqueness: true

  #NOTE: 新規会員登録
  def self.register(name, email, password)
    errs = validate_password(password)
    if errs.length > 0
      return Result.new(errs, nil)
    end

    hashed_password = User.hash(password)
    user = User.new(
      name: name,
      email: email,
      hashed_password: hashed_password
    )

    if user.save
      return Result.new([], user)
    else
      return Result.new(user.errors.full_messages, user)
    end
    # passwordのバリデーションをする
    # userを作成する。
      # trure: OK
      # false: ng
  end

  #NOTE: ログイン
  def self.login(email, password)
    hashed_password = hash(password)
    user = User.find_by(email: email, hashed_password: hashed_password)

    if user.nil?
      return Result.new(["メールかバスワードが間違っています。", nil])
    end

    session_id = SecureRandom.uuid
    user.session_id = session_id
    r = SessionStorage.set(session_id, user.id)
    if !r.success?
      return Result.new(["セッション情報の保存に失敗しました", nil])
    end
    return Result.new([], user)
  end

  def logout
    r = SessionStorage.rm(session_id)
    if !r.success?
      return Result.new(["セッション情報の削除に失敗しました。", nil])
    end
    return Result.new([], nil)
  end

  private
  def self.hash(string)
    Digest::SHA256.hexdigest(string)
  end

  def self.validate_password(password)
    errs = []
    if password.nil? || password == ""
      errs << "パスワードは必須です。"
      return errs
    end

    has_char = !password.index(/[a-zA-z]/).nil?
    has_num = !password.index(/[0-9]/).nil?
    has_sym = !password.index(/[_-]/).nil?

    if !PASSWORD_FORMAT.match?(password) || !has_char || !has_num ||!has_sym
      errs << "パスワードは9文字以上で、英字, 数字、記号(-か_)をそれぞれ１つ以上含む必要があります"
    end

    return errs
  end
  # def self.register(name, email, password)
  #   password_errs = validate_password(password)
  #   if !password_errs.empty?
  #     return Result.new(password_errs)
  #   end

  #   hashed_password = Digest::SHA256.hexdigest(password)
  #   user = User.new(name: name, email: email, hashed_password: hashed_password)
  #   if user.save
  #     return Result.new
  #   else
  #     return Result.new(user.errors.full_messages)
  #   end
  # end

  # private

  # def self.validate_password(password)
  #   errs = []

  #   if password.nil? || password == ""
  #     errs << "パスワードは必須です"
  #     return errs
  #   end

  #   has_char = !password.index(/[a-zA-z]/).nil?
  #   has_num = !password.index(/[0-9]/).nil?
  #   has_sym = !password.index(/[_-]/).nil?
  #   if !PASSWORD_FORMAT.match?(password) || !has_char || !has_num || !has_sym
  #     errs <<
  #       "パスワードは9文字以上で、英字, 数字、記号(-か_)をそれぞれ１つ以上含む必要があります"
  #   end

  #   return errs
  # end
end
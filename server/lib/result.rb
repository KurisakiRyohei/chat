class Result
  attr_accessor :errs, :data

  #errs: エラー内容を示す文字列の配列
  #data: 何かしらのオブジェクト
  def initialize(errs, data)
    @errs = errs
    @data = data
  end

  def success?
    errs.empty?
  end
end
# Q1.
# 次の動作をする A1 class を実装する
# - "//" を返す "//"メソッドが存在すること
class A1
  define_method '//', ->{ '//' }
end

# Q2.
# 次の動作をする A2 class を実装する
# - 1. "SmartHR Dev Team"と返すdev_teamメソッドが存在すること
# - 2. initializeに渡した配列に含まれる値に対して、"hoge_" をprefixを付与したメソッドが存在すること
# - 2で定義するメソッドは下記とする
#   - 受け取った引数の回数分、メソッド名を繰り返した文字列を返すこと
#   - 引数がnilの場合は、dev_teamメソッドを呼ぶこと
# - また、2で定義するメソッドは以下を満たすものとする
#   - メソッドが定義されるのは同時に生成されるオブジェクトのみで、別のA2インスタンスには（同じ値を含む配列を生成時に渡さない限り）定義されない

class A2
  def initialize(method_names)
    define_hoge_methods(method_names)
  end

  def dev_team
    'SmartHR Dev Team'
  end

  private

  def define_hoge_methods(method_names)
    method_names.each do |method_name|
      define_singleton_method "hoge_#{method_name}" do |count|
        return dev_team if count.nil?
        "hoge_#{method_name}" * count
      end
    end
  end
end

# Q3.
# 次の動作をする OriginalAccessor モジュール を実装する
# - OriginalAccessorモジュールはincludeされたときのみ、my_attr_accessorメソッドを定義すること
# - my_attr_accessorはgetter/setterに加えて、boolean値を代入した際のみ真偽値判定を行うaccessorと同名の?メソッドができること

module OriginalAccessor

  def self.included(klass)
    klass.define_singleton_method "my_attr_accessor" do |method_name|
      define_method method_name do
        @name
      end

      define_method "#{method_name}=" do |operand|
        @name = operand
      end

      define_method "#{method_name}?" do |operand|
      end
    end
  end
end

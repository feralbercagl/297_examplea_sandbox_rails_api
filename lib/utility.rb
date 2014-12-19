module Utility

  # This method returns the latest version class for a given object name
  def self.latest_version_object_class(object_name)
    "V#{latest_api_version}::#{object_name}".constantize
  end

  # This method returns the latest build version
  def self.latest_api_version
    3
  end

  # Builds hash for +serializable_hash+ method with nested relation given.
  #
  # Examples:
  # +engine.name+ will result in the hash:
  # {:include => :engine}
  #
  # +engine.description+ will result in the hash:
  # {:include => :engine}
  #
  # +engine.pistons.name+ will result in the hash:
  # {:include => {:engine => {:include => :pistons}}}
  def self.build_serializable_hash_options(str)
    tokens = str.split(".")
    return {} if tokens.size < 2

    include_hash = {:include => {}}
    tokens_with_includes = tokens.inject([]) { |res, elem| res.push(:include, elem) }

    tokens_with_includes_ignore_last = tokens_with_includes.dup
    # Pop out the last two as it's not needed.
    tokens_with_includes_ignore_last.pop
    tokens_with_includes_ignore_last.pop
    tokens_with_includes_ignore_last.inject(include_hash) do |hash, arg|
      if hash[arg].blank?
        hash[arg] = {}
      end
    end

    # Find key to last element in nested hash
    last_arg = nil
    last_hash = tokens_with_includes_ignore_last.inject(include_hash) do |hash, arg|
      last_arg = arg
      hash[arg] || break
    end

    # The last hash in the nested hash should be {:include => :something}
    last_hash = tokens[tokens.size-2].to_sym
    tokens_with_includes_ignore_last.inject(include_hash) do |hash, arg|
      if hash[arg].keys.first.to_s == last_arg.to_s
        hash[arg] = last_hash
        break
      end
      hash[arg] || break
    end

    include_hash
  end

end

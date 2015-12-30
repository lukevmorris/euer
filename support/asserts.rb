SpecError = Class.new(StandardError)
def assert_equal(val1, val2)
  if val1 != val2
    raise SpecError.new("Expected #{val1} == #{val2}")
  end
end

def assert_true(val)
  raise SpecError.new("Expected #{val} to be truthy") unless val
end

def assert_false(val)
  raise SpecError.new("Expected #{val} to be truthy") if val
end

local matchers = {
  -- Class Matchers
  {
    label = 'be_an_instance_of',
    doc = 'passes if `actual.class == expected`'
  },
  {
    label = 'be_a',
    doc = 'passes if `actual.kind_of?(expected)`',
  },
  {
    label = 'be_an',
    doc = 'passes if `actual.kind_of?(expected)`',
    alias = 'be_a'
  },
  {
    label = 'be_a_kind_of',
    doc = 'passes if `actual.kind_of?(expected)`',
    alias = 'be_a'
  },

  -- Equivalence && Identity
  {
    label = 'eq',
    doc = '# passes if `actual == expected`'
  },
  {
    label = 'eql',
    doc = '# passes if `actual.eql?(expected)`'
  },
  {
    label = 'be',
    doc = '# passes if `actual.equal?(expected)`'
  },
  {
    label = 'equal',
    doc = '# passes if `actual.equal?(expected)`'
  },
}

return matchers

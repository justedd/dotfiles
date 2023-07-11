local matchers = {
  -- Class Matchers
  {
    label = 'be_an_instance_of',
    doc = 'passes if `actual.class == expected`'
  },
  {
    label = 'be_instance_of',
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
  {
    label = 'be_kind_of',
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
    doc = [[
# passes if `actual.equal?(expected)`'
# Other Examples:
```ruby
expect(actual).to be >  expected
expect(actual).to be >= expected
expect(actual).to be <= expected
expect(actual).to be <  expected
```
    ]]
  },
  {
    label = 'equal',
    doc = '# passes if `actual.equal?(expected)`'
  },
  {
    label = 'be_within',
    doc = '`expect(actual).to be_within(delta).of(expected)`'
  },




  -- Shoulda
  --
  -- Active Record
  {
    label = 'accept_nested_attributes_for',
    doc = 'tests usage of the accepts_nested_attributes_for macro.',
  },
  {
    label = 'belong_to',
    doc = 'tests your belongs_to associations.',
  },
  {
    label = 'define_enum_for',
    doc = 'tests usage of the enum macro.',
  },
  {
    label = 'have_and_belong_to_many',
    doc = 'tests your has_and_belongs_to_many associations.',
  },
  {
    label = 'have_db_column',
    doc = 'tests that the table that backs your model has a specific column.',
  },
  {
    label = 'have_db_index',
    doc = 'tests that the table that backs your model has an index on a specific column.',
  },
  {
    label = 'have_implicit_order_column',
    doc = 'tests usage of implicit_order_column.',
  },
  {
    label = 'have_many',
    doc = 'tests your has_many associations.',
  },
  {
    label = 'have_many_attached',
    doc = 'tests your has_many_attached associations.',
  },
  {
    label = 'have_one',
    doc = 'tests your has_one associations.',
  },
  {
    label = 'have_one_attached',
    doc = 'tests your has_one_attached associations.',
  },
  {
    label = 'have_readonly_attribute',
    doc = 'tests usage of the attr_readonly macro.',
  },
  {
    label = 'have_rich_text',
    doc = 'tests your has_rich_text associations.',
  },
  {
    label = 'serialize',
    doc = 'tests usage of the serialize macro.',
  },
  {
    label = 'validate_uniqueness_of',
    doc = 'tests usage of validates_uniqueness_of.',
  },
}


return matchers

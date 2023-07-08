local source = {}

local cmp = require'cmp'

function _G.debug_put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

---Return whether this source is available in the current context or not (optional).
---@return boolean
function source:is_available()
  return true
end

---Return the debug name of this source (optional).
---@return string
function source:get_debug_name()
  return 'debug name'
end

---Return LSP's PositionEncodingKind.
---@NOTE: If this method is ommited, the default value will be `utf-16`.
---@return lsp.PositionEncodingKind
function source:get_position_encoding_kind()
  return 'utf-16'
end

---Return the keyword pattern for triggering completion (optional).
---If this is ommited, nvim-cmp will use a default keyword pattern. See |cmp-config.completion.keyword_pattern|.
---@return string
function source:get_keyword_pattern()
  return [[\k\+]]
end

---Return trigger characters for triggering completion (optional).
function source:get_trigger_characters()
  return { '.' }
  --return { "it_behaves_like \'" }
end

local class_matchers = {
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
  }
}

---Invoke completion (required).
---@param params cmp.SourceCompletionApiParams
---@param callback fun(response: lsp.CompletionResponse|nil)
function source:complete(params, callback)
  debug_put(params)
  debug_put(params['context']['cursor_before_line'])
  local filename = vim.fn.expand('%:t')
  debug_put(filename)

  if not string.find(filename, "_spec.rb") then
    return callback({})
  end

  local items = {}

  for i, item in ipairs(class_matchers) do
    local doc = item.doc or ''

    if doc and item.alias then
      doc = doc .. "\n_alias_ " .. item.alias
    end

    items[i] = {
      label = item.label,
      kind = cmp.lsp.CompletionItemKind.Text,
      documentation = {
        kind = cmp.lsp.MarkupKind.Markdown,
        value = doc
      }
    }
  end

  callback(items)
end

---Resolve completion item (optional). This is called right before the completion is about to be displayed.
---Useful for setting the text shown in the documentation window (`completion_item.documentation`).
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:resolve(completion_item, callback)
  callback(completion_item)
end

---Executed after the item was selected.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:execute(completion_item, callback)
  callback(completion_item)
end

---Register your source to nvim-cmp.
require('cmp').register_source('custom_source', source)


-- rg shared_examples_for --no-filename --no-line-number ./spec | grep .
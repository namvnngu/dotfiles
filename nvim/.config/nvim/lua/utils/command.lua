local M = {}

---@class StartJobOptions
---@field on_stdout? fun(data: string[])
---@field on_exit? fun(code: number)
---@field input? string

---@param cmd string
---@param opts? StartJobOptions
---@return number | 'the job id'
function M.start_job(cmd, opts)
  opts = opts or {}
  local id = vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    ---@param data string[]
    on_stdout = function(_, data, _)
      if data and opts.on_stdout then
        opts.on_stdout(data)
      end
    end,
    on_exit = function(_, code, _)
      if opts.on_exit then
        opts.on_exit(code)
      end
    end,
  })

  if opts.input then
    vim.fn.chansend(id, opts.input)
    vim.fn.chanclose(id, 'stdin')
  end

  return id
end

---@param command string
---@return string
function M.generate_cd_cmd(command)
  return 'cd ' .. vim.fn.shellescape(vim.fn.expand('%:p:h')) .. ' && ' .. command
end

return M

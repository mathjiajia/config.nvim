local dap = require 'dap'
dap.adapters.python = {
  type = 'executable';
  command = '.virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

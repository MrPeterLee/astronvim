local utils = require("user.utils")

local M = {}

local function get_project_root_folder()
	local output = vim.api.nvim_exec("!git rev-parse --show-toplevel", true)
	output = vim.split(output, "\n", { plain = true })[3]
	output = vim.trim(output)
	return output
end

local function len(list)
	-- Return the length of a list
	local count = 0
	for _ in pairs(list) do
		count = count + 1
	end
	return count
end

local function get_folder_path(filepath)
	-- Return the folder (excluding the filename) of the filepath
	local elements = vim.split(filepath, "/", { plain = true })
	local count = len(elements)

	-- Get current folder
	local folder = table.concat({ unpack(elements, 1, count - 1) }, "/")
	return folder
end

local function get_filename(filepath)
	-- Return the filename of the filepath
	local elements = vim.split(filepath, "/", { plain = true })
	local count = len(elements)
	return elements[count]
end

local function get_testfile_path(project_root, filename, elements)
	-- Strip the relative path to obtain the test file path
	local count = len(elements)
	return project_root .. "/test/" .. table.concat({ unpack(elements, 2, count) }, "/") .. "/test_" .. filename
end

local function get_sourcefile_path(project_root, filename, elements)
	-- Strip the relative path to obtain the source file path
	local count = len(elements)
	-- extract the project name
	local list = vim.split(project_root, "/", { plain = true })
	local project_name = list[len(list)]
	-- remove 'test_' from the filename
	local target_filename = string.gsub(filename, "test_", "")

	return project_root
		.. "/"
		.. project_name
		.. "/"
		.. table.concat({ unpack(elements, 2, count) }, "/")
		.. "/"
		.. target_filename
end

function M.main(filepath)
	-- Automatically open the alternative file
	-- Get current folder
	local folder = get_folder_path(filepath)

	-- Get current filename
	local filename = get_filename(filepath)

	-- Get project root folder
	local project_root = get_project_root_folder()
	local relative_path = string.gsub(folder, project_root, "")

	-- If not a python file, do nothing
	if not vim.endswith(filename, ".py") then
		utils.quick_notification("No alternative file configured for this filetype: " .. filename)
		return
	end

	-- If __init__.py, do nothing
	if filename == "__init__.py" then
		utils.quick_notification("No alternative file configured for: " .. filename)
		return
	end

	-- Case 1: if inside the test folder
	local elements = vim.split(relative_path, "/", { plain = true })
	local count = len(elements)
	-- first element is empty
	elements = { unpack(elements, 2, count) }

	local target_filepath = ""
	local target_filetype = ""
	if elements[1] == "test" then
		target_filepath = get_sourcefile_path(project_root, filename, elements)
		target_filetype = "SOURCE"
	else
		target_filepath = get_testfile_path(project_root, filename, elements)
		target_filetype = "TEST"
	end

	utils.quick_notification("Jump to " .. target_filetype .. " file at:" .. "\n    " .. target_filepath)

	-- Open the file
	vim.cmd("e " .. target_filepath)
end

-- logger.info('getting alt file for:' .. file)
-- logger.info('  >   type: ' .. a_type)
-- logger.info('  >  parse: ' .. request_parse)
-- logger.info('  > config: ' .. conf_path)
-- alt_config_json = get_project_config(conf_path)
-- if project_config[alt_config_json.root] == nil
--     and is_config_changed(conf_path) == 0
--     and request_parse == 0 then
--     load_cache()
--     if project_config[alt_config_json.root] == nil
--         or project_config[alt_config_json.root][file] == nil then
--         parse(alt_config_json)
--     end
-- else
--     parse(alt_config_json)
-- end
-- if project_config[alt_config_json.root] ~= nil
--     and project_config[alt_config_json.root][file] ~= nil
--     and project_config[alt_config_json.root][file][a_type] ~= nil then
--     return project_config[alt_config_json.root][file][a_type]
-- else
--     return ''
-- end

return M

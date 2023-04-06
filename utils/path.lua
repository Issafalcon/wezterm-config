local path = {}

function path.convert_home_dir(path)
	local cwd = path
	local home = os.getenv("HOME")
	cwd = home and cwd:gsub("^" .. home .. "/", "~/") or ""
	if cwd == "" then
		return path
	end
	return cwd
end

function path.file_exists(fname)
	local stat = vim.loop.fs_stat(vim.fn.expand(fname))
	return (stat and stat.type) or false
end

function path.convert_useful_path(dir)
	local cwd = path.convert_home_dir(dir)
	return path.basename(cwd)
end

function path.basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

return path

--
-- Very simple mkisofs example. Quite innacurate though: you shouldn't have
-- filenames exceeding common DOS 8.3 naming scheme.
--
-- You may use it this way: cd-tool -o iso.bin -e "main()" mkisofs.lua
--

function r_mkisofs(dirname, l_dirtree)
    local file, r_dirtree

    print("Processing directory " .. dirname)

    for file in dir(dirname) do
    	if (file.type == FLAG_DIR) then
    	    print("Processing subdir " .. file.name)
    	    if (not ((file.name == ".") or (file.name == ".."))) then
        		r_dirtree = iso:createdir(l_dirtree, string.upper(file.name), 16)
        		r_dirtree:setbasicsxa()
        		if (dirtemplate ~= nil) then
        		    r_dirtree:fromdir(dirtemplate)
        		end
        		r_mkisofs(dirname .. "/" .. file.name, r_dirtree)
    	    end
    	else
    	    print("Processing file " .. file.name)
    	    r_dirtree = iso:createfile(l_dirtree, string.upper(file.name), Input(dirname .. "/" .. file.name))
    	    r_dirtree:setbasicsxa()
    	    if (dirtemplate ~= nil) then
        		r_dirtree:fromdir(dirtemplate)
    	    end
    	end
    end
end

function mkisofs(dirname)
    local pvd, root, falsesect

    falsesect = {}

    if (cdutil == nil) then
    	iso:foreword_array(falsesect)
    	pvd = createpvd_array(falsesect)
    else
    	iso:foreword(cdutil)
    	pvd = createpvd(cdutil)
    	dirtemplate = cdutil:findpath "/"
    end

    root = iso:setbasics(pvd, 16)

    root:setbasicsxa()

    if (dirtemplate ~= nil) then
    	root:fromdir(dirtemplate)
    end

    r_mkisofs(dirname, root)

    print "Adding dummy sectors"

    for i = 1, 15000, 1 do
	    iso:createsector(falsesect, MODE2_FORM1)
    end

    for i = 1, 150, 1 do
	    iso:createsector(falsesect, MODE2)
    end

    iso:close()
end

function main()
    mkisofs("FILES")
end

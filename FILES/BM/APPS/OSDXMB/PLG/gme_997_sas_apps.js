//////////////////////////////////////////////////////////////////////////
///*				   		 ENCLOSE START							  *///
//////////////////////////////////////////////////////////////////////////

export const Plugin = (() => { 	// DO NOT REMOVE, Encloses plugin on a local scope //

//////////////////////////////////////////////////////////////////////////
///*				   		CUSTOM FUNCTIONS						  *///
//////////////////////////////////////////////////////////////////////////

let options = [];

function parseTitleCfg(path)
{
    if (std.exists(`${path}title.cfg`))
    {
        // Parse the Title CFG file.
        let data = {};
        const file = std.open(`${path}title.cfg`, "r");
		
		while (!file.eof()) {
			let line = file.getline();
			if (line && line.includes('=')) { // Ensure the line is not empty and contains an '='
				line = line.trim(); // Read and trim whitespace
				const [key, value] = line.split('='); // Split into key and value
				data[key.trim()] = value.trim(); // Trim and store in the data object
			}
		}
		
		file.close();

        let AppName = "";
        let Desc = "";
        let ELFPath = "";

        // Get Title
        if ('Title' in data)
        {
            AppName = data['Title'];
        }
        else if ('title' in data)
        {
            AppName = data['title'];
        }

        // Get ELF Path
        if ('boot' in data)
        {
            ELFPath = `${path}${data['boot']}`;
        }

        // Get Version for Description
        if ('Version' in data)
        {
            Desc = "Version " + data['Version'];
        }

        if ((AppName !== "") && (ELFPath != ""))
        {
            // Return the App object
            return {
                Name: AppName,
                Description: Desc,
                Icon: 27,
                Type: "ELF",
                Value: { Path: ELFPath, Args: [], }
            };
        }
        else { return {}; }
    }
    else
    {
        return {};
    }
}

function TryAddMCApps(path)
{
	const dir = System.listDir(path);
	
	dir.forEach((item) => 
	{
		if ((item.dir) && (item.name !== ".") && (item.name !== "..") && (item.name.includes('_')))
		{
            const app = parseTitleCfg(`${path}${item.name}/`);
			if ('Name' in app)
            {
                options.push(app);
            }
		}
	});
}

function GetMcOptions()
{	
	TryAddMCApps("mc0:/");
	TryAddMCApps("mc1:/");

    options.sort((a, b) => a.Name.localeCompare(b.Name));

	return { Options: options, Default: 0, ItemCount: options.length, };
}

//////////////////////////////////////////////////////////////////////////
///*				   		MAIN PLUGIN DATA						  *///
///																	   ///
/// 	Here is the main info that will be retrieved by the App.   	   ///
//////////////////////////////////////////////////////////////////////////
	
const Info = {
	Name: "Apps",
	Description: "",
	Icon: 18,
	Category: 5,
	Type: "SUBMENU",
	Value: GetMcOptions(),
};

return Info;

//////////////////////////////////////////////////////////////////////////
///*				   		   ENCLOSE END							  *///
//////////////////////////////////////////////////////////////////////////
	
})(); // DO NOT REMOVE, Encloses plugin on a local scope //

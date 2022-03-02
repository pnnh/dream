//
// Created by ubuntu on 3/2/22.
//

#include "ctemplate.h"
#include <stdio.h>
#include <string>
#include <dlfcn.h>
#include <ctemplate/template.h>

void render_template() {
    ctemplate::TemplateDictionary dict("example");
    dict.SetValue("table1_name", "example");

    for (int i = 0; i < 2; ++i) {
        ctemplate::TemplateDictionary *table1_dict;
        table1_dict = dict.AddSectionDictionary("TABLE1");
        table1_dict->SetValue("field1", "1");
        table1_dict->SetValue("field2", "2");

        // 这里有点类似于printf
        table1_dict->SetFormattedValue("field3", "%d", i);
    }

    std::string output;
    ctemplate::Template *tpl;
    tpl = ctemplate::Template::GetTemplate("assets/templates/ctemplate.html", ctemplate::DO_NOT_STRIP);
    tpl->Expand(&output, &dict);
    printf("%s\n", output.c_str());
}

/*
 * ListingTable by njh89z
 */

function ListingTable(data, options)
{
    try
    {
        data = JSON.parse(data);
    }
    catch (e)
    {
    }

    var created = new Date().getUTCMilliseconds();

    options.type = options.type?options.type:"ul";
    options.table = options.table?options.table:{"class":"table_templete_basic"};
    options.header = options.header?options.header:{};
    options.paging = options.paging?options.paging:{"class":"paging_templete_basic"};

    if(!options.columns || options.columns.length == 0)
    {
        throw "RequireColumnsException";
    }

    this.create = function() {
        var tags = options.type == "table"?{"table":"table", "column":"td", "row":"tr"}:{"table":"div", "column":"li", "row":"ul"};
        var listItems = [];

        listItems.push("<" + tags.table + (options.table.class?" class=\""+options.table.class + "\" ":"") + (options.table.style?" style=\""+options.table.style + "\" ":"") + (options.table.attrs?" "+options.table.attrs:"") + ">");

        // header
        if(options.header.isVisible !== false)
        {
            listItems.push("<" + tags.row + " class=\"header" + (options.header.class?" "+options.header.class:"") + "\" " + (options.header.style?" style=\""+options.header.style + "\" ":"") + (options.header.attrs?" "+options.header.attrs:"") + ">");

            $.each(options.columns, function(key, value) {
                listItems.push("<" + tags.column + (value.class?" class=\""+value.class+"\" ":"") + (value.style?" style=\""+value.style+"\" ":"") + (value.attrs?" "+value.attrs:"") + "><span>" + value.readableName + "</span></" + tags.column + ">");
            });

            listItems.push("</" + tags.row + ">");
        }

        // list
        if (data.list && data.list.length > 0) {
        	$.each(data.list, function(key, value) {
            	var rownum = key;

                // variables
                var rowVariableData = [];
                rowVariableData.key = [];
                rowVariableData.value = [];

                // options variables
                if (options.variables) {
                    $.each(options.variables, function(variableKey, variableValue) {
                        $.each(value, function(dataKey, dataValue) {
                            variableValue = variableValue.replace(eval("/{{\\s*" + dataKey + "\\s*}}/gi"), value[dataKey]);
                        });
                        rowVariableData.key.push(variableKey);
                        rowVariableData.value.push(variableValue);
                    });
                }
                
                // row options
            	var rowData = [];
            	rowData.class = options.rows && options.rows.class ? options.rows.class : "";
            	rowData.style = options.rows && options.rows.style ? options.rows.style : "";
            	rowData.attrs = options.rows && options.rows.attrs ? options.rows.attrs : "";

            	if (options.rows)
            	{
    	            // class
    	            if (options.rows.class) {
    	                // variables conv
    	                if (rowData.class.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
    	                    $.each(value, function(dataKey, dataValue) {
    	                        rowData.class = rowData.class.replace(eval("/{{\\s*" + dataKey + "\\s*}}/gi"), dataValue);
    	                    });
    	                }
    	            }
    	
    	            // style
    	            if (options.rows && options.rows.style) {
    	                // variables conv
    	                if (rowData.style.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
    	                    $.each(value, function(dataKey, dataValue) {
    	                        rowData.style = rowData.style.replace(eval("/{{\\s*" + dataKey + "\\s*}}/gi"), dataValue);
    	                    });
    	                }
    	            }
    	
    	            // attrs
    	            if (options.rows && options.rows.attrs) {
    	                // variables conv
    	                if (rowData.attrs.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
    	                    $.each(value, function(dataKey, dataValue) {
    	                        rowData.attrs = rowData.attrs.replace(eval("/{{\\s*" + dataKey + "\\s*}}/gi"), dataValue);
    	                    });
    	                }
    	            }

    	            // variables conv
    	            if (rowVariableData.key.length > 0 && (rowData.class || rowData.style || rowData.attrs)) {
    	            	for (var i=0; i<rowVariableData.key.length;i++)
    	        		{                    
    	                    if (rowData.class && rowData.class.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
    	                    	rowData.class = rowData.class.replace(eval("/{{\\s*" + rowVariableData.key[i] + "\\s*}}/gi"), eval(rowVariableData.value[i]));
    	                    }
    	                    
    	                    if (rowData.style && rowData.style.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
    	                    	rowData.style = rowData.style.replace(eval("/{{\\s*" + rowVariableData.key[i] + "\\s*}}/gi"), eval(rowVariableData.value[i]));
    	                    }
    	                    
    	                    if (rowData.attrs && rowData.attrs.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
    	                    	rowData.attrs = rowData.attrs.replace(eval("/{{\\s*" + rowVariableData.key[i] + "\\s*}}/gi"), eval(rowVariableData.value[i]));
    	                    }
    	                }
    	            }
        		}
                
            	// row tag push
                listItems.push("<" + tags.row + " class=\"list" + (rowData.class?" "+rowData.class:"") + "\" " + (rowData.style?" style=\""+rowData.style+"\" ":"") + (rowData.attrs?" "+rowData.attrs:"") + ">");

                // columns
                $.each(options.columns, function(subKey, subValue) {
                	var colnum = subKey;

                    // variables
                    var variableData = [];
                    variableData.key = [];
                    variableData.value = [];

                    // columns variables
                    if (subValue.variables) {
                        $.each(subValue.variables, function(variableKey, variableValue) {
                            $.each(value, function(dataKey, dataValue) {
                                variableValue = variableValue.replace(eval("/{{\\s*" + dataKey + "\\s*}}/gi"), value[dataKey]);
                            });
                            variableData.key.push(variableKey);
                            variableData.value.push(variableValue);
                        });
                    }

                    // options variables + columns variables
                    variableData.key = rowVariableData.key.concat(variableData.key);
                    variableData.value = rowVariableData.value.concat(variableData.value);

                    // column options
                	var columnData = [];
                	columnData.content = subValue.content ? subValue.content : value[subValue.name] != null ? value[subValue.name] + '' : "&nbsp;";
                	columnData.class = subValue.class ? subValue.class : "";
                	columnData.style = subValue.style ? subValue.style : "";
                	columnData.attrs = subValue.attrs ? subValue.attrs : "";

                    // content
                    if (subValue.content) {
                        // variables conv
                        if (columnData.content.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
                            $.each(value, function(dataKey, dataValue) {
                                columnData.content = columnData.content.replace(eval("/{{\\s*" + dataKey + "\\s*}}/gi"), dataValue);
                            });
                        }
                    }

                    // class
                    if (subValue.class) {
                        // variables conv
                        if (columnData.class.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
                            $.each(value, function(dataKey, dataValue) {
                                columnData.class = columnData.class.replace(eval("/{{\\s*" + dataKey + "\\s*}}/gi"), dataValue);
                            });
                        }
                    }

                    // style
                    if (subValue.style) {
                        // variables conv
                        if (columnData.style.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
                            $.each(value, function(dataKey, dataValue) {
                                columnData.style = columnData.style.replace(eval("/{{\\s*" + dataKey + "\\s*}}/gi"), dataValue);
                            });
                        }
                    }

                    // attrs
                    if (subValue.attrs) {
                        // variables conv
                        if (columnData.attrs.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
                            $.each(value, function(dataKey, dataValue) {
                                columnData.attrs = columnData.attrs.replace(eval("/{{\\s*" + dataKey + "\\s*}}/gi"), dataValue);
                            });
                        }
                    }

    	            // variables conv
                    if (variableData.key.length > 0 && (columnData.content || columnData.class || columnData.style || columnData.attrs)) {
                        for (var i=0; i<variableData.key.length;i++)
                		{
                            if (columnData.content && columnData.content.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
                            	columnData.content = columnData.content.replace(eval("/{{\\s*" + variableData.key[i] + "\\s*}}/gi"), eval(variableData.value[i]));
                            }
                            
                            if (columnData.class && columnData.class.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
                            	columnData.class = columnData.class.replace(eval("/{{\\s*" + variableData.key[i] + "\\s*}}/gi"), eval(variableData.value[i]));
                            }
                            
                            if (columnData.style && columnData.style.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
                            	columnData.style = columnData.style.replace(eval("/{{\\s*" + variableData.key[i] + "\\s*}}/gi"), eval(variableData.value[i]));
                            }
                            
                            if (columnData.attrs && columnData.attrs.search(eval("/{{\\s*[a-zA-Z_][a-zA-Z0-9_\\-]*\\s*}}/gi")) >= 0) {
                            	columnData.attrs = columnData.attrs.replace(eval("/{{\\s*" + variableData.key[i] + "\\s*}}/gi"), eval(variableData.value[i]));
                            }
                        }
                    }

                	// column tag push
                    listItems.push("<" + tags.column + " id=\"" + created + "_column_" + key + "_" + subKey + "\" " + (columnData.class ? " class=\"" + columnData.class + "\" " : "") + (columnData.style ? " style=\"" + columnData.style + "\" " : "") + " " + columnData.attrs + "><span>" + columnData.content + "</span></" + tags.column + ">");

                    if(subValue.onclick != null) {
                        $(document).off("click","#" + created + "_column_" + key + "_" + subKey);
                        $(document).on("click","#" + created + "_column_" + key + "_" + subKey,value,subValue.onclick);
                    }
                    else if(options.rows&&options.rows.onclick != null) {
                        $(document).off("click","#" + created + "_column_" + key + "_" + subKey);
                        $(document).on("click","#" + created + "_column_" + key + "_" + subKey,value,options.rows.onclick);
                    }
                });

                listItems.push("</" + tags.row + ">");
            });
    	} else if (options.isEmpty && options.isEmpty.content) {
            
            // row options
        	var rowData = [];
        	rowData.class = options.rows && options.rows.class ? options.rows.class : "";
        	rowData.style = options.rows && options.rows.style ? options.rows.style : "";
        	rowData.attrs = options.rows && options.rows.attrs ? options.rows.attrs : "";
        	
        	var emptyColAttrs = tags.column == 'td' && options.columns.length ? ' colspan="' + options.columns.length + '"' : '';
        	emptyColAttrs = options.isEmpty.attrs ? options.isEmpty.attrs + emptyColAttrs : emptyColAttrs;
    		
    		listItems.push("<" + tags.row + " class=\"list empty_list" + (rowData.class?" "+rowData.class:"") + "\" " + (rowData.style?" style=\""+rowData.style+"\" ":"") + (rowData.attrs?" "+rowData.attrs:"") + ">");
    		listItems.push("<" + tags.column + " class=\"empty_column" + (options.isEmpty.class?" "+options.isEmpty.class:"") + "\" " + (options.isEmpty.style?" style=\""+options.isEmpty.style+"\" ":"") + " " + emptyColAttrs + "><span>" + (options.isEmpty.content?options.isEmpty.content:"") + "</span></" + tags.column + ">");
            listItems.push("</" + tags.row + ">");
        }
        listItems.push("</" + tags.table + ">");

        // paging
        if(options.paging.isVisible !== false) {
	        var currentPage = 1
	        var totalPage = currentPage;
	
	        if(data.page)
	        {
	            currentPage = data.page.currentPage?data.page.currentPage:currentPage;
	            totalPage = data.page.totalPage?data.page.totalPage:totalPage;
	        }
	
	        currentPage = currentPage > totalPage ? totalPage : currentPage;
	
	        var pageSize = options.paging.size?options.paging.size:10;
	        var pageStart = Math.floor((currentPage - 1) / pageSize) * pageSize + 1;
	        var pageEnd = (pageStart + pageSize - 1) > totalPage ? totalPage : pageStart + pageSize - 1;
	
	        listItems.push("<div class=\"" + (options.paging.class?options.paging.class:"") + "\">");
	        var pages = '';
	
	        if(pageStart - pageSize > 0)
	        {
	            prevPage = pageStart - 1;
	            pages+="<span class=\"active\" id=\"" + created + "_paging_" + prevPage + "\">&lt;</span>";
	
	            if(options.paging.onclick != null)
	            {
	                $(document).on("click","#" + created + "_paging_" + prevPage,{"page":prevPage},options.paging.onclick);
	            }
	        }
	        else
	        {
	            prevPage = pageStart - 1;
	            pages+="<span class=\"disabled\" id=\"" + created + "_paging_" + prevPage + "\">&lt;</span>";
	        }
	
	        for(var i=pageStart;i<=pageEnd;i++)
	        {
	            if(i == currentPage)
	            {
	                pages+="<span class=\"current\" id=\"" + created + "_paging_" + i + "\">" + i + "</span>";
	            }
	            else
	            {
	                pages+="<span class=\"active\" id=\"" + created + "_paging_" + i + "\">" + i + "</span>";
	            	
		            if(options.paging.onclick != null)
		            {
		                $(document).on("click","#" + created + "_paging_" + i,{"page":i},options.paging.onclick);
		            }
	            }
	        }
	
	        if(pageStart + pageSize <= totalPage)
	        {
	            nextPage = pageEnd + 1;
	            pages+="<span class=\"active\" id=\"" + created + "_paging_" + nextPage + "\">&gt;</span>";
	
	            if(options.paging.onclick != null)
	            {
	                $(document).on("click","#" + created + "_paging_" + nextPage,{"page":nextPage},options.paging.onclick);
	            }
	        }
	        else
	        {
	            nextPage = pageEnd + 1;
	            pages+="<span class=\"disabled\" id=\"" + created + "_paging_" + nextPage + "\">&gt;</span>";
	        }
	
	        listItems.push(pages);
	        listItems.push("</div>");
	    }

        return listItems.join("\n");
    }

    this.appendTo = function(target) {
        $(target).append(this.create());
    }

    this.show = function(target) {
        $(target).html(this.create());
    }
}
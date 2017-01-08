var BUBBLE_PARAMETERS = {
    "data_file": "cleanWipData.csv",
    "report_title": "Quant projects breakdown",
    "footer_text": "Analysis based on quant wip from connect (as at Jan 17); na's removed.",
    "width": 940,
    "height": 600,
    "force_strength": 0.03,
    "force_type": "charge",
    "radius_field": "Quant Budget",
    "numeric_fields": ["Quant Budget"],
    "fill_color": {
        "data_field": "Project Type",
        "color_groups": {
          // Use viridis palette
            "ALM": "#440154FF",
            "LDI": "#414487FF",
            "Structure": "#2A788EFF",
            "Cashflows": "#22A884FF",
            "3DA": "#7AD151FF",
            "Other": "#FDE725FF"
        }
    },
    "tooltip": [
        {"title": "CMS code", "data_field": "CMS Code"},
        {"title": "Project type", "data_field": "Project Type"},
        {"title": "Quant budget", "data_field": "Quant Budget", "format_string": ",.2r"},
        {"title": "Date", "data_field": "proj date"}
    ],
    "modes": [
        {
            "button_text": "All Projects",
            "button_id": "all",
            "type": "grid",
            "labels": null,
            "grid_dimensions": {"rows": 1, "columns": 1},
            "data_field": null
        },
        {
            "button_text": "Projects by Type",
            "button_id": "projType",
            "type": "grid",
            "labels": ["ALM", "LDI", "Structure", "Cashflows", "3DA", "Other"],
            "grid_dimensions": {"rows": 3, "columns": 2},
            "data_field": "Project Type"
        },
        {
            "button_text": "Assets by Change in Value",
            "button_id": "Change",
            "type": "grid",
            "labels": ["Down", "No Change", "Up"],
            "grid_dimensions": {"rows": 1, "columns": 3},
            "data_field": "Change"
        },
        {
            "button_text": "Change in value vs Net Value",
            "button_id": "change_vs_net_value",
            "type": "scatterplot",
            "x_data_field": "Net Value",
            "y_data_field": "Change vs 2015",
            "x_format_string": ",.2r",
            "y_format_string": ",.2r"
        },
        {
            "button_text": "Assets by Location",
            "button_id": "assets_on_map",
            "type": "map",
            "latitude_field": "Latitude",
            "longitude_field": "Longitude"
        }
    ]
};

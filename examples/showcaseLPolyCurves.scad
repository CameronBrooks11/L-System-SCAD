use <../curves.scad>;

// ================================
// Configuration: Select Your Curve
// ================================

selected_curve = "koch_snowflake";
// Options:
// "koch_snowflake",

// ================================
// Curve Selection Logic
// ================================

module select_curve()
{
    if (selected_curve == "koch_snowflake")
    {
        koch_snowflake(n = 8); // Recommended n <= 8
    }
    else if (selected_curve == "")
    {
        // Add your curve here
    }
    else
    {
        echo("Selected curve is not defined.");
    }
}

// Invoke the selected curve
select_curve();
# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "templates/stylesheets"
sass_dir = "sass"
images_dir = "images"
javascripts_dir = "javascripts"
templates_dir = "templates"
inline_templates_dir = "templates-inline"

# options
use_css_inliner = false

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed
output_style = :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false


# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

# CSS inliner tool
if use_css_inliner
    on_stylesheet_saved do |filename|
        # Create output directory
        Dir.mkdir(inline_templates_dir) unless File.exists?(inline_templates_dir)

        # Treat each templates
        Dir.glob(templates_dir+"/*.html") do |template|
            # Output file
            inline_template = "#{inline_templates_dir}/#{File.basename(template)}"

            # Info
            puts "css-inlining #{template} to #{inline_template}"

            # Call the css inliner
            cmd = "python utils/css-inliner.py --html #{template} --output #{inline_template} --css #{css_dir}/email.css"
            system(cmd)
        end
    end
end

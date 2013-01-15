# Zurb Responsive Email Templates with Sass & compass support

At ComSource, we love [Sass](http://sass-lang.com/) and [compass](http://compass-style.org/) so much that we are frustrated to code simple css :) When zurb launched their awesome [responsive email templates](http://www.zurb.com/playground/responsive-email-templates), we wanted to take advantage of both worlds, and introduced some spice to default zurb templates.

## Installation

### Compass/Sass

The first dependancy is compass (and sass of course). Typically, installation process will looks like: 

	$ gem update --system
	$ gem install compass

If you need more information about compass installation, please refer to its [documentation](http://compass-style.org/install/).

### Python - Premailer

We choose to use a python tool as css-inliner for our templates. First, you need to install python, and create a virtualenv for this tool (please check the [virtualenvwrapper documentation](http://virtualenvwrapper.readthedocs.org/en/latest/)). Then, install all python dependancies with:

	$ pip install -r requirements.txt

## Usage

Clone this repository and start working with:

    $ compass watch

If you want to add your own rules to override default styles, all you need is to create your own `scss` file (e.g. `_myrules.scss`) and import this file at the end of the main scss file `email.scss`:

	@import "myrules";

A sample file `sass/_myrules.scss` as been integrated as a demo.

By default, compiled templates are stored in the `templates-inline` directory.

Have fun!

# -*- coding: utf-8 -*-

from argparse import ArgumentParser
from premailer import Premailer

if __name__ == '__main__':

    # Parse the command line
    parser = ArgumentParser()
    parser.add_argument("--css", action="append",
                        help="css file to inline")
    parser.add_argument("--html", action="store",
                        required=True,
                        help="html file to transform")
    parser.add_argument("--output", action="store",
                        required=True,
                        help="output html file")
    args = parser.parse_args()

    # HTML content
    html_file = open(args.html, 'r')
    html = "".join(html_file.readlines())
    html_file.close()

    # Process HTML+CSS
    p = Premailer(html=html,
                  external_styles=args.css,
                  keep_style_tags=True,
                  include_star_selectors=True)

    # Write output
    output_file = open(args.output, 'w')
    output_file.write(p.transform())
    output_file.close()

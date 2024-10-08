# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `mustache` gem.
# Please instead update this file by running `bin/tapioca gem mustache`.


# Mustache is the base class from which your Mustache subclasses
# should inherit (though it can be used on its own).
#
# The typical Mustache workflow is as follows:
#
# * Create a Mustache subclass: class Stats < Mustache
# * Create a template: stats.mustache
# * Instantiate an instance: view = Stats.new
# * Render that instance: view.render
#
# You can skip the instantiation by calling `Stats.render` directly.
#
# While Mustache will do its best to load and render a template for
# you, this process is completely customizable using a few options.
#
# All settings can be overriden at the class level.
#
# For example, going with the above example, we can use
# `Stats.template_path = "/usr/local/templates"` to specify the path
# Mustache uses to find templates.
#
# Here are the available options:
#
# * template_path
#
# The `template_path` setting determines the path Mustache uses when
# looking for a template. By default it is "."
# Setting it to /usr/local/templates, for example, means (given all
# other settings are default) a Mustache subclass `Stats` will try to
# load /usr/local/templates/stats.mustache
#
# * template_extension
#
# The `template_extension` is the extension Mustache uses when looking
# for template files. By default it is "mustache"
#
# * template_file
#
# You can tell Mustache exactly which template to use with this
# setting. It can be a relative or absolute path.
#
# * template
#
# Sometimes you want Mustache to render a string, not a file. In those
# cases you may set the `template` setting. For example:
#
#   >> Mustache.render("Hello {{planet}}", :planet => "World!")
#   => "Hello World!"
#
# The `template` setting is also available on instances.
#
#   view = Mustache.new
#   view.template = "Hi, {{person}}!"
#   view[:person] = 'Mom'
#   view.render # => Hi, mom!
#
# * view_namespace
#
# To make life easy on those developing Mustache plugins for web frameworks or
# other libraries, Mustache will attempt to load view classes (i.e. Mustache
# subclasses) using the `view_class` class method. The `view_namespace` tells
# Mustache under which constant view classes live. By default it is `Object`.
#
# * view_path
#
# Similar to `template_path`, the `view_path` option tells Mustache where to look
# for files containing view classes when using the `view_class` method.
#
# source://mustache//lib/mustache/enumerable.rb#1
class Mustache
  # Initialize a new Mustache instance.
  #
  # @option options
  # @option options
  # @option options
  # @option options
  # @option options
  # @option options
  # @param options [Hash] An options hash
  # @return [Mustache] a new instance of Mustache
  #
  # source://mustache//lib/mustache.rb#86
  def initialize(options = T.unsafe(nil)); end

  # Context accessors.
  #
  # @example Context accessors
  #   view = Mustache.new
  #   view[:name] = "Jon"
  #   view.template = "Hi, {{name}}!"
  #   view.render # => "Hi, Jon!"
  #
  # source://mustache//lib/mustache.rb#150
  def [](key); end

  # source://mustache//lib/mustache.rb#154
  def []=(key, value); end

  # Has this instance or its class already compiled a template?
  #
  # @return [Boolean]
  #
  # source://mustache//lib/mustache.rb#237
  def compiled?; end

  # A helper method which gives access to the context at a given time.
  # Kind of a hack for now, but useful when you're in an iterating section
  # and want access to the hash currently being iterated over.
  #
  # source://mustache//lib/mustache.rb#161
  def context; end

  # Override this to provide custom escaping.
  # By default it uses `CGI.escapeHTML`.
  #
  # @example Overriding #escape
  #   class PersonView < Mustache
  #   def escape(value)
  #   my_html_escape_method(value.to_s)
  #   end
  #   end
  # @param value [Object] Value to escape.
  # @return [String] Escaped content.
  #
  # source://mustache//lib/mustache.rb#212
  def escape(value); end

  # Override this to provide custom escaping.
  #
  # @deprecated Use {#escape} instead.
  #
  #   Note that {#escape} can receive any kind of object.
  #   If your override logic is expecting a string, you will
  #   have to call to_s on it yourself.
  # @example Overriding #escapeHTML
  #   class PersonView < Mustache
  #   def escapeHTML(str)
  #   my_html_escape_method(str)
  #   end
  #   end
  # @param str [String] String to escape.
  # @return [String] Escaped HTML.
  #
  # source://mustache//lib/mustache.rb#232
  def escapeHTML(str); end

  # source://mustache//lib/mustache/settings.rb#5
  def initialize_settings; end

  # Override this in your subclass if you want to do fun things like
  # reading templates from a database. It will be rendered by the
  # context, so all you need to do is return a string.
  #
  # source://mustache//lib/mustache.rb#189
  def partial(name); end

  # source://mustache//lib/mustache/settings.rb#48
  def path; end

  # source://mustache//lib/mustache/settings.rb#213
  def raise_on_context_miss=(boolean); end

  # Instance level version of `Mustache.raise_on_context_miss?`
  #
  # @return [Boolean]
  #
  # source://mustache//lib/mustache/settings.rb#209
  def raise_on_context_miss?; end

  # Parses our fancy pants template file and returns normal file with
  # all special {{tags}} and {{#sections}}replaced{{/sections}}.
  #
  # @example Render view
  #   @view.render("Hi {{thing}}!", :thing => :world)
  # @example Set view template and then render
  #   View.template = "Hi {{thing}}!"
  #   @view = View.new
  #   @view.render(:thing => :world)
  # @param data [String, Hash] A String template or a Hash context.
  #   If a Hash is given, we'll try to figure
  #   out the template from the class.
  # @param ctx [Hash] A Hash context if `data` is a String template.
  # @return [String] Returns a rendered version of a template.
  #
  # source://mustache//lib/mustache.rb#116
  def render(data = T.unsafe(nil), ctx = T.unsafe(nil)); end

  # Given a file name and an optional context, attempts to load and
  # render the file as a template.
  #
  # source://mustache//lib/mustache.rb#173
  def render_file(name, context = T.unsafe(nil)); end

  # The template can be set at the instance level.
  #
  # source://mustache//lib/mustache/settings.rb#173
  def template; end

  # source://mustache//lib/mustache/settings.rb#184
  def template=(template); end

  # source://mustache//lib/mustache/settings.rb#84
  def template_extension; end

  # source://mustache//lib/mustache/settings.rb#88
  def template_extension=(template_extension); end

  # The template file is the absolute path of the file Mustache will
  # use as its template. By default it's ./class_name.mustache
  #
  # source://mustache//lib/mustache/settings.rb#145
  def template_file; end

  # source://mustache//lib/mustache/settings.rb#149
  def template_file=(template_file); end

  # source://mustache//lib/mustache/settings.rb#117
  def template_name; end

  # source://mustache//lib/mustache/settings.rb#121
  def template_name=(template_name); end

  # source://mustache//lib/mustache/settings.rb#48
  def template_path; end

  # source://mustache//lib/mustache/settings.rb#53
  def template_path=(path); end

  private

  # source://mustache//lib/mustache.rb#309
  def templateify(obj); end

  class << self
    # template_partial => TemplatePartial
    # template/partial => Template::Partial
    #
    # source://mustache//lib/mustache.rb#290
    def classify(underscored); end

    # Has this template already been compiled? Compilation is somewhat
    # expensive so it may be useful to check this before attempting it.
    #
    # @return [Boolean]
    #
    # source://mustache//lib/mustache.rb#283
    def compiled?; end

    # source://mustache//lib/mustache.rb#271
    def const_from_file(name); end

    # Return the value of the configuration setting on the superclass, or return
    # the default.
    #
    # @param attr_name [Symbol] Name of the attribute. It should match
    #   the instance variable.
    # @param default [Object] Default value to use if the superclass does
    #   not respond.
    # @return Inherited or default configuration setting.
    #
    # source://mustache//lib/mustache.rb#324
    def inheritable_config_for(attr_name, default); end

    # @private
    #
    # source://mustache//lib/mustache/settings.rb#25
    def inherited(subclass); end

    # source://mustache//lib/mustache/settings.rb#14
    def initialize_settings; end

    # Given a name, attempts to read a file and return the contents as a
    # string. The file is not rendered, so it might contain
    # {{mustaches}}.
    #
    # Call `render` if you need to process it.
    #
    # source://mustache//lib/mustache.rb#182
    def partial(name); end

    # Alias for `template_path`
    #
    # source://mustache//lib/mustache/settings.rb#59
    def path; end

    # Alias for `template_path`
    #
    # source://mustache//lib/mustache/settings.rb#64
    def path=(path); end

    # source://mustache//lib/mustache/settings.rb#204
    def raise_on_context_miss=(boolean); end

    # Should an exception be raised when we cannot find a corresponding method
    # or key in the current context? By default this is false to emulate ctemplate's
    # behavior, but it may be useful to enable when debugging or developing.
    #
    # If set to true and there is a context miss, `Mustache::ContextMiss` will
    # be raised.
    #
    # @return [Boolean]
    #
    # source://mustache//lib/mustache/settings.rb#200
    def raise_on_context_miss?; end

    # Instantiates an instance of this class and calls `render` with
    # the passed args.
    #
    # @return A rendered String version of a template.
    #
    # source://mustache//lib/mustache.rb#96
    def render(*args); end

    # Given a file name and an optional context, attempts to load and
    # render the file as a template.
    #
    # source://mustache//lib/mustache.rb#167
    def render_file(name, context = T.unsafe(nil)); end

    # source://mustache//lib/mustache.rb#265
    def rescued_const_get(name); end

    # The template is the actual string Mustache uses as its template.
    # There is a bit of magic here: what we get back is actually a
    # Mustache::Template object, but you can still safely use `template=`
    #  with a string.
    #
    # source://mustache//lib/mustache/settings.rb#164
    def template; end

    # source://mustache//lib/mustache/settings.rb#168
    def template=(template); end

    # A Mustache template's default extension is 'mustache', but this can be changed.
    #
    # source://mustache//lib/mustache/settings.rb#75
    def template_extension; end

    # source://mustache//lib/mustache/settings.rb#79
    def template_extension=(template_extension); end

    # The template file is the absolute path of the file Mustache will
    # use as its template. By default it's ./class_name.mustache
    #
    # source://mustache//lib/mustache/settings.rb#134
    def template_file; end

    # source://mustache//lib/mustache/settings.rb#138
    def template_file=(template_file); end

    # The template name is the Mustache template file without any
    # extension or other information. Defaults to `class_name`.
    #
    # You may want to change this if your class is named Stat but you want
    # to re-use another template.
    #
    #   class Stat
    #     self.template_name = "graphs" # use graphs.mustache
    #   end
    #
    # source://mustache//lib/mustache/settings.rb#108
    def template_name; end

    # source://mustache//lib/mustache/settings.rb#112
    def template_name=(template_name); end

    # The template path informs your Mustache view where to look for its
    # corresponding template. By default it's the current directory (".")
    #
    # A class named Stat with a template_path of "app/templates" will look
    # for "app/templates/stat.mustache"
    #
    # source://mustache//lib/mustache/settings.rb#39
    def template_path; end

    # source://mustache//lib/mustache/settings.rb#43
    def template_path=(path); end

    # @param obj [Template, String] Turns `obj` into a template
    # @param options [Hash] Options for template creation
    #
    # source://mustache//lib/mustache.rb#305
    def templateify(obj, options = T.unsafe(nil)); end

    # TemplatePartial => template_partial
    # Template::Partial => template/partial
    # Takes a string but defaults to using the current class' name.
    #
    # source://mustache//lib/mustache.rb#297
    def underscore(classified = T.unsafe(nil)); end

    # When given a symbol or string representing a class, will try to produce an
    # appropriate view class.
    #
    # @example
    #   Mustache.view_namespace = Hurl::Views
    #   Mustache.view_class(:Partial) # => Hurl::Views::Partial
    #
    # source://mustache//lib/mustache.rb#251
    def view_class(name); end

    # The constant under which Mustache will look for views when autoloading.
    # By default the view namespace is `Object`, but it might be nice to set
    # it to something like `Hurl::Views` if your app's main namespace is `Hurl`.
    #
    # source://mustache//lib/mustache/settings.rb#226
    def view_namespace; end

    # source://mustache//lib/mustache/settings.rb#230
    def view_namespace=(namespace); end

    # Mustache searches the view path for .rb files to require when asked to find a
    # view class. Defaults to "."
    #
    # source://mustache//lib/mustache/settings.rb#242
    def view_path; end

    # source://mustache//lib/mustache/settings.rb#246
    def view_path=(path); end
  end
end

# A Context represents the context which a Mustache template is
# executed within. All Mustache tags reference keys in the Context.
#
# source://mustache//lib/mustache/context.rb#8
class Mustache::Context
  # Initializes a Mustache::Context.
  #
  # @param mustache [Mustache] A Mustache instance.
  # @return [Context] a new instance of Context
  #
  # source://mustache//lib/mustache/context.rb#14
  def initialize(mustache); end

  # Alias for `fetch`.
  #
  # source://mustache//lib/mustache/context.rb#93
  def [](name); end

  # Can be used to add a value to the context in a hash-like way.
  #
  # context[:name] = "Chris"
  #
  # source://mustache//lib/mustache/context.rb#88
  def []=(name, value); end

  # source://mustache//lib/mustache/context.rb#151
  def current; end

  # Allows customization of how Mustache escapes things.
  #
  # @param value [Object] Value to escape.
  # @return [String] Escaped string.
  #
  # source://mustache//lib/mustache/context.rb#58
  def escape(value); end

  # Similar to Hash#fetch, finds a value by `name` in the context's
  # stack. You may specify the default return value by passing a
  # second parameter.
  #
  # If no second parameter is passed (or raise_on_context_miss is
  # set to true), will raise a ContextMiss exception on miss.
  #
  # source://mustache//lib/mustache/context.rb#111
  def fetch(name, default = T.unsafe(nil)); end

  # Finds a key in an object, using whatever method is most
  # appropriate. If the object is a hash, does a simple hash lookup.
  # If it's an object that responds to the key as a method call,
  # invokes that method. You get the idea.
  #
  # @param obj [Object] The object to perform the lookup on.
  # @param key [String, Symbol] The key whose value you want
  # @param default [Object] An optional default value, to return if the key is not found.
  # @return [Object] The value of key in object if it is found, and default otherwise.
  #
  # source://mustache//lib/mustache/context.rb#138
  def find(obj, key, default = T.unsafe(nil)); end

  # Do we know about a particular key? In other words, will calling
  # `context[key]` give us a result that was set. Basically.
  #
  # @return [Boolean]
  #
  # source://mustache//lib/mustache/context.rb#99
  def has_key?(key); end

  # Find the first Mustache in the stack.
  #
  # If we're being rendered inside a Mustache object as a context,
  # we'll use that one.
  #
  # @return [Mustache] First Mustache in the stack.
  #
  # source://mustache//lib/mustache/context.rb#48
  def mustache_in_stack; end

  # A {{>partial}} tag translates into a call to the context's
  # `partial` method, which would be this sucker right here.
  #
  # If the Mustache view handling the rendering (e.g. the view
  # representing your profile page or some other template) responds
  # to `partial`, we call it and render the result.
  #
  # source://mustache//lib/mustache/context.rb#26
  def partial(name, indentation = T.unsafe(nil)); end

  # Removes the most recently added object from the context's
  # internal stack.
  #
  # @return [Context] Returns the Context.
  #
  # source://mustache//lib/mustache/context.rb#79
  def pop; end

  # Adds a new object to the context's internal stack.
  #
  # @param new_obj [Object] Object to be added to the internal stack.
  # @return [Context] Returns the Context.
  #
  # source://mustache//lib/mustache/context.rb#68
  def push(new_obj); end

  # source://mustache//lib/mustache/context.rb#37
  def template_for_partial(partial); end

  private

  # Fetches a hash key if it exists, or returns the given default.
  #
  # source://mustache//lib/mustache/context.rb#159
  def find_in_hash(obj, key, default); end
end

# A ContextMiss is raised whenever a tag's target can not be found
# in the current context if `Mustache#raise_on_context_miss?` is
# set to true.
#
# For example, if your View class does not respond to `music` but
# your template contains a `{{music}}` tag this exception will be raised.
#
# By default it is not raised. See Mustache.raise_on_context_miss.
#
# source://mustache//lib/mustache/context_miss.rb#12
class Mustache::ContextMiss < ::RuntimeError; end

# source://mustache//lib/mustache/enumerable.rb#2
module Mustache::Enumerable; end

# The Generator is in charge of taking an array of Mustache tokens,
# usually assembled by the Parser, and generating an interpolatable
# Ruby string. This string is considered the "compiled" template
# because at that point we're relying on Ruby to do the parsing and
# run our code.
#
# For example, let's take this template:
#
#   Hi {{thing}}!
#
# If we run this through the Parser we'll get these tokens:
#
#   [:multi,
#     [:static, "Hi "],
#     [:mustache, :etag, "thing"],
#     [:static, "!\n"]]
#
# Now let's hand that to the Generator:
#
# >> puts Mustache::Generator.new.compile(tokens)
# "Hi #{CGI.escapeHTML(ctx[:thing].to_s)}!\n"
#
# You can see the generated Ruby string for any template with the
# mustache(1) command line tool:
#
#   $ mustache --compile test.mustache
#   "Hi #{CGI.escapeHTML(ctx[:thing].to_s)}!\n"
#
# source://mustache//lib/mustache/generator.rb#29
class Mustache::Generator
  # Options can be used to manipulate the resulting ruby code string behavior.
  #
  # @return [Generator] a new instance of Generator
  #
  # source://mustache//lib/mustache/generator.rb#31
  def initialize(options = T.unsafe(nil)); end

  # Given an array of tokens, returns an interpolatable Ruby string.
  #
  # source://mustache//lib/mustache/generator.rb#37
  def compile(exp); end

  private

  # Given an array of tokens, converts them into Ruby code. In
  # particular there are three types of expressions we are concerned
  # with:
  #
  #   :multi
  #     Mixed bag of :static, :mustache, and whatever.
  #
  #   :static
  #     Normal HTML, the stuff outside of {{mustaches}}.
  #
  #   :mustache
  #     Any Mustache tag, from sections to partials.
  #
  # To give you an idea of what you'll be dealing with take this
  # template:
  #
  #   Hello {{name}}
  #   You have just won ${{value}}!
  #   {{#in_ca}}
  #   Well, ${{taxed_value}}, after taxes.
  #   {{/in_ca}}
  #
  # If we run this through the Parser, we'll get back this array of
  # tokens:
  #
  #   [:multi,
  #    [:static, "Hello "],
  #    [:mustache, :etag,
  #     [:mustache, :fetch, ["name"]]],
  #    [:static, "\nYou have just won $"],
  #   [:mustache, :etag,
  #    [:mustache, :fetch, ["value"]]],
  #   [:static, "!\n"],
  #   [:mustache,
  #    :section,
  #    [:mustache, :fetch, ["in_ca"]],
  #   [:multi,
  #    [:static, "Well, $"],
  #    [:mustache, :etag,
  #     [:mustache, :fetch, ["taxed_value"]]],
  #    [:static, ", after taxes.\n"]],
  #    "Well, ${{taxed_value}}, after taxes.\n",
  #    ["{{", "}}"]]]
  #
  # source://mustache//lib/mustache/generator.rb#88
  def compile!(exp); end

  # An interpolation-friendly version of a string, for use within a
  # Ruby string.
  #
  # source://mustache//lib/mustache/generator.rb#208
  def ev(s); end

  # An escaped tag.
  #
  # source://mustache//lib/mustache/generator.rb#179
  def on_etag(name, offset); end

  # source://mustache//lib/mustache/generator.rb#189
  def on_fetch(names); end

  # Fired when we find an inverted section. Just like `on_section`,
  # we're passed the inverted section name and the array of tokens.
  #
  # source://mustache//lib/mustache/generator.rb#145
  def on_inverted_section(name, offset, content, raw, delims); end

  # Fired when the compiler finds a partial. We want to return code
  # which calls a partial at runtime instead of expanding and
  # including the partial's body to allow for recursive partials.
  #
  # source://mustache//lib/mustache/generator.rb#163
  def on_partial(name, offset, indentation); end

  # Callback fired when the compiler finds a section token. We're
  # passed the section name and the array of tokens.
  #
  # source://mustache//lib/mustache/generator.rb#103
  def on_section(name, offset, content, raw, delims); end

  # An unescaped tag.
  #
  # source://mustache//lib/mustache/generator.rb#168
  def on_utag(name, offset); end

  # source://mustache//lib/mustache/generator.rb#212
  def str(s); end
end

# The Parser is responsible for taking a string template and
# converting it into an array of tokens and, really, expressions. It
# raises SyntaxError if there is anything it doesn't understand and
# knows which sigil corresponds to which tag type.
#
# For example, given this template:
#
#   Hi {{thing}}!
#
# Run through the Parser we'll get these tokens:
#
#   [:multi,
#     [:static, "Hi "],
#     [:mustache, :etag, "thing"],
#     [:static, "!\n"]]
#
# You can see the array of tokens for any template with the
# mustache(1) command line tool:
#
#   $ mustache --tokens test.mustache
#   [:multi, [:static, "Hi "], [:mustache, :etag, "thing"], [:static, "!\n"]]
#
# source://mustache//lib/mustache/parser.rb#25
class Mustache::Parser
  # Accepts an options hash which does nothing but may be used in
  # the future.
  #
  # @return [Parser] a new instance of Parser
  #
  # source://mustache//lib/mustache/parser.rb#91
  def initialize(options = T.unsafe(nil)); end

  # Given a string template, returns an array of tokens.
  #
  # source://mustache//lib/mustache/parser.rb#119
  def compile(template); end

  # Returns the value of attribute ctag.
  #
  # source://mustache//lib/mustache/parser.rb#87
  def ctag; end

  # The closing tag delimiter. This too may be changed at runtime.
  #
  # source://mustache//lib/mustache/parser.rb#113
  def ctag=(value); end

  # Returns the value of attribute otag.
  #
  # source://mustache//lib/mustache/parser.rb#87
  def otag; end

  # The opening tag delimiter. This may be changed at runtime.
  #
  # source://mustache//lib/mustache/parser.rb#105
  def otag=(value); end

  private

  # source://mustache//lib/mustache/parser.rb#150
  def content_tags(type, current_ctag_regex); end

  # source://mustache//lib/mustache/parser.rb#159
  def dispatch_based_on_type(type, content, fetch, padding, pre_match_position); end

  # Raises a SyntaxError. The message should be the name of the
  # error - other details such as line number and position are
  # handled for you.
  #
  # @raise [SyntaxError]
  #
  # source://mustache//lib/mustache/parser.rb#285
  def error(message, pos = T.unsafe(nil)); end

  # source://mustache//lib/mustache/parser.rb#163
  def find_closing_tag(scanner, current_ctag_regex); end

  # source://mustache//lib/mustache/parser.rb#259
  def offset; end

  # Returns [lineno, column, line]
  #
  # source://mustache//lib/mustache/parser.rb#264
  def position; end

  # Used to quickly convert a string into a regular expression
  # usable by the string scanner.
  #
  # source://mustache//lib/mustache/parser.rb#278
  def regexp(thing); end

  # This function handles the cases where the scanned tag does not have
  # a type.
  #
  # source://mustache//lib/mustache/parser.rb#301
  def scan_tag_(content, fetch, padding, pre_match_position); end

  # source://mustache//lib/mustache/parser.rb#340
  def scan_tag_!(content, fetch, padding, pre_match_position); end

  # source://mustache//lib/mustache/parser.rb#345
  def scan_tag_=(content, fetch, padding, pre_match_position); end

  # source://mustache//lib/mustache/parser.rb#306
  def scan_tag_block(content, fetch, padding, pre_match_position); end

  # source://mustache//lib/mustache/parser.rb#324
  def scan_tag_close(content, fetch, padding, pre_match_position); end

  # source://mustache//lib/mustache/parser.rb#340
  def scan_tag_comment(content, fetch, padding, pre_match_position); end

  # source://mustache//lib/mustache/parser.rb#345
  def scan_tag_delimiter(content, fetch, padding, pre_match_position); end

  # source://mustache//lib/mustache/parser.rb#315
  def scan_tag_inverted(content, fetch, padding, pre_match_position); end

  # source://mustache//lib/mustache/parser.rb#351
  def scan_tag_open_partial(content, fetch, padding, pre_match_position); end

  # source://mustache//lib/mustache/parser.rb#364
  def scan_tag_unescaped(content, fetch, padding, pre_match_position); end

  # Find {{mustaches}} and add them to the @result array.
  #
  # source://mustache//lib/mustache/parser.rb#168
  def scan_tags; end

  # Try to find static text, e.g. raw HTML with no {{mustaches}}.
  #
  # source://mustache//lib/mustache/parser.rb#233
  def scan_text; end

  # Scans the string until the pattern is matched. Returns the substring
  # *excluding* the end of the match, advancing the scan pointer to that
  # location. If there is no match, nil is returned.
  #
  # source://mustache//lib/mustache/parser.rb#251
  def scan_until_exclusive(regexp); end

  class << self
    # Add a supported sigil type (with optional aliases) to the Parser.
    #
    # Requires a block, which will be sent the following parameters:
    #
    # * content - The raw content of the tag
    # * fetch- A mustache context fetch expression for the content
    # * padding - Indentation whitespace from the currently-parsed line
    # * pre_match_position - Location of the scanner before a match was made
    #
    # The provided block will be evaluated against the current instance of
    # Parser, and may append to the Parser's @result as needed.
    #
    # source://mustache//lib/mustache/parser.rb#65
    def add_type(*types, &block); end

    # source://mustache//lib/mustache/parser.rb#50
    def valid_types; end
  end
end

# The content allowed in a tag name.
#
# source://mustache//lib/mustache/parser.rb#81
Mustache::Parser::ALLOWED_CONTENT = T.let(T.unsafe(nil), Regexp)

# These types of tags allow any content,
# the rest only allow ALLOWED_CONTENT.
#
# source://mustache//lib/mustache/parser.rb#85
Mustache::Parser::ANY_CONTENT = T.let(T.unsafe(nil), Array)

# After these types of tags, all whitespace until the end of the line will
# be skipped if they are the first (and only) non-whitespace content on
# the line.
#
# source://mustache//lib/mustache/parser.rb#78
Mustache::Parser::SKIP_WHITESPACE = T.let(T.unsafe(nil), Array)

# A SyntaxError is raised when the Parser comes across unclosed
# tags, sections, illegal content in tags, or anything of that
# sort.
#
# source://mustache//lib/mustache/parser.rb#29
class Mustache::Parser::SyntaxError < ::StandardError
  # @return [SyntaxError] a new instance of SyntaxError
  #
  # source://mustache//lib/mustache/parser.rb#30
  def initialize(message, position); end

  # source://mustache//lib/mustache/parser.rb#37
  def to_s; end
end

# The sigil types which are valid after an opening `{{`
#
# source://mustache//lib/mustache/parser.rb#48
Mustache::Parser::VALID_TYPES = T.let(T.unsafe(nil), Array)

# A Template represents a Mustache template. It compiles and caches
# a raw string template into something usable.
#
# The idea is this: when handed a Mustache template, convert it into
# a Ruby string by transforming Mustache tags into interpolated
# Ruby.
#
# You shouldn't use this class directly, instead:
#
# >> Mustache.render(template, hash)
#
# source://mustache//lib/mustache/template.rb#17
class Mustache::Template
  # Expects a Mustache template as a string along with a template
  # path, which it uses to find partials. Options may be passed.
  #
  # @return [Template] a new instance of Template
  #
  # source://mustache//lib/mustache/template.rb#22
  def initialize(source, options = T.unsafe(nil)); end

  # Does the dirty work of transforming a Mustache template into an
  # interpolation-friendly Ruby string.
  #
  # source://mustache//lib/mustache/template.rb#49
  def compile(src = T.unsafe(nil)); end

  # Returns an array of partials.
  #
  # Partials that belong to sections are included, but the section name is not preserved
  #
  # @return [Array] Returns an array of partials.
  #
  # source://mustache//lib/mustache/template.rb#103
  def partials; end

  # Renders the `@source` Mustache template using the given
  # `context`, which should be a simple hash keyed with symbols.
  #
  # The first time a template is rendered, this method is overriden
  # and from then on it is "compiled". Subsequent calls will skip
  # the compilation step and run the Ruby version of the template
  # directly.
  #
  # source://mustache//lib/mustache/template.rb#34
  def render(context); end

  # Returns an array of sections.
  #
  # Sections that belong to other sections will be of the form `section1.childsection`
  #
  # @return [Array] Returns an array of section.
  #
  # source://mustache//lib/mustache/template.rb#86
  def sections; end

  # Returns the value of attribute source.
  #
  # source://mustache//lib/mustache/template.rb#18
  def source; end

  # Returns an array of tags.
  #
  # Tags that belong to sections will be of the form `section1.tag`.
  #
  # @return [Array] Returns an array of tags.
  #
  # source://mustache//lib/mustache/template.rb#68
  def tags; end

  # Does the dirty work of transforming a Mustache template into an
  # interpolation-friendly Ruby string.
  #
  # source://mustache//lib/mustache/template.rb#49
  def to_s(src = T.unsafe(nil)); end

  # Returns an array of tokens for a given template.
  #
  # @return [Array] Array of tokens.
  #
  # source://mustache//lib/mustache/template.rb#58
  def tokens(src = T.unsafe(nil)); end

  class << self
    # Simple recursive iterator for tokens
    #
    # source://mustache//lib/mustache/template.rb#115
    def recursor(toks, section, &block); end
  end
end

# source://mustache//lib/mustache/utils.rb#2
module Mustache::Utils; end

# source://mustache//lib/mustache/utils.rb#3
class Mustache::Utils::String
  # @return [String] a new instance of String
  #
  # source://mustache//lib/mustache/utils.rb#4
  def initialize(string); end

  # source://mustache//lib/mustache/utils.rb#8
  def classify; end

  # source://mustache//lib/mustache/utils.rb#17
  def underscore(view_namespace); end
end

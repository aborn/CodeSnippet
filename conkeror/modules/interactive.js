/**
 * (C) Copyright 2007-2009 John J. Foerch
 * (C) Copyright 2007-2008 Jeremy Maitin-Shepard
 *
 * Use, modification, and distribution are subject to the terms specified in the
 * COPYING file.
**/

require("utils.js");

var interactive_commands = {};

/**
 * name: string name of the command.
 *
 * doc: Documentation string, may be null.
 *
 * handler: A function to handle the command.
 *
 * The $prefix keyword, when true, means that the command
 * is a prefix-command.
 */
define_keywords("$prefix", "$browser_object", "$prompt");
function interactive (name, doc, handler) {
    keywords(arguments);
    var cmd = {
        name: name,
        handler: handler,
        browser_object: arguments.$browser_object,
        prefix: arguments.$prefix,
        doc: doc,
        shortdoc: get_shortdoc_string(doc),
        prompt: arguments.$prompt,
        source_code_reference: get_caller_source_code_reference() };
    interactive_commands[name] = cmd;
    return name;
}

function interactive_error (str) {
    var e = new Error(str);
    e.__proto__ = interactive_error.prototype;
    return e;
}
interactive_error.prototype.__proto__ = Error.prototype;


function interactive_context (buffer) {
    this.local = conkeror;
    this.buffer = buffer;
    if (buffer) {
        this.window = this.buffer.window;
        if (buffer.page) {
            this.local = buffer.page.local;
        } else {
            this.local = buffer.local;
        }
    }
}
interactive_context.prototype = {
    constructor: interactive_context,
    toString: function () "#<interactive_context>",
    get P () this.prefix_argument,
    get p () univ_arg_to_number(this.prefix_argument),
    set p (default_value) univ_arg_to_number(this.prefix_argument, default_value),
    get minibuffer () this.window.minibuffer,
    prefix_argument: null,
    repeat: null
};


function handle_interactive_error (window, e) {
    if (! window)
        throw e;
    if (e instanceof interactive_error) {
        window.minibuffer.message(e.message);
    } else if (e instanceof abort) {
        window.minibuffer.message("Quit");
    } else {
        dump_error(e);
        window.minibuffer.message("call interactively: " + e);
    }
}

function call_interactively (I, command) {
    var handler;
    var window = I.window;

    if (typeof command == "function") {
        // Special interactive command
        command(I);
        yield co_return();
    }

    var cmd = interactive_commands[command];
    if (!cmd) {
        handle_interactive_error(
            window,
            interactive_error("Invalid command: " + command));
        yield co_return();
    }

    I.command = cmd;
    handler = cmd.handler;

    try {
        while (typeof handler == "string") {
            let parent = interactive_commands[handler];
            handler = parent.handler;
            if (handler == command) {
                throw (interactive_error("circular command alias, "+command));
            }
        }

        try {
            yield handler(I);
        } catch (e) {
            handle_interactive_error(window, e);
        }
    } catch (e) {
        handle_interactive_error(window, e);
    }
}


function alternates () {
    let alts = Array.prototype.slice.call(arguments, 0);
    return function (I) {
        var index = 0;
        if (array_p(I.prefix_argument)) {
            let num = I.prefix_argument = I.prefix_argument[0];
            while (num >= 4 && index + 1 < alts.length) {
                num = num / 4;
                index++;
            }
        }
        yield alts[index](I);
    };
}


/*
 * Utility functions for use in the rc to alter the behavior
 * of interactive commands.
 */
function set_handler (name, handler) {
    var cmd = interactive_commands[name];
    cmd.handler = handler;
}

function set_default_browser_object (name, browser_object) {
    var cmd = interactive_commands[name];
    cmd.browser_object = browser_object;
}

provide("interactive");

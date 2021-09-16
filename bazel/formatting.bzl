"""Rules for formatting source files and 
"""

def check_format(name):
    native.genquery(
        name = name + "#query",
        expression = 'labels(srcs, kind("cc_.*|bitcode_(library|binary)", //...))',
        scope = "//...",
    )

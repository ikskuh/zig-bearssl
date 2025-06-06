# zig-bearssl

A [BearSSL](https://bearssl.org/) binding for Zig, providing primitive (and probably unsafe, i'm no SSL expert) bindings for SSL and TLS connections to generic zig code.

This binding currently binds the git commit `3c040368f6791553610e362401db1efff4b4c5b8`.

## Adding to your project

You can pull this into your project with:
```sh
 zig fetch --save git+https://github.com/ikskuh/zig-bearssl
```

Then in your `build.zig` you can add the module.

```zig
// Assuming you have `target` and `optimize` defined already

const bearssl = b.dependency(
    "zig_bearssl",
    .{ .target = target, .optimize = optimize },
);

// Assuming you have an `exe_mod` representing your module
exe_mod.addImport("bearssl", bearssl.module("bearssl"));
```

Then from inside your zig code you can do:

```zig
const bearssl = @import("bearssl")
```

const std = @import("std");

pub const bearssl = @import("src/lib.zig");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const module = b.addModule("bearssl", .{
        .root_source_file = b.path("src/lib.zig"),
        .target = target,
        .optimize = optimize,
    });
    module.addIncludePath(b.path("BearSSL/inc"));
    module.addIncludePath(b.path("BearSSL/tools"));

    const lib = b.addStaticLibrary(.{
        .name = "zig-bearssl",
        .root_source_file = b.path("src/lib.zig"),
        .target = target,
        .optimize = optimize,
    });

    bearssl.linkBearSSL(".", lib, target, b);

    b.installArtifact(lib);
}

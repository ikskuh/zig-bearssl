const std = @import("std");
const ssl = @import("./lib.zig");

pub fn main() anyerror!void {
    std.log.info("All your codebase are belong to us.", .{});

    const alloc = std.heap.c_allocator;
    const trust_anchor = ssl.TrustAnchorCollection.init(alloc);
    var x509 = ssl.x509.Minimal.init(trust_anchor);
    const client = ssl.Client.init(x509.getEngine());
    std.debug.print("{s}", .{client});
}

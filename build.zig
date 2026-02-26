const std = @import("std");

fn installTheme(b: *std.Build, name: []const u8) void {
    const dep = b.dependency(name, .{});
    b.installDirectory(.{ .source_dir = dep.path(""), .install_dir = .{ .custom = "../themes" }, .install_subdir = name });
}

pub fn build(b: *std.Build) void {
    installTheme(b, "hugo-coder");

    const hugo_server = b.addSystemCommand(&.{ "hugo", "server" });

    const server = b.step("server", "run hugo server");
    server.dependOn(&hugo_server.step);
}

const Demo = struct {
    int_field: i32,
    str_field: []const u8,
    bytes_field: []const u8,
};
const std = @import("std");

pub fn main() !void {
    const demo = Demo{ .int_field = 4, .str_field = "bleh", .bytes_field = &[_]u8{ 0xCA, 0xFE, 0xCA, 0xFE } };
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const gpa = arena.allocator();
    const out = try std.json.Stringify.valueAlloc(gpa, demo, .{});

    std.debug.print("{s}\n", .{out});
}

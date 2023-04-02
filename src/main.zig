const expect = @import("std").testing.expect;

const Struct = struct {
    a: bool,
    b: bool,
};

test "RHS first" {
    var s = Struct{
        .a = true,
        .b = true,
    };

    // RHS should be evaluated first, yielding .{ .a = false, .b = true} before
    // assignment occurs. In fact, we see the opposite, and s.a gets assigned
    // `false` before s.a gets evaluated in the next line.
    s = .{
        .a = false,
        .b = s.a,
    };
    try expect(s.b);
}

/**
 * binary_lines
 *
 * Works on long lists of "lines" which are a flat list of numbers: [xa1,ya1,xb1,yb1,xa2,ya2,xb2,yb2,...]
 * From testing, this is not really advantageous over segmented_lines implementation above.
 *
 * @param l    Flat list of line segments.
 * @param w    Width of the lines (default: 0.1).
 * @param b    Begin index (default: 0).
 * @param end  End index (optional).
 */
module binary_lines(l, w = 0.1, b = 0, end)
{
    e = is_undef(end) ? len(l) : end;
    s = e - b;
    // echo(b,e,s);
    if (s > 8)
    {
        m = b + floor(s / 8) * 4;
        binary_lines(l, w, b, m);
        binary_lines(l, w, m, e);
    }
    else if (s == 8)
    {
        line(l[b], l[b + 1], l[b + 2], l[b + 3], w);
        line(l[b + 4], l[b + 5], l[b + 6], l[b + 7], w);
    }
    else if (s == 4)
    {
        line(l[b], l[b + 1], l[b + 2], l[b + 3], w);
    }
    if (rounded)
    {
        lmax = len(l) - 1;
        translate([ l[lmax - 1], l[lmax] ]) circle(d = w);
    }
}
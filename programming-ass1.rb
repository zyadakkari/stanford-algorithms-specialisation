def rec_int_mult(x, y)
  if x < 10 || y < 10
    return x * y
  else
    n = [x.to_s.length, y.to_s.length].max
    half = n / 2
    a = x / (10 ** (half))
    b = x % (10 ** (half))
    c = y / (10 ** (half))
    d = y % (10 ** (half))
    ac = rec_int_mult(a, c)
    bd = rec_int_mult(b, d)
    ad_plus_bc = rec_int_mult(a+b, c+d)-ac-bd
    return ac * (10 ** (2 * half)) + (ad_plus_bc * (10 ** half)) + bd
  end
end

p rec_int_mult(3141592653589793238462643383279502884197169399375105820974944592, 2718281828459045235360287471352662497757247093699959574966967627)

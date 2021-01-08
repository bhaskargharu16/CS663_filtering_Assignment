%%myUnsharpMasking
function[output] = myUnsharpMasking(Input ,window, sigma, scale)
    G1 = fspecial('gaussian', window , sigma);
    blur1 = imfilter(Input, G1,'replicate' );
    output = Input + scale * (Input - blur1);
end


import pygame as pg

################### PIXEL OPERATIONS ######################

# grayPixel: pixel -> pixel
# compute and return a gray pixel with the same intensity
# as the given pixel. A little complication: the intensity
# values in the 3D numpy array representing the pixels are
# expressed as 8-bit integers. The range is 0..255. The
# problem is that if one adds together three of these, to
# get aonther 8-bit integer, there can be an overflow! So
# we convert the 8-bit integers to values of type "int" before
# we do the addition. The "int" type in Python can hold
# integer values of any size.
#
def grayPixel(pixel):
    red_intensity = int(pixel[0])
    green_intensity = int(pixel[1])
    blue_intensity = int(pixel[2])
    ave_intensity = (red_intensity + green_intensity + blue_intensity)//3
    
    return ((ave_intensity, ave_intensity, ave_intensity))

# channel: pixel -> channel -> pixel
# return a gray pixel with intensity from given channel of given pixel
def channel(pixel,chan):
    return (pixel[chan],pixel[chan],pixel[chan])


# inverse: pixel -> pixel
# return the color negative of the given pixel
def inverse(pixel):
    return (255-pixel[0], 255-pixel[1], 255-pixel[2])


# intensify: pixel -> nat255 -> pixel
# brighten each channel of pixel by quantity
#
# NOTE: there might be an overflow bug in this code!
# If so, reason through it and fix it. Consider the
# possible need for a function that brightens an
# individual pixel intensity, never returning a result
# greater than 255 or less than 0.
#
def intensify(pixel,quantity):
    return (pixel[0]+quantity, pixel[1]+quantity, pixel[2]+quantity)

def lighter(pixel):
    pixel_null = int(pixel[0])
    pixel_one = int(pixel[1])
    pixel_two = int(pixel[2])
    if (pixel_null > 255):
        new_pixel = (255, pixel_one, pixel_two)
    else:
        new_pixel = (pixel_null+10, pixel_one, pixel_two)
    if (pixel_one > 255):
        new_pixel = (pixel_null, 255, pixel_two)
    else:
        new_pixel = (pixel_null, pixel_one+10, pixel_two)
    if (pixel_two > 255):
        new_pixel = (pixel_null, pixel_one, 255)
    else:
        new_pixel = (pixel_null, pixel_one, pixel_two+10)
    return new_pixel

def darker(pixel):
    pixel_null = int(pixel[0])
    pixel_one = int(pixel[1])
    pixel_two = int(pixel[2])
    if (pixel_null < 0):
        new_pixel = (0, pixel_one, pixel_two)
    else:
        new_pixel = (pixel_null-10, pixel_one, pixel_two)
    if (pixel_one < 0):
        new_pixel = (pixel_null, 0, pixel_two)
    else:
        new_pixel = (pixel_null, pixel_one-10, pixel_two)
    if (pixel_two < 0):
        new_pixel = (pixel_null, pixel_one, 0)
    else:
        new_pixel = (pixel_null, pixel_one, pixel_two-10)
    return new_pixel

################### IMAGE OPERATIONS ######################

# invert: modifies image pixel array of image_surf in place
# replace each pixel with its photographic "negative"
#
def invert(image_surf):

    # get pixel dimensions of image
    rows = image_surf.get_size()[0]
    cols = image_surf.get_size()[1]
    
    # get reference to and lock pixel array
    pixels3d = pg.surfarray.pixels3d(image_surf)

    # update pixels in place (side effect!)
    for x in range(rows):
        for y in range(cols):
            pixels3d[x,y] = inverse(pixels3d[x,y])

# bw: modifies image pixel array of image_surf in place
# replaces each pixel with a corresponding gray-scale pixel
def bw(image_surf):

    # get pixel dimensions of image
    rows = image_surf.get_size()[0]
    cols = image_surf.get_size()[1]
    
    # get reference to and lock pixel array
    pixels3d = pg.surfarray.pixels3d(image_surf)

    # update pixels in place (side effect!)
    for x in range(rows):
        for y in range(cols):
            pixels3d[x,y] = grayPixel(pixels3d[x,y])

def lighten(image_surf):

    rows = image_surf.get_size()[0]
    cols = image_surf.get_size()[1]
    
    pixels3d = pg.surfarray.pixels3d(image_surf)

    for x in range(rows):
        for y in range(cols):
            pixels3d[x,y] = lighter(pixels3d[x,y])
            
def darken(image_surf):

    rows = image_surf.get_size()[0]
    cols = image_surf.get_size()[1]
    
    pixels3d = pg.surfarray.pixels3d(image_surf)

    for x in range(rows):
        for y in range(cols):
            pixels3d[x,y] = darker(pixels3d[x,y])










































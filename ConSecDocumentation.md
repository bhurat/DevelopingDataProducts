---
title: "Conic Sections Documentation"
author: "Basile H"
date: "April 23, 2015"
output: pdf_document
---
# Intro

This application was made to experiment with various features of the shiny package in creating a shiny web app. Rather than a hard to interpret statistical calculation, I simply graphed the conic sections on an xy plot about the origin. To understand how to use this app, you just need a simple understanding of conic sections. Conic sections stem from taking cross sections of two cones on top of each other using a plane. Doing this results in 4 possible shapes: Ellipses, circles, parabolas, and hyperbolas. Adding the possibility for horizontal parabolas and hyperbolas, we get 6 shapes. Anyways, these shapes are defined by specific values. For example, a circle is defined solely by its radius. As such, the input choices change when you choose which conic section you plan on graphing, allowing me, the author, to mess around with dynamic UI. Anyways, here are the meanings of each variable.

## Ellipse

"A = " is half the length of the **horizontal** axis of the ellipse

"B = " is half the length of the **vertical** axis of the ellipse 

## Circle

"R = " is the length of the **radius** of the circle

## Hyperbola

Hyperbolas are formed by creating asymptotes from the diagonals of a rectangle. with this in mind, 

"A = " is the main axis' side length for that rectangle
 
"B = " is the secondary axis' side length for that rectangle

## Parabola

"F = " is the distance from (0,0) to the focal point. 

"n = " This value controls the domain to be [-n,n]

## Other features

**Resolution** This value determines the amount of points used to create the shape. 

**X/Y Min/Max** These values set the axes of the graph. 

## Equations
The following are the parametric equations I used to graph these.

### Ellipse

$$x=A*cos(t)$$

$$y=B*sin(t)$$

### Circle

$$x=R*cos(t)$$

$$y=R*sin(t)$$

### Hyperbola (Vertical)

$$x=A*tan(t)$$

$$y=(-1)^t*(B*1/cos(t))$$

### Hyperbola (Horizontal)

$$x=(-1)^t*(A*1/cos(t))$$

$$y=B*tan(t)$$

### Parabola (Vertical)

$$x=(-1)^t*(2*F*t)$$

$$y=F*t^2$$

### Parabola (Horizontal)

$$x=F*t^2$$

$$y=(-1)^t*(2*F*t)$$

---
title: Object Features Detection
date: 2020-02-13
author: Jan Gaura
---

Today's exercise is focused on implementation of simple object features.
This process will take some time and we will spend more time on this topic.

One of the possible ways in detection and classification of objects in images is using object features.
Today's lecture will consist of the following steps:

- Thresholding the image,
- indexing objects.

In the end, our task is to label each object in Figure !ref(fig:input).


## Thresholding the Image

The fist step is to separate objects in the image $f$ from the background. In our example image, this task is not so hard,
so we can apply the following thresholding criterion to each pixel in image $f$ to construct a new image $g$

!marginnote(Value $1$ can be changed to $255$ to better see the output in an image that is grayscale bit 8 bits depth.)
$$
g(x, y) = \left\{
\begin{array}{cc}
1, & f(x, y) > t \\
0, & \mathrm{otherwise}
\end{array}
\right.,
$$ {#eq:threshold}
where $t$ is a chosen threshold value. There are many method to select $t$, see the text for this course.
However, in the case of our input image, we can set the threshold manually.

After this step, we have a binary image that indicates where are the objects and where is the background.

!figure(Input image.)(./images/train.png)(fig:input)


## Indexing Objects

In order to compute moments and features of the upcoming classification, we need to separate detected objects from the previous step.
This process is called indexing and its purpose is to distinguish between the objects in the binary image. The result of such process
is shown in Figure !ref(fig:index)

We can implement this process using a simple flood fill algorithm. In this algorithm, we go through all the pixels and if it belongs to
the objects, we label this pixel with chosen constant and recursively flood fill four neighbours with this constant too. As one might expect,
we label each object with different constant.

!figure(Indexed image.)(./images/indexing_scheme.png)(fig:index)

!figure(Colorized indexed image for out training image. Each color represents different object index.)(./images/indices_color.png)


[comment]: # ## Computing Moments and Features
[comment]: # Moments are common features that are used in object classification since they are easy to compute.
[comment]: # 
[comment]: # The moment that is related to the coordinate system is computed as follows
[comment]: # 
[comment]: # $$
[comment]: # m_{p, q} = \sum\limits_{x} \sum\limits_{y} x^p y^q f(x, y) \, ,
[comment]: # $$  {#eq:momentpq}
[comment]: # (in our case, we do not have to multiply the coordinates by the corresponding image function, since it is almost the same, see Figure !ref(fig:input).
[comment]: # 
[comment]: # Let us explain some important moments:
[comment]: # 
[comment]: # The **area** of an object can be computed as $m_{0, 0}$.
[comment]: # 
[comment]: # The **center of the mass** of an object:
[comment]: # $$
[comment]: # x_t = \frac{m_{1, 0}}{m_{0, 0}}, \quad y_t = \frac{m_{0, 1}}{m_{0, 0}}
[comment]: # $$  {#eq:center-of-mass}
[comment]: # 
[comment]: # The **circumference** of an object may be computed using a simple algorithm that scans each pixel of the object and if the four neighbour of the pixel
[comment]: # contains the same values as the central pixel than this pixel does not contribute to the perimeter, otherwise it does.
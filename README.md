# Makers Academy Week 1 - Boris Bikes

## About
This was the first of our weekly pairing projects set on the Makers Academy course.

The project consists of 22 challenges, each building on one another. The aim of the project was to teach us how to get stuck, research effectively and find our own solutions. It also introduced us to TDD (we used a testing framework for the first time - rspec) and OOP.

The program simulates the Boris Bikes network and associated infrastructure (docking stations, vans, repair staff etc.).

## Brief

We were given the following user stories to implement:
```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.

As a maintainer of the system,
So that members of the public can get usable bikes,
I'd like docking stations to ensure that returned entities are actually bikes

As a member of the public,
So that I can choose a particular bike of my preference,
I'd like to be able to specify which bike I receive.

As a member of the public,
So that I can avoid the hassle of starting IRB,
I'd like a text interface that can be run from the command line.
```

## Usage
Docking stations and bikes can be created and be used together as follows:
![IRB example of use](http://i.imgur.com/J13EoKs.png)

## Setup
Clone this repo, and run ```bundle``` (assuming Bundler is installed).

## Running tests
Run ```rspec```.

# Sample Covariance Estimation from Compressive Measurements

**Contributors**: Mls Pragna - 180050064, Rahul Puli - 180050080

## Abstract

This repository contains code and documentation for estimating the sample covariance matrix from compressive measurements of low-dimensional random projections. The method presented in this project offers an unbiased covariance matrix estimation from the compressive measurements, which are collected using a class of random projection matrices with certain distributional properties. Experiments demonstrate the accuracy of this method in estimating sample covariance matrices across various real-world datasets.

## Table of Contents

1. [Preliminaries](#preliminaries)
2. [The Proposed Unbiased Covariance Estimator](#the-proposed-unbiased-covariance-estimator)
3. [Compressive Estimation using Sparse Random Projections](#compressive-estimation-using-sparse-random-projections)
4. [Experimental Results](#experimental-results)
5. [Conclusions](#conclusions)
6. [References](#references)

## Preliminaries

### 1. Unbiased Estimator

An estimator is said to be unbiased if its expected value equals the parameter being estimated. In this project, we present an unbiased estimator for the covariance matrix of data.

### 2. Moments of Probabilistic Distribution

Moments are quantitative measures related to the shape of a distribution. This project assumes that random projection matrices have finite first four moments. This includes the first moment (expected value), second moment (variance), third standardized moment (skewness), and the fourth standardized moment (kurtosis).

## The Proposed Unbiased Covariance Estimator

The main objective of this project is to estimate the covariance matrix from low-dimensional projections of data. The proposed method aims to eliminate bias and provide an unbiased estimator for the sample covariance matrix.

## Compressive Estimation using Sparse Random Projections

The project introduces sparse random projection matrices, which are entries drawn from -1, 0, or 1 with certain probabilities. This approach reduces computational cost and bias terms. We also discuss the importance of the compression factor (gamma) in this context.

## Experimental Results

Experimental results are provided for various real-world datasets, including MNIST, Gen4, and traffic datasets. We evaluate the accuracy of the unbiased covariance estimator using the normalized covariance estimation error. Graphs and images illustrate the accuracy of the estimated covariance matrices.

## Conclusions

This project contributes a method for estimating sample covariance matrices from compressive measurements without assuming specific properties of the original covariance matrix. The unbiased estimator is demonstrated across different datasets, showing its effectiveness and applicability.

## References

- [Link to the Original Paper](https://arxiv.org/pdf/1512.08887.pdf)
- [Unbiased Estimators](http://stat88.org/textbook/notebooks/Chapter_05/04_Unbiased_Estimators.html)
- [Moments in Mathematics](https://en.wikipedia.org/wiki/Moment_(mathematics))

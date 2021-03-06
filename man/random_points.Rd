% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/random_points.R
\name{random_points}
\alias{random_points}
\alias{random_points.hr}
\alias{random_points.sf}
\alias{random_points.SpatialPolygons}
\alias{random_points.track_xy}
\title{Generate random points}
\usage{
random_points(x, ...)

\method{random_points}{hr}(x, n = 100, type = "random",
  presence = NULL, ...)

\method{random_points}{sf}(x, n = 100, type = "random",
  presence = NULL, ...)

\method{random_points}{SpatialPolygons}(x, n = 100, type = "random",
  presence = NULL, ...)

\method{random_points}{track_xy}(x, level = 1, hr = "mcp",
  n = nrow(x) * 10, type = "random", ...)
}
\arguments{
\item{x}{\code{[track_xy, track_xyt]} \cr A track created with \code{make_track}.}

\item{...}{\code{[any]}\cr None implemented.}

\item{n}{\code{[integer(1)]} \cr The number of random points.}

\item{type}{\code{[character(1)]} \cr Argument passed to \code{sp::spsample type}. The default is \code{random}.}

\item{presence}{\code{[track]} \cr The presence points, that will be added to the result.}

\item{level}{\code{[numeric(1)]} \cr Home-range level of the minimum convex polygon, used for generating the background samples.}

\item{hr}{\code{[character(1)]} \cr The home range estimator to be used. Currently only MCP is implemented.}
}
\description{
Functions to generate random points within an animals home range. This is usually the first step for investigating habitat selection via Resource Selection Functions (RSF).
}
\note{
For objects of class \code{track_xyt} the timestamp (\code{t_}) is lost.
}
\examples{

data(deer)

# track_xyt ---------------------------------------------------------------
# Default settings
rp1 <- random_points(deer)

\dontrun{
plot(rp1)
}

 \dontrun{
trast <- raster(bbox(deer, buffer = 5000), res = 30)
rp3 <- random_points(deer, hr = "kde", trast = trast) # we need a larger template raster

plot(rp3)
}


# Only one random point for each observed point
rp <- random_points(deer, factor = 1)
\dontrun{
plot(rp)
}

# Within a home range -----------------------------------------------------
hr <- hr_mcp(deer, level = 1)

# 100 random point within the home range
rp <- random_points(hr, n = 100)
\dontrun{
plot(rp)
}

# 100 regular point within the home range
rp <- random_points(hr, n = 100, type = "regular")
\dontrun{
plot(rp)
}
# 100 hexagonal point within the home range
rp <- random_points(hr, n = 100, type = "hexagonal")
\dontrun{
plot(rp)
}

}

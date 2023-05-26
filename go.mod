module github.com/franklinkim/go-monorepo

go 1.20

replace (
	github.com/franklinkim/go-monorepo/one => ./one
	github.com/franklinkim/go-monorepo/two => ./two
)

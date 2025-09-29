module github.com/franklinkim/go-monorepo/one

go 1.25

replace (
	github.com/franklinkim/go-monorepo => ../
	github.com/franklinkim/go-monorepo/two => ../two
)

require (
	github.com/franklinkim/go-monorepo/two v0.0.0-00010101000000-000000000000
	github.com/stretchr/testify v1.11.1
)

require (
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

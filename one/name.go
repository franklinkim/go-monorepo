package one

import (
	"github.com/franklinkim/go-monorepo/two"
)

func String() string {
	return "one" + two.String()
}

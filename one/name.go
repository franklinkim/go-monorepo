package one

import (
	"github.com/franklinkim/go-monorepo/two"
)

func String() string {
	return "0.2.9" + two.String()
}

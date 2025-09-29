package one_test

import (
	"testing"

	"github.com/franklinkim/go-monorepo/one"
	"github.com/stretchr/testify/assert"
)

func TestName(t *testing.T) {
	t.Parallel()

	assert.Equal(t, "onetwo", one.String())
}

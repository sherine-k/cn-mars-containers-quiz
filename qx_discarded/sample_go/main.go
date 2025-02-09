package main

import (
	"fmt"
	"io"
	"time"

	"math/rand"

	"github.com/vbauerster/mpb/v8"
	"github.com/vbauerster/mpb/v8/decor"
	"golang.org/x/sync/errgroup"
)

const (
	Pushpin                     string = "\U0001F4CC"           //📌
	Rocket                      string = "\U0001F680"           //🚀
	WavingHandSign              string = "\U0001F44B"           //👋
	TwistedRighwardsArrows      string = "\U0001F500"           //🔀
	Memo                        string = "\U0001F4DD"           //📝
	PageFacingUp                string = "\U0001F4C4"           //📄
	Package                     string = "\U0001F4E6"           //📦
	SleuthOrSpy                 string = "\U0001F575"           //🕵️
	LeftPointingMagnifyingGlass string = "\U0001F50D"           //🔍
	RepeatSingleButton          string = "\U0001F502"           //🔂
	Eyes                        string = "\U0001F440"           //👀
	RightArrow                  string = "\U000027A1\U0000FE0F" // ➡️
	CheckMarkButton             string = "\U00002705"           //✅
	CrossMark                   string = "\U0000274C"           // ❌
	SpinnerCheckMark            string = "\x1b[1;92m ✓ \x1b[0m" //✓
	SpinnerCrossMark            string = "\x1b[1;91m ✗ \x1b[0m" //✗
	Gear                        string = "\u2699\uFE0F"         // ⚙️
	Warning                     string = "\U000026A0\U0000FE0F" // ⚠️

)

type GoroutineResult struct {
	id  int
	err error
}

func main() {
	total := 44
	maxGoroutines := 8
	var wg errgroup.Group
	wg.SetLimit(maxGoroutines)
	p := mpb.New(mpb.PopCompletedMode())
	results := make(chan GoroutineResult, total)

	defer close(results)
	for j := 0; j < total; j++ {
		spinner := newSpinner(j, p)
		wg.Go(func() error {
			result := GoroutineResult{}

			result.id = j

			var err error

			time.Sleep(time.Second * time.Duration(rand.Intn(40)))
			err = nil
			if rand.Intn(3) == 0 {
				err = fmt.Errorf("%d failed", result.id)
			}
			result.err = err
			results <- result

			switch {
			case err == nil:
				spinner.Increment()
				return nil
			default:
				spinner.Abort(false)
				return nil
			}

		})
	}

	wg.Wait()

	p.Wait()
	completed := 0
	for completed < total {
		res := <-results
		if res.err != nil {
			fmt.Printf("%d finished with error %v", res.id, res.err)
		} else {
			fmt.Printf("%d finished ", res.id)
		}
		completed++
	}

}

func PositionSpinnerLeft(original mpb.BarFiller) mpb.BarFiller {
	return mpb.SpinnerStyle("⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏", " ").PositionLeft().Build()
}

func EmptyDecorator() decor.Decorator {
	return decor.Any(func(s decor.Statistics) string {
		return ""
	})
}

func BarFillerClearOnAbort() mpb.BarOption {
	return mpb.BarFillerMiddleware(func(base mpb.BarFiller) mpb.BarFiller {
		return mpb.BarFillerFunc(func(w io.Writer, st decor.Statistics) error {
			if st.Aborted {
				_, err := io.WriteString(w, "")
				return err
			}
			return base.Fill(w, st)
		})
	})
}

func newSpinner(id int, p *mpb.Progress) *mpb.Bar {
	imageText := fmt.Sprintf(" %d ", id)

	return p.AddSpinner(
		1,
		mpb.BarFillerMiddleware(PositionSpinnerLeft),
		mpb.BarWidth(3),
		mpb.PrependDecorators(
			decor.OnComplete(EmptyDecorator(), SpinnerCheckMark),
			decor.OnAbort(EmptyDecorator(), SpinnerCrossMark),
		),
		// mpb.BarRemoveOnComplete(),
		mpb.AppendDecorators(
			decor.Name("("),
			decor.Elapsed(decor.ET_STYLE_GO),
			decor.Name(")"),
			decor.Name(imageText),
		),
		mpb.BarFillerClearOnComplete(),
		BarFillerClearOnAbort(),
	)
}

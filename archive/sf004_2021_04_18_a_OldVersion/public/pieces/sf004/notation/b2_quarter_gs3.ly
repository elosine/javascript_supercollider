\version "2.20.0"

\paper{
  paper-width = 160
  paper-height = 100

  top-margin = 0
  bottom-margin = 0
  left-margin = 1
  right-margin = 1
  
  system-system-spacing =
  #'((basic-distance . 15)  %this controls space between lines default = 12
      (minimum-distance . 8)
      (padding . 1)
      (stretchability . 60)) 

}

\book {

  \header {
    tagline = ##f
  }

  \score {

    <<

      \override Score.BarNumber.break-visibility = ##(#f #f #f)

      \new Staff \with {
        \omit TimeSignature
        % \omit BarLine
        %\omit Clef
        \omit KeySignature
        \override StaffSymbol.thickness = #1
      }

      {
        \time 4/4
        %\override TupletBracket.bracket-visibility = ##t
        \override TupletBracket.bracket-visibility = ##f
        \override TupletNumber.visibility = ##f
        %S\set tupletFullLength = ##t
        \override NoteHead.font-size = #-1
        \override Stem.details.beamed-lengths = #'(7)
        \override Stem.details.lengths = #'(7)
        \override NoteColumn.accent-skip = ##t
        %\stopStaff
        %\once \override TupletNumber #'text = "7:4"
        
        
        \stopStaff
        \override NoteHead.transparent = ##t
        \override NoteHead.no-ledgers = ##t 
        \override Script.transparent = ##t
        \override Stem.transparent = ##t  
        \override TupletBracket.bracket-visibility = ##f
        \override TupletNumber.transparent = ##t
        \override Staff.Clef.transparent =##t
        \override Staff.BarLine.transparent =##t
        c'4c'c'c'c'c'c'c'
        
        \repeat volta 2{
          
          c'4
          
          \startStaff
          \override NoteHead.transparent = ##f
          \override NoteHead.no-ledgers = ##f
          \override Script.transparent = ##f
          \override Stem.transparent = ##f  
          \override TupletBracket.bracket-visibility = ##t
          \override TupletNumber.transparent = ##f
          \override Staff.Clef.transparent =##t
          \override Staff.BarLine.transparent =##t
          
          
          
          gis4
          
          
          
          \stopStaff
          \override NoteHead.transparent = ##t
          \override NoteHead.no-ledgers = ##t 
          \override Script.transparent = ##t
          \override Stem.transparent = ##t  
          \override TupletBracket.bracket-visibility = ##f
          \override TupletNumber.transparent = ##t
          \override Staff.Clef.transparent =##t
          \override Staff.BarLine.transparent =##t
          
          \tuplet 5/4 {    f16\hide-> f f f f }            
          \tuplet 5/4 {c'''16\hide-> c'''c'''c'''c'''}                
          
          c'16c'c'c'       
          c'4     
          c'      
          c'   
          
          c'4        
          \tuplet 5/4 {c'''16\hide-> c'''c'''c'''c'''}       
          \tuplet 5/4 {f16\hide-> f f f f}     
          c'4  
          
          c'4  
          c'4 
          c'4  
          c'4
        }
        
        
        
        
        
        
        \stopStaff
        \override Staff.Clef.transparent =##t
        c'4c'c'c'c'c'c'c'
        
      }

    >>

    \layout{
      \context {
        \Score
        proportionalNotationDuration = #(ly:make-moment 1/20)
        %proportionalNotationDuration = #(ly:make-moment 1/28)
        %proportionalNotationDuration = #(ly:make-moment 1/8)
        %\override SpacingSpanner.uniform-stretching = ##t
        %  \override SpacingSpanner.strict-note-spacing = ##t
        %  \override SpacingSpanner.strict-grace-spacing = ##t
        \override Beam.breakable = ##t
        \override Glissando.breakable = ##t
        \override TextSpanner.breakable = ##t
        \override NoteHead.no-ledgers = ##t 
      }

      indent = 0
      line-width = 158
      #(layout-set-staff-size 20)
      \hide Stem
      \hide NoteHead
      \hide LedgerLineSpanner
      \hide TupletNumber 
    }

    \midi{}

  }
}


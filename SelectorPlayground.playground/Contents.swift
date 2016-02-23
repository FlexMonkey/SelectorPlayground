/*:
 ## SelectorDemo

 ### Demonstration of `#selector` expression

 Simon Gladman | Feb 2016
 
 [http://flexmonkey.blogspot.co.uk/](flexmonkey.blogspot.co.uk/)
*/

import UIKit
import XCPlayground


class SelectorDemo: UIStackView
{
    let buttonOne = UIButton(type: .InfoDark)
    let buttonTwo = UIButton(type: .InfoDark)
    let buttonThree = UIButton(type: .InfoDark)
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        let selectorOne = #selector(SelectorDemo.showInfo as (SelectorDemo) -> () -> ())
        let selectorTwo = #selector(showInfo(_:))
        let selectorThree = #selector(showInfo(button:))
        
        buttonOne.addTarget(self, action: selectorOne, forControlEvents: .TouchDown)
        buttonTwo.addTarget(self, action: selectorTwo, forControlEvents: .TouchDown)
        buttonThree.addTarget(self, action: selectorThree, forControlEvents: .TouchDown)
        
        addArrangedSubview(buttonOne)
        addArrangedSubview(buttonTwo)
        addArrangedSubview(buttonThree)
        
        distribution = .FillEqually
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    

    func showInfo()
    {
        print("one: showInfo()")
    }
    
    func showInfo(button: UIButton)
    {
        print("two: showInfo(_:)", button.debugDescription)
    }
    
    func showInfo(button button: UIButton)
    {
        print("three: showInfo(button:)", button.debugDescription)
    }
    


}

let selectorDemo = SelectorDemo(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

XCPlaygroundPage.currentPage.liveView = selectorDemo


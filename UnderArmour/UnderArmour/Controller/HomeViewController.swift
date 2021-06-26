//
//  ViewController.swift
//  UnderArmour
//
//  Created by Patricia Fiona on 25/06/21.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var homeBannerSlideshow: UIScrollView!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    var isFirstLaunch: Bool = false
    
    var imgs = ["homeBanner01","homeBanner02"]
    
    //get dynamic width and height of scrollview and save it
    override func viewDidLayoutSubviews() {
        scrollWidth = homeBannerSlideshow.frame.size.width
        scrollHeight = homeBannerSlideshow.frame.size.height
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onBoardContentPotrait()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }

    func setIndiactorForCurrentPage()  {
        let page = (homeBannerSlideshow?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
    
    private func clearSubViews(){
        let subViews = self.homeBannerSlideshow.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
    }
    
    private func onBoardContentPotrait(){
        var scrollWidth: CGFloat?
        var scrollHeight: CGFloat?
        
        let group = DispatchGroup()
            group.enter()

            DispatchQueue.main.async {
                scrollWidth = self.homeBannerSlideshow.frame.size.width
                scrollHeight = self.homeBannerSlideshow.frame.size.height
                group.leave()
            }
        
        group.notify(queue: .main) {
            self.view.layoutIfNeeded()
            //to call viewDidLayoutSubviews() and get dynamic width and height of scrollview

            self.homeBannerSlideshow.delegate = self
            self.homeBannerSlideshow.isPagingEnabled = true
            self.homeBannerSlideshow.showsHorizontalScrollIndicator = false
            self.homeBannerSlideshow.showsVerticalScrollIndicator = false
            self.homeBannerSlideshow.autoresizesSubviews = true
            //crete the slides and add them
            var frame = CGRect(x: 0, y: 0, width: 0, height: 0)

            for index in 0..<self.imgs.count {
                frame.origin.x = scrollWidth! * CGFloat(index)
                frame.size = CGSize(width: scrollWidth!, height: scrollHeight!)

                let slide = UIView(frame: frame)

                //subviews
                let imageView = UIImageView.init(image: UIImage.init(named: self.imgs[index]))
                imageView.frame = CGRect(x:0,y:0,width:scrollWidth!,height:scrollHeight!)
                imageView.contentMode = .scaleAspectFit
                imageView.center = CGPoint(x:scrollWidth!/2,y: scrollHeight!/2 - 50)

                slide.addSubview(imageView)
                self.homeBannerSlideshow.addSubview(slide)

            }

            //set width of scrollview to accomodate all the slides
            self.homeBannerSlideshow.contentSize = CGSize(width: scrollWidth! * CGFloat(self.imgs.count), height: scrollHeight!)

            //disable vertical scroll/bounce
            self.homeBannerSlideshow.contentSize.height = 1.0

            //initial state
            self.pageControl.numberOfPages = self.imgs.count
            self.pageControl.currentPage = Int(self.homeBannerSlideshow.contentOffset.x / self.homeBannerSlideshow.frame.size.width)
        }
        
    }


}


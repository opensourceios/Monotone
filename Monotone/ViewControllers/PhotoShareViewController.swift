//
//  PhotoShareViewController.swift
//  Monotone
//
//  Created by Xueliang Chen on 2020/12/4.
//

import UIKit

import RxSwift
import Kingfisher

// MARK: - PhotoShareViewController
class PhotoShareViewController: BaseViewController {
    
    // MARK: - Controls
    private var pageTitleView: PageTitleView!
    
    private var photoImageView: UIImageView!
    private var photoShareSMView: PhotoShareSMView!
    private var photoShareUrlView: PhotoShareUrlView!
    
    // MARK: - Private
    private let disposeBag: DisposeBag = DisposeBag()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func buildSubviews() {
        self.view.backgroundColor = UIColor.white
        
        // pageTitleView.
        self.pageTitleView = PageTitleView()
        self.view.addSubview(self.pageTitleView)
        self.pageTitleView.snp.makeConstraints { (make) in
            make.left.equalTo(15.0)
            make.right.equalTo(-15.0)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40.0)
            make.height.equalTo(50.0)
        }
        
        // photoImageView.
        self.photoImageView = UIImageView()
        self.photoImageView.contentMode = .scaleAspectFill
        self.photoImageView.layer.cornerRadius = 6.0
        self.photoImageView.layer.masksToBounds = true
        self.view.addSubview(self.photoImageView)
        self.photoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.pageTitleView.snp.bottom).offset(30.0)
            make.left.equalTo(15.0)
            make.right.equalTo(self.view.snp.right).multipliedBy(4.0/7)
            make.bottom.equalTo(self.view).offset(-90.0)
        }
        
        // photoShareSMView.
        self.photoShareSMView = PhotoShareSMView()
        self.view.addSubview(self.photoShareSMView)
        self.photoShareSMView.snp.makeConstraints { (make) in
            make.top.equalTo(self.photoImageView).offset(10.0)
            make.bottom.equalTo(self.photoImageView).offset(-10.0)
            make.left.equalTo(self.photoImageView.snp.right)
            make.right.equalTo(self.view)
        }
        
        // photoShareUrlView.
        self.photoShareUrlView = PhotoShareUrlView()
        self.view.addSubview(self.photoShareUrlView)
        self.photoShareUrlView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-28.0)
            make.left.equalTo(self.view).offset(17.0)
            make.right.equalTo(self.view).offset(-17.0)
            make.height.equalTo(46.0)
        }
    }
    
    override func buildLogic() {
        
        // ViewModel.
        let photoShareViewModel = self.viewModel(type: PhotoShareViewModel.self)!
        
        // Bindings.
        photoShareViewModel.output.photo.subscribe(onNext: { photo in
            
            // pageTitleView.
            self.pageTitleView.title.accept(NSLocalizedString("unsplash_share_title", comment: "Share"))
            
            if let editor = photo.user?.username{
                let subtitle = String(format: NSLocalizedString("unsplash_share_subtitle_prefix", comment: "Photo by %@"), editor)
                self.pageTitleView.subtitle.accept(subtitle)
            }
            
            // photoImageView.
            self.photoImageView.kf.setImage(with: URL(string: photo.urls?.regular ?? ""),
                                            placeholder: UIImage(blurHash: photo.blurHash ?? "", size: CGSize(width: 10, height: 10)),
                                            options: [.transition(.fade(1.0)), .originalCache(.default)])
            
            // photoShareImage
        })
        .disposed(by: self.disposeBag)
                
        photoShareViewModel.output.photo.subscribe(onNext: { photo in
            self.photoShareUrlView.url.accept(photo.links?.selfLink)
            
        })
        .disposed(by: self.disposeBag)
    }
    
}
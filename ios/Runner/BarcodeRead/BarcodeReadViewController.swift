//
//  CameraViewController.swift
//  Kusuri
//
//  Created by Yus Inoue on 2021/08/29.
//

import UIKit
import AVFoundation
import RxSwift
import RxCocoa
import SnapKit
import Vision

class MyCustomViewController: UIViewController {
    let previewArea = UIView()
        
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let layer = AVCaptureVideoPreviewLayer()
        layer.backgroundColor = UIColor.clear.cgColor
        layer.videoGravity = .resizeAspectFill
        return layer
    }()
    
    private let session = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        previewArea.backgroundColor = .blue
        view.addSubview(previewArea)
        
        previewArea.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previewArea.topAnchor.constraint(equalTo: view.topAnchor),
            previewArea.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previewArea.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            previewArea.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = previewArea.frame
        setupCamera()
    }
    
    func setupCamera() {
        guard let device = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: .video, position: .back),
              let input = try? AVCaptureDeviceInput(device: device) else {
            return
        }
        let output = AVCaptureVideoDataOutput()
        output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
        output.alwaysDiscardsLateVideoFrames = true
        output.setSampleBufferDelegate(self, queue: .global())
        startSession(input: input, output: output)
    }
    
    func startSession(input: AVCaptureDeviceInput, output: AVCaptureVideoDataOutput) {
        if previewLayer.session == nil {
            previewLayer.session = self.session
            session.sessionPreset = .photo
        }
        if session.canAddInput(input) && session.canAddOutput(output) {
            session.addInput(input)
            session.addOutput(output)
        }
        if !session.isRunning {
            DispatchQueue.global(qos: .userInitiated).async {
                self.session.startRunning()
            }
        }
    }
    
    func restartSession() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.session.startRunning()
        }
    }
    
    func quitSession() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.session.stopRunning()
            for output in self.session.outputs {
                self.session.removeOutput(output as AVCaptureOutput)
            }
            for input in self.session.inputs {
                self.session.removeInput(input as AVCaptureInput)
            }
        }
    }
}

extension MyCustomViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        let barcodesRequest = VNDetectBarcodesRequest { [weak self] request, error in
            guard let self = self,
                  let barcode = request.results?.first as? VNBarcodeObservation,
                  error == nil else {
                return
            }
            
            // ここにバーコード検出時の処理を記述
            print("Barcode detected: \(barcode.payloadStringValue ?? "Unknown")")
        }
        barcodesRequest.revision = VNDetectBarcodesRequestRevision2
        
        do {
            let handler = VNSequenceRequestHandler()
            try handler.perform([barcodesRequest], on: pixelBuffer)
        } catch {
            print("Vision error: \(error.localizedDescription)")
        }
    }
}


//
//class BarcodeReader2: NSObject {
//    let session: AVCaptureSession!
//    let previewLayer: AVCaptureVideoPreviewLayer!
//    
//    var barcodeObservable: Driver<VNBarcodeObservation> {
//        return relay.asDriver(onErrorDriveWith: .empty())
//    }
//    
//    private let relay = PublishRelay<VNBarcodeObservation>()
//
//    private func detect(barcode: VNBarcodeObservation) {
//        relay.accept(barcode)
//    }
//    
//    var sessionRunning: Driver<Bool> {
//        return runnningRelay.asDriver(onErrorDriveWith: .empty())
//    }
//    private let runnningRelay = PublishRelay<Bool>()
//
//    var observer: NSKeyValueObservation?
//    
//    init(previewLayer: AVCaptureVideoPreviewLayer) {
//        self.session = AVCaptureSession()
//        self.previewLayer = previewLayer
//        super.init()
//        
//        observer = session.observe(\.isRunning, options: .new, changeHandler: { [weak self] _, change in
//            guard let self = self, let newValue = change.newValue else {
//                return
//            }
//            self.runnningRelay.accept(newValue)
//        })
//    }
//    
//    func setupCamera() {
//        guard let device = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: .video, position: .back),
//              let input = try? AVCaptureDeviceInput(device: device) else {
//            return
//        }
//        let output = AVCaptureVideoDataOutput()
//        output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
//        output.alwaysDiscardsLateVideoFrames = true
//        output.setSampleBufferDelegate(self, queue: .global())
//        startSession(input: input, output: output)
//    }
//    
//    func startSession(input:  AVCaptureDeviceInput, output: AVCaptureVideoDataOutput) {
//        if previewLayer.session == nil {
//            previewLayer.session = self.session
//            session.sessionPreset = .photo
//        }
//        if session.canAddInput(input) && session.canAddOutput(output) {
//            session.addInput(input)
//            session.addOutput(output)
//        }
//        if session.isRunning == false {
//            session.startRunning()
//        }
//        session.startRunning()
//    }
//    
//    func restartSession() {
//        session.startRunning()
//    }
//    
//    func quitSession() {
//        session.stopRunning()
//        for output in session.outputs {
//            session.removeOutput(output as AVCaptureOutput)
//        }
//        for input in session.inputs {
//            session.removeInput(input as AVCaptureInput)
//        }
//    }
//}





//
//
//final class BarcodeReadViewController: UIViewController {
//    var viewModel: BarcodeReadViewModel!
//    private let disposeBag = DisposeBag()
//    
//    private lazy var textLayer: CATextLayer = {
//        var layer = CATextLayer()
//        layer.contentsScale = UIScreen.main.scale
////         layer.fontSize = UIDevice.current.separateValue(forPad: 25, forPhone: 16)
//        layer.alignmentMode = CATextLayerAlignmentMode.center
////         layer.cornerRadius = UIDevice.current.separateValue(forPad: 8, forPhone: 4)
//        layer.backgroundColor = UIColor(white: 0.25, alpha: 0.5).cgColor
//        layer.string = "バーコードを読み取りました👍"
//        layer.isHidden = true
//        return layer
//    }()
//    
//    private let previewArea = UIView()
//    private let descriptionArea = UIView()
//    
//    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
//        let layer = AVCaptureVideoPreviewLayer()
//        layer.backgroundColor = UIColor.clear.cgColor
//        layer.videoGravity = .resizeAspectFill
//        return layer
//    }()
//    
//    private let captureDiscriptionStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.alignment = .center
//        stackView.axis = .vertical
////        stackView.spacing = UIDevice.current.separateValue(forPad: 44, forPhone: 24)
//        stackView.distribution = .equalCentering
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.isHidden = false
//        return stackView
//    }()
//    
//    private let discriptionLabel1: UILabel = {
//        let label = UILabel()
////        label.text = UIDevice.current.separateValue(forPad: "バーコードを撮影枠内に映してください", forPhone: "バーコードを撮影枠内に\n映してください")
////        label.textColor = .weakText
////        label.font = .largeRegular
//        label.backgroundColor = .clear
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let discriptionLabel2: UILabel = {
//        let label = UILabel()
////        label.text = UIDevice.current.separateValue(forPad: "読み取りが成功すると、添付文書を閲覧できます", forPhone: "読み取りが成功すると\n添付文書を閲覧できます")
////        label.textColor = .weakText
////        label.font = .mediumLight
//        label.backgroundColor = .clear
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let caputureResultStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.alignment = .center
//        stackView.axis = .vertical
////        stackView.spacing = UIDevice.current.separateValue(forPad: 44, forPhone: 24)
//        stackView.distribution = .equalCentering
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.isHidden = true
//        return stackView
//    }()
//    
//    private let showDetailButton: UIButton = {
//        let button = UIButton(type: .roundedRect)
//        button.setTitle("添付文書を見る", for: .normal)
////        button.titleLabel?.font = .mediumRegular
////        button.backgroundColor = .primary
////        button.tintColor = .white
////        button.layer.cornerRadius = 22
//        return button
//    }()
//    
//    private let reStartButton: UIButton = {
//        let button = UIButton(type: .roundedRect)
//        button.setTitle("もう一度読み取る", for: .normal)
////        button.titleLabel?.font = .mediumRegular
////        button.backgroundColor = .clear
////        button.layer.borderColor = UIColor.primary.cgColor
////        button.layer.borderWidth = 2
////        button.layer.cornerRadius = 22
//        return button
//    }()
//    
//    private let cameraSettingView: UIView = {
//        let view = UIView()
////        view.backgroundColor = .backgroundCover
//        view.isHidden = true
//        return view
//    }()
//    
//    var cameraSettingImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(systemName: "camera")
////        imageView.tintColor =  .weakText
//        return imageView
//    }()
//    
//    private let cameraSettingLabel1: UILabel = {
//        let label = UILabel()
//        label.text = "カメラへのアクセスが許可されていません"
////        label.textColor = .weakText
////        label.font = .largeRegular
////        label.backgroundColor = .clear
////        label.textAlignment = .center
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let cameraSettingLabel2: UILabel = {
//        let label = UILabel()
//        label.text = "バーコードの読み取りに必要です"
////        label.textColor = .weakText
////         label.font = .mediumLight
////        label.backgroundColor = .clear
////        label.textAlignment = .center
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let cameraSettingButton: UIButton = {
//        let button = UIButton(type: .roundedRect)
//        button.setTitle("カメラ設定を開く", for: .normal)
////         button.titleLabel?.font = .mediumRegular
////        button.backgroundColor = .primary
////        button.tintColor = .white
//        button.layer.cornerRadius = 22
//        return button
//    }()
//    
////    private lazy var barcodeReader = BarcodeReader(previewLayer: previewLayer)
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.isUserInteractionEnabled = true
////         view.backgroundColor = .backgroundCover
//        setupCamera()
//        addSubViews()
//        adjustLayout()
//        bind()
//        addActions()
//    }
//    
//    private func addSubViews() {
//        let titleLabel = UILabel()
//        titleLabel.text = "バーコード"
////         titleLabel.textColor = .strongText
////        titleLabel.font = .largeRegular
//        navigationItem.titleView = titleLabel
//        navigationItem.hidesSearchBarWhenScrolling = false
////         navigationController?.navigationBar.tintColor = .primary
//        navigationController?.navigationBar.prefersLargeTitles = false
//        navigationController?.navigationBar.isTranslucent = false
//        
//        view.layer.masksToBounds = true
//        view.addSubview(previewArea)
//        view.addSubview(descriptionArea)
//        view.layer.addSublayer(previewLayer)
//        previewLayer.addSublayer(textLayer)
//        view.addSubview(cameraSettingView)  // !! UI仕様の都合、一番最後にAddSubViewすること
//        
//        descriptionArea.addSubview(captureDiscriptionStackView)
//        captureDiscriptionStackView.addArrangedSubview(discriptionLabel1)
//        captureDiscriptionStackView.addArrangedSubview(discriptionLabel2)
//        
//        descriptionArea.addSubview(caputureResultStackView)
//        caputureResultStackView.addArrangedSubview(showDetailButton)
//        caputureResultStackView.addArrangedSubview(reStartButton)
//
//        cameraSettingView.addSubview(cameraSettingImageView)
//        cameraSettingView.addSubview(cameraSettingLabel1)
//        cameraSettingView.addSubview(cameraSettingLabel2)
//        cameraSettingView.addSubview(cameraSettingButton)
//    }
//    
//    private func adjustLayout() {
//        previewArea.snp.makeConstraints({ make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.bottom.equalTo(descriptionArea.snp.top)
//            make.width.equalToSuperview()
//        })
//        descriptionArea.snp.makeConstraints({ make in
//            let height = 300
//            
//            make.height.equalTo(height)
//            make.width.equalToSuperview()
//            make.bottom.equalTo(view.safeAreaLayoutGuide)
//        })
//        
//        discriptionLabel1.snp.makeConstraints({ make in
//            make.width.equalToSuperview()
//        })
//        discriptionLabel2.snp.makeConstraints({ make in
//            make.width.equalToSuperview()
//        })
//        captureDiscriptionStackView.snp.makeConstraints({ make in
//            let horizontalInset = 88
//            make.left.right.equalToSuperview().inset(horizontalInset)
//            make.center.equalToSuperview()
//        })
//        
//        showDetailButton.snp.makeConstraints({ make in
//            make.height.equalTo(44)
//            make.width.equalToSuperview()
//        })
//        reStartButton.snp.makeConstraints({ make in
//            make.height.equalTo(44)
//            make.width.equalToSuperview()
//        })
//        caputureResultStackView.snp.makeConstraints({ make in
//            let horizontalInset = 100
//            make.center.equalToSuperview()
//            make.left.right.equalToSuperview().inset(horizontalInset)
//        })
//        
//        cameraSettingView.snp.makeConstraints({ make in
//            make.edges.equalToSuperview()
//        })
//        cameraSettingImageView.snp.makeConstraints({ make in
//            let bottomOffset = -60
//            let heightWidth = 100
//            
//            make.centerX.equalToSuperview()
//            make.bottom.equalTo(cameraSettingLabel1.snp.top).offset(bottomOffset)
//            make.height.width.equalTo(heightWidth)
//        })
//        cameraSettingLabel1.snp.makeConstraints({ make in
//            let horizontalInset = 60
//
//            make.center.equalToSuperview()
//            make.left.right.equalToSuperview().inset(horizontalInset)
//        })
//        cameraSettingLabel2.snp.makeConstraints({ make in
//            let topOffset = 60
//            let horizontalInset = 60
//
//            make.top.equalTo(cameraSettingLabel1.snp.bottom).offset(topOffset)
//            make.centerX.equalToSuperview()
//            make.left.right.equalToSuperview().inset(horizontalInset)
//        })
//        cameraSettingButton.snp.makeConstraints({ make in
//            let horizontalInset = 100
//            let topOffset = 80
//            
//            make.top.equalTo(cameraSettingLabel2.snp.bottom).offset(topOffset)
//            make.left.right.equalToSuperview().inset(horizontalInset)
//            make.height.equalTo(44)
//        })
//    }
//        
//    override func viewDidLayoutSubviews() {
//        previewLayer.frame = previewArea.frame
//        
//        let height = 35
//        let width = 400
//        let x = Int(previewArea.center.x) - width/2
//        let y = Int(previewArea.center.y)
//        textLayer.frame = CGRect(x: x, y: y, width: width, height: height)
//        barcodeReader.setupCamera()
//    }
//    
//    private func addActions() {
//        reStartButton.rx.tap
//            .subscribe(with: self, onNext: { Object, _ in
//                Object.barcodeReader.setupCamera()
//            })
//            .disposed(by: disposeBag)
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        cameraSettingView.isHidden = AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .authorized
//        barcodeReader.setupCamera()
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        barcodeReader.quitSession()
//    }
//
//    private func bind() {
//        let input = BarcodeReadViewModel.Input(
//            barcode: barcodeReader.barcodeObservable,
//            showDetailButtonTapped: showDetailButton.rx.tap.asSignal(),
//            cameraSettingButtonTapped: cameraSettingButton.rx.tap.asSignal()
//        )
//        
//        barcodeReader.sessionRunning
//            .drive(caputureResultStackView.rx.isHidden)
//            .disposed(by: disposeBag)
//
//        barcodeReader.sessionRunning
//            .map { !$0 }
//            .drive(captureDiscriptionStackView.rx.isHidden)
//            .disposed(by: disposeBag)
//        
//        barcodeReader.sessionRunning
//            .asObservable()
//            .subscribe(with: self, onNext: { Object, Bool in
//                Object.textLayer.isHidden = Bool
//            })
//            .disposed(by: disposeBag)
//        
//        UIApplication.rx.didBecomeActive
//            .subscribe(with: self, onNext: { Object, _ in
//                Object.cameraSettingView.isHidden = AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .authorized
//            })
//            .disposed(by: disposeBag)
//
//        let output = viewModel.transform(input: input)
//        
//        output.url.asObservable()
//            .filter { $0 != nil }
//            .subscribe(with: self, onNext: { Object, String in
//                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
//                Object.barcodeReader.quitSession()
//            })
//            .disposed(by: disposeBag)
//    }
//}

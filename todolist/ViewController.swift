import UIKit

class ViewController: UIViewController {
    

    private lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Add task"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var HorizontalstackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textField, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var VerticalstackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [HorizontalstackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(VerticalstackView)

        
        NSLayoutConstraint.activate([
            VerticalstackView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 40),
            VerticalstackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    
    
    @objc private func buttonTapped() {
        if let task = textField.text, !task.isEmpty {
            print("input is \(task)")
        }
        
    }
}

#Preview {
    ViewController()
}

import UIKit

final class RegisterViewController: UIViewController {
    let presenter = RegisterPresent()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "informe seu email de registro", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray.withAlphaComponent(0.6)])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 12, weight: .semibold)
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "informe sua senha de registro", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray.withAlphaComponent(0.6)])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 12, weight: .semibold)
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Registrar", for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        presenter.delegate = self
    }
    
    @objc func tappedRegisterButton() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            let userModel = UserModel(email: email, password: password)
            presenter.register(userModel: userModel)
        } else {
            showMessage(title: "Algo esta errado", message: "Tente Novamente")
        }
    }
    
    private func commonInit() {
        setupHierarchy()
        setupConstraints()
        setupStyle()
    }
    
    private func setupHierarchy() {
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(enterButton)
        view.addSubview(registerButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            emailTextField.widthAnchor.constraint(equalToConstant: 80),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            passwordTextField.widthAnchor.constraint(equalToConstant: 80),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            enterButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 10),
            enterButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            enterButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
    private func setupStyle() {
        view.backgroundColor = .systemMint
    }
}

extension RegisterViewController: RegisterPresentDelegate {
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func goHome() {
        let home = HomeViewController()
        home.modalPresentationStyle = .fullScreen
        present(home, animated: true)
    }
    
}

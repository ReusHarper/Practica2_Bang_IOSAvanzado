
// Dependencies
import UIKit
import AVFoundation
import AVFAudio

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet var volumeSlider: UISlider!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Agregacion del slider de volumen en el stack de vistas
        self.view.addSubview(volumeSlider)
        volumeSlider.addTarget(self, action: #selector(volumeChanged), for: .valueChanged)
        
        // Agregacion del slider de volumen en el stack de vistas
        setAudio()
    }

    // Deteccion de aceleracion (Sacudida) en el dispositivo
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("Movimiento")
        audioPlayer.play()
    }
    
    // Carga de archivo de audio MP3
    func setAudio() {
        guard let URL = Bundle.main.url(forResource: "loud_bang", withExtension: "mp3")
        else {
            print("ERROR: El archivo no se encuentra disponible")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL)
            startInterface()
        } catch {
            print("ERROR: No se logro reproducir el audio, \(error.localizedDescription)")
        }
    }
    
    // Establecimiento del control del slider de volumen
    func startInterface() {
        audioPlayer.delegate = self
        audioPlayer.volume = 0.5
    }
    
    // Modificar el volumen mediante un slider
    @IBAction func volumeChanged(_ sender: Any) {
        audioPlayer.volume = volumeSlider.value
    }
    
}

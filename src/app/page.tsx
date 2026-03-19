import Link from 'next/link';
import { Shield, Settings, Wrench } from 'lucide-react';

export default function Home() {
  return (
    <div className="min-h-screen bg-slate-50 p-8 flex flex-col items-center justify-center">
      
      {/* En-tête de l'application */}
      <header className="mb-16 text-center">
        <h1 className="text-5xl font-extrabold text-slate-900 tracking-tight mb-4">
          Technelec <span className="text-blue-600">Nexus</span>
        </h1>
        <p className="text-xl text-slate-500 font-medium">
          Plateforme d'Analyse Industrielle & Gestion de Production
        </p>
      </header>

      {/* Menu des Gammes (Les 3 gros boutons) */}
      <main className="max-w-6xl w-full grid grid-cols-1 md:grid-cols-3 gap-8">
        
        {/* Carte VST */}
        <Link 
          href="/gamme/VST" 
          className="group bg-white rounded-3xl shadow-sm hover:shadow-xl transition-all duration-300 p-10 border border-slate-200 flex flex-col items-center cursor-pointer hover:-translate-y-2"
        >
          <div className="h-20 w-20 bg-blue-50 text-blue-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-blue-600 group-hover:text-white transition-colors duration-300">
            <Shield size={40} />
          </div>
          <h2 className="text-3xl font-bold text-slate-800 mb-2">Gamme VST</h2>
          <p className="text-slate-500 text-center">Systèmes de sécurité verticaux, chariots et rails.</p>
        </Link>

        {/* Carte HST */}
        <Link 
          href="/gamme/HST" 
          className="group bg-white rounded-3xl shadow-sm hover:shadow-xl transition-all duration-300 p-10 border border-slate-200 flex flex-col items-center cursor-pointer hover:-translate-y-2"
        >
          <div className="h-20 w-20 bg-orange-50 text-orange-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-orange-600 group-hover:text-white transition-colors duration-300">
            <Wrench size={40} />
          </div>
          <h2 className="text-3xl font-bold text-slate-800 mb-2">Gamme HST</h2>
          <p className="text-slate-500 text-center">Systèmes de sécurité horizontaux et cintrages.</p>
        </Link>

        {/* Carte VSTL */}
        <Link 
          href="/gamme/VSTL" 
          className="group bg-white rounded-3xl shadow-sm hover:shadow-xl transition-all duration-300 p-10 border border-slate-200 flex flex-col items-center cursor-pointer hover:-translate-y-2"
        >
          <div className="h-20 w-20 bg-emerald-50 text-emerald-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-emerald-600 group-hover:text-white transition-colors duration-300">
            <Settings size={40} />
          </div>
          <h2 className="text-3xl font-bold text-slate-800 mb-2">Gamme VSTL</h2>
          <p className="text-slate-500 text-center">Échelles de sécurité et composants spécifiques.</p>
        </Link>

      </main>
      
      {/* Pied de page */}
      <footer className="mt-20 text-slate-400 text-sm">
        © 2026 Technelec - Module Catalogue
      </footer>
    </div>
  );
}
import { 
  Home as HomeIcon, Hammer, Wrench, Zap, Droplet, Sprout, Paintbrush, 
  Sofa, Frame, Fan, Anvil, Bug, Waves, Layers, Car, Wrench as Mechanic, 
  Truck, Search, Activity, Heart, Stethoscope, Carrot, Scissors, Dog, 
  Book, Monitor, Video, BookOpen, Music, PartyPopper, Camera, Gift, 
  ChefHat, GlassWater, Sun, Recycle, Bike, Leaf, Globe, Megaphone, 
  PenTool, Code, Smartphone, Database, Shield, Cpu, Package
} from 'lucide-react'

export interface Category {
  id: string
  name: string
  icon: React.ElementType
  color: string
  bg: string
  macroSegment: string
}

export const CATEGORIES: Category[] = [
  // Home & Services
  { id: 'imobiliaria', name: 'Imobiliárias', icon: HomeIcon, color: 'text-blue-600', bg: 'bg-blue-50', macroSegment: 'home' },
  { id: 'pedreiro', name: 'Pedreiros', icon: Hammer, color: 'text-amber-800', bg: 'bg-amber-50', macroSegment: 'home' },
  { id: 'marido_aluguel', name: 'Marido de Aluguel', icon: Wrench, color: 'text-slate-600', bg: 'bg-slate-50', macroSegment: 'home' },
  { id: 'eletricista', name: 'Eletricistas', icon: Zap, color: 'text-yellow-600', bg: 'bg-yellow-50', macroSegment: 'home' },
  { id: 'encanador', name: 'Encanadores', icon: Droplet, color: 'text-cyan-600', bg: 'bg-cyan-50', macroSegment: 'home' },
  { id: 'jardineiro', name: 'Jardineiros', icon: Sprout, color: 'text-green-600', bg: 'bg-green-50', macroSegment: 'home' },
  { id: 'pintor', name: 'Pintores', icon: Paintbrush, color: 'text-purple-600', bg: 'bg-purple-50', macroSegment: 'home' },
  { id: 'montador_moveis', name: 'Montador Móveis', icon: Sofa, color: 'text-indigo-600', bg: 'bg-indigo-50', macroSegment: 'home' },
  { id: 'vidraceiro', name: 'Vidraceiros', icon: Frame, color: 'text-sky-600', bg: 'bg-sky-50', macroSegment: 'home' },
  { id: 'tecnico_ar_condicionado', name: 'Ar Condicionado', icon: Fan, color: 'text-teal-600', bg: 'bg-teal-50', macroSegment: 'home' },
  { id: 'serralheiro', name: 'Serralheiros', icon: Anvil, color: 'text-zinc-600', bg: 'bg-zinc-50', macroSegment: 'home' },
  { id: 'dedetizadora', name: 'Dedetizadoras', icon: Bug, color: 'text-rose-600', bg: 'bg-rose-50', macroSegment: 'home' },
  { id: 'desentupidora', name: 'Desentupidora', icon: Waves, color: 'text-indigo-800', bg: 'bg-indigo-50', macroSegment: 'home' },
  { id: 'gesseiro', name: 'Gesseiro', icon: Layers, color: 'text-stone-600', bg: 'bg-stone-50', macroSegment: 'home' },
  { id: 'lavanderia', name: 'Lavanderias', icon: Droplet, color: 'text-blue-500', bg: 'bg-blue-50', macroSegment: 'home' },
  { id: 'limpeza_pos_obra', name: 'Faxina & Limpeza', icon: Sprout, color: 'text-green-500', bg: 'bg-green-50', macroSegment: 'home' },
  { id: 'personal_organizer', name: 'Personal Organizer', icon: Package, color: 'text-violet-600', bg: 'bg-violet-50', macroSegment: 'home' },

  // Auto
  { id: 'automoveis', name: 'Lojas de Carros', icon: Car, color: 'text-sky-600', bg: 'bg-sky-50', macroSegment: 'auto' },
  { id: 'mecanica', name: 'Mecânicas', icon: Mechanic, color: 'text-gray-600', bg: 'bg-gray-50', macroSegment: 'auto' },
  { id: 'funilaria', name: 'Funilaria e Pintura', icon: Paintbrush, color: 'text-blue-600', bg: 'bg-blue-50', macroSegment: 'auto' },
  { id: 'lava_rapido', name: 'Lava Rápido / Estética', icon: Droplet, color: 'text-cyan-600', bg: 'bg-cyan-50', macroSegment: 'auto' },
  { id: 'auto_eletrica', name: 'Auto Elétrica', icon: Zap, color: 'text-yellow-600', bg: 'bg-yellow-50', macroSegment: 'auto' },
  { id: 'borracharia', name: 'Borracharias', icon: Activity, color: 'text-neutral-600', bg: 'bg-neutral-50', macroSegment: 'auto' },
  { id: 'guincho', name: 'Guinchos 24h', icon: Truck, color: 'text-orange-600', bg: 'bg-orange-50', macroSegment: 'auto' },
  { id: 'despachante', name: 'Despachantes', icon: Search, color: 'text-indigo-600', bg: 'bg-indigo-50', macroSegment: 'auto' },

  // Health
  { id: 'psicologia', name: 'Terapia e Psicologia', icon: Heart, color: 'text-rose-600', bg: 'bg-rose-50', macroSegment: 'health' },
  { id: 'fisioterapia', name: 'Fisioterapia', icon: Activity, color: 'text-blue-600', bg: 'bg-blue-50', macroSegment: 'health' },
  { id: 'odontologia', name: 'Clínicas e Dentistas', icon: Stethoscope, color: 'text-cyan-600', bg: 'bg-cyan-50', macroSegment: 'health' },
  { id: 'nutricao', name: 'Nutricionistas', icon: Carrot, color: 'text-orange-600', bg: 'bg-orange-50', macroSegment: 'health' },
  { id: 'personal_trainer', name: 'Personal e Academias', icon: Activity, color: 'text-emerald-600', bg: 'bg-emerald-50', macroSegment: 'health' },
  { id: 'estetica', name: 'Estética e Beleza', icon: Scissors, color: 'text-fuchsia-600', bg: 'bg-fuchsia-50', macroSegment: 'health' },
  { id: 'podologia', name: 'Podologia', icon: Heart, color: 'text-pink-600', bg: 'bg-pink-50', macroSegment: 'health' },
  { id: 'cuidador', name: 'Cuidadores (Idosos/Crianças)', icon: Heart, color: 'text-red-500', bg: 'bg-red-50', macroSegment: 'health' },

  // Pet
  { id: 'veterinario', name: 'Clínica Veterinária', icon: Stethoscope, color: 'text-blue-600', bg: 'bg-blue-50', macroSegment: 'pet' },
  { id: 'banho_tosa', name: 'Banho e Tosa', icon: Scissors, color: 'text-pink-600', bg: 'bg-pink-50', macroSegment: 'pet' },
  { id: 'pet_shop', name: 'Pet Shops', icon: Dog, color: 'text-orange-600', bg: 'bg-orange-50', macroSegment: 'pet' },
  { id: 'adestramento', name: 'Adestramento', icon: Activity, color: 'text-emerald-600', bg: 'bg-emerald-50', macroSegment: 'pet' },
  { id: 'hotel_pet', name: 'Hotel e Creche Pet', icon: HomeIcon, color: 'text-indigo-600', bg: 'bg-indigo-50', macroSegment: 'pet' },
  { id: 'passeador', name: 'Dog Walker', icon: Dog, color: 'text-green-600', bg: 'bg-green-50', macroSegment: 'pet' },

  // Education
  { id: 'reforco_escolar', name: 'Reforço Escolar', icon: Book, color: 'text-blue-600', bg: 'bg-blue-50', macroSegment: 'education' },
  { id: 'idiomas', name: 'Cursos de Idiomas', icon: Globe, color: 'text-indigo-600', bg: 'bg-indigo-50', macroSegment: 'education' },
  { id: 'musica', name: 'Aulas de Música', icon: Music, color: 'text-purple-600', bg: 'bg-purple-50', macroSegment: 'education' },
  { id: 'informatica', name: 'Cursos de Informática/Tech', icon: Monitor, color: 'text-slate-600', bg: 'bg-slate-50', macroSegment: 'education' },
  { id: 'artes', name: 'Artes e Desenho', icon: Paintbrush, color: 'text-pink-600', bg: 'bg-pink-50', macroSegment: 'education' },
  { id: 'concursos', name: 'Preparatório Concursos', icon: BookOpen, color: 'text-cyan-600', bg: 'bg-cyan-50', macroSegment: 'education' },
  { id: 'cursos_profissionalizantes', name: 'Cursos Profissionalizantes', icon: Wrench, color: 'text-amber-600', bg: 'bg-amber-50', macroSegment: 'education' },

  // Events
  { id: 'buffet', name: 'Buffet e Catering', icon: ChefHat, color: 'text-orange-600', bg: 'bg-orange-50', macroSegment: 'events' },
  { id: 'decoracao_festas', name: 'Decoração de Festas', icon: PartyPopper, color: 'text-pink-600', bg: 'bg-pink-50', macroSegment: 'events' },
  { id: 'fotografia', name: 'Fotografia e Vídeo', icon: Camera, color: 'text-slate-600', bg: 'bg-slate-50', macroSegment: 'events' },
  { id: 'animacao', name: 'Animação e Recreação', icon: PartyPopper, color: 'text-yellow-600', bg: 'bg-yellow-50', macroSegment: 'events' },
  { id: 'aluguel_equipamentos', name: 'Aluguel de Equipamentos', icon: Monitor, color: 'text-blue-600', bg: 'bg-blue-50', macroSegment: 'events' },
  { id: 'musica_eventos', name: 'Bandas e DJs', icon: Music, color: 'text-purple-600', bg: 'bg-purple-50', macroSegment: 'events' },
  { id: 'espaco_eventos', name: 'Espaços para Eventos', icon: HomeIcon, color: 'text-emerald-600', bg: 'bg-emerald-50', macroSegment: 'events' },
  { id: 'bartender', name: 'Bartender', icon: GlassWater, color: 'text-cyan-600', bg: 'bg-cyan-50', macroSegment: 'events' },
  { id: 'lembrancinhas', name: 'Lembrancinhas e Convites', icon: Gift, color: 'text-rose-600', bg: 'bg-rose-50', macroSegment: 'events' },

  // Sustainability
  { id: 'energia_solar', name: 'Painéis Solares', icon: Sun, color: 'text-yellow-600', bg: 'bg-yellow-50', macroSegment: 'sustainability' },
  { id: 'reciclagem', name: 'Coleta / Reciclagem', icon: Recycle, color: 'text-green-600', bg: 'bg-green-50', macroSegment: 'sustainability' },
  { id: 'reparo_bicicletas', name: 'Oficina de Bicicletas', icon: Bike, color: 'text-sky-600', bg: 'bg-sky-50', macroSegment: 'sustainability' },
  { id: 'paisagismo', name: 'Paisagismo Ecológico', icon: Leaf, color: 'text-emerald-600', bg: 'bg-emerald-50', macroSegment: 'sustainability' },
  
  // Digital
  { id: 'marketing_digital', name: 'Marketing Digital', icon: Megaphone, color: 'text-blue-600', bg: 'bg-blue-50', macroSegment: 'digital' },
  { id: 'desenvolvimento_web', name: 'Desenvolvimento Web', icon: Code, color: 'text-slate-600', bg: 'bg-slate-50', macroSegment: 'digital' },
  { id: 'design_grafico', name: 'Design Gráfico', icon: PenTool, color: 'text-pink-600', bg: 'bg-pink-50', macroSegment: 'digital' },
  { id: 'gestao_trafego', name: 'Gestão de Tráfego', icon: Activity, color: 'text-emerald-600', bg: 'bg-emerald-50', macroSegment: 'digital' },
  { id: 'criacao_conteudo', name: 'Criação de Conteúdo', icon: Video, color: 'text-purple-600', bg: 'bg-purple-50', macroSegment: 'digital' },
  { id: 'manutencao_computadores', name: 'Manutenção de Computadores', icon: Monitor, color: 'text-zinc-600', bg: 'bg-zinc-50', macroSegment: 'digital' },
  { id: 'manutencao_celulares', name: 'Manutenção de Celulares', icon: Smartphone, color: 'text-sky-600', bg: 'bg-sky-50', macroSegment: 'digital' },
  { id: 'consultoria_ti', name: 'Consultoria de TI', icon: Cpu, color: 'text-indigo-600', bg: 'bg-indigo-50', macroSegment: 'digital' }
]

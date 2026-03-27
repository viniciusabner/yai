export function buildWhatsAppLink(phone: string | null | undefined, message: string) {
  if (!phone) return '#'
  const clean = phone.replace(/\D/g, '')
  return `https://wa.me/55${clean}?text=${encodeURIComponent(message)}`
}

export function slugify(text: string) {
  return text
    .toString()
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .trim()
    .replace(/\s+/g, '-')
    .replace(/[^\w-]+/g, '')
    .replace(/--+/g, '-')
}

const SUPABASE_URL = 'https://osllygjnozqlspspmfrt.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9zbGx5Z2pub3pxbHNwc3BtZnJ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk2Njc1MjUsImV4cCI6MjA5NTI0MzUyNX0.Yr5kgK5Htcobmt8X02cutdnZ1rgZT4wE02wTpurO0x8';
const db = supabase.createClient(SUPABASE_URL, SUPABASE_KEY);

const SENHA_DASHBOARD = 'seazone2026';

function verificarAcesso() {
  const autenticado = sessionStorage.getItem('rh_autenticado');
  if (!autenticado) {
    window.location.href = 'login.html';
  }
}

function formatarData(data) {
  return new Date(data).toLocaleDateString('pt-BR', {
    day: '2-digit', month: '2-digit', year: 'numeric',
    hour: '2-digit', minute: '2-digit'
  });
}

function copiarTexto(texto, btn) {
  navigator.clipboard.writeText(texto).then(() => {
    const original = btn.innerHTML;
    btn.innerHTML = '✓ Copiado!';
    btn.classList.add('copiado');
    setTimeout(() => { btn.innerHTML = original; btn.classList.remove('copiado'); }, 2000);
  });
}

const STATUS_LABEL = {
  aguardando_gestor: 'Aguardando gestor',
  formulario_preenchido: 'Formulário preenchido',
  em_processo: 'Em processo',
  encerrada: 'Encerrada',
  arquivada: 'Arquivada'
};

const STATUS_COR = {
  aguardando_gestor: 'status-aguardando',
  formulario_preenchido: 'status-preenchido',
  em_processo: 'status-processo',
  encerrada: 'status-encerrada',
  arquivada: 'status-encerrada'
};

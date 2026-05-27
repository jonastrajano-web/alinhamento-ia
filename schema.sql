-- ALINHAMENTO-IA — Schema do banco de dados
-- Execute no SQL Editor do Supabase: Database → SQL Editor → New Query

-- Tabela principal de vagas
CREATE TABLE IF NOT EXISTS vagas (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  titulo TEXT NOT NULL,
  cargo_divulgacao TEXT,
  status TEXT DEFAULT 'aguardando_gestor',
  token_gestor UUID DEFAULT gen_random_uuid() UNIQUE NOT NULL,
  criado_em TIMESTAMPTZ DEFAULT NOW(),
  atualizado_em TIMESTAMPTZ DEFAULT NOW()
);

-- Respostas do formulário do gestor
CREATE TABLE IF NOT EXISTS formulario_gestor (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  vaga_id UUID REFERENCES vagas(id) ON DELETE CASCADE UNIQUE,
  a1_estrutura_time TEXT,
  a2_objetivos_time TEXT,
  a3_desafio_time TEXT,
  a4_motivo_abertura TEXT,
  a5_substituicao TEXT,
  a6_confidencial BOOLEAN DEFAULT FALSE,
  b1_problema TEXT,
  b2_funcoes TEXT,
  b3_senioridade TEXT,
  b4_skills TEXT[],
  c1_habilidades TEXT,
  c2_formacoes TEXT,
  c3_experiencia TEXT,
  c4_eliminatorios TEXT,
  d1_responsavel_entrevista TEXT,
  d2a_responsavel_desafio TEXT,
  d2b_prazo_desafio INTEGER,
  d2c_link_desafio TEXT,
  d3_formato TEXT,
  preenchido_em TIMESTAMPTZ DEFAULT NOW()
);

-- Complementos do recrutador
CREATE TABLE IF NOT EXISTS complemento_recrutador (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  vaga_id UUID REFERENCES vagas(id) ON DELETE CASCADE UNIQUE,
  inegociaveis TEXT,
  skills_priorizadas TEXT[],
  ia_first_aplicacao TEXT,
  red_flags TEXT,
  prioridade TEXT DEFAULT 'normal',
  estrutura_processo TEXT,
  notas_recrutador TEXT,
  atualizado_em TIMESTAMPTZ DEFAULT NOW()
);

-- Trigger: atualiza atualizado_em automaticamente
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.atualizado_em = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_vagas_updated_at
  BEFORE UPDATE ON vagas
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER trigger_complemento_updated_at
  BEFORE UPDATE ON complemento_recrutador
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- RLS: habilitar segurança e criar políticas permissivas para o MVP
ALTER TABLE vagas ENABLE ROW LEVEL SECURITY;
ALTER TABLE formulario_gestor ENABLE ROW LEVEL SECURITY;
ALTER TABLE complemento_recrutador ENABLE ROW LEVEL SECURITY;

CREATE POLICY "acesso_publico_vagas" ON vagas FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "acesso_publico_formulario" ON formulario_gestor FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "acesso_publico_complemento" ON complemento_recrutador FOR ALL USING (true) WITH CHECK (true);
